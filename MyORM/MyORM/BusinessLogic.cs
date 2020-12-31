﻿using MyORM.Attributes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace MyORM
{
    public class BusinessLogic : IBusinessLogic
    {
        public string GetTableNameAttribute<T>()
        {
            var attributes = typeof(T).GetCustomAttributes(typeof(TableAttribute), true);
            if (attributes.Length == 0)
            {
                return null;
            }
            else
            {
                string tableAttributeName = ((TableAttribute)attributes[0]).TableName;
                return tableAttributeName;
            }
        }

        public void AddDataToObj<T>(IDataReader reader, T obj)
        {
            var properties = obj.GetType().GetProperties();

            int index = 0;

            foreach (var property in properties)
            {
                if (reader[index] != DBNull.Value)
                    property.SetValue(obj, reader[index++]);
            }
        }

        public string GetColumnNameAttribute(object[] attributes)
        {
            foreach (var attribute in attributes)
            {
                if (((ColumnAttribute)attribute).ColumnName != null)
                {
                    return ((ColumnAttribute)attribute).ColumnName;
                }
            }
            return null;
        }

        public List<string> GetFields<T>(T obj)
        {
            List<string> fields = new List<string>();
            var properties = obj.GetType().GetProperties();
            for (int i = 0; i < properties.Length; i++)
            {
                if (properties[i].GetValue(obj, null) == null) continue;

                var attributes = properties[i].GetCustomAttributes(false);  //lay tat ca cac attributes cua property

                bool isAutoIncreaseProperty = CheckIsAutoIncreaseKey(attributes); // kiem tra xem co phai la key auto increase hay k?
                if (isAutoIncreaseProperty) continue; // neu la key tu tang thi khong them value cua no vao string value

                string columnNameAttribute = GetColumnNameAttribute(attributes);

                if (columnNameAttribute != null) fields.Add(columnNameAttribute);
                else fields.Add(properties[i].Name);
            }

            return fields;
        }

        public List<string> GetValues<T>(T obj)
        {
            List<string> values = new List<string>();  //ket qua values cho insert => VD values = abc,xyz,1
            var properties = obj.GetType().GetProperties();  //lay tat ca cac propety cua doi tuong hien tai

            for (int i = 0; i < properties.Length; i++)
            {
                if (properties[i].GetValue(obj, null) == null) continue;

                var attributes = properties[i].GetCustomAttributes(false);  //lay tat ca cac attributes cua property

                bool isAutoIncreaseProperty = CheckIsAutoIncreaseKey(attributes); // kiem tra xem co phai la key auto increase hay k?
                if (isAutoIncreaseProperty) continue; // neu la key tu tang thi khong them value cua no vao string value

                if (properties[i].GetValue(obj, null).GetType() == typeof(string))
                {
                    StringBuilder value = new StringBuilder();
                    value.Append("'");
                    value.Append(properties[i].GetValue(obj, null));
                    value.Append("'");

                    values.Add(value.ToString());
                }
                else
                {
                    values.Add(properties[i].GetValue(obj, null).ToString());
                }
            }

            return values;
        }

        public bool CheckIsAutoIncreaseKey(object[] attributes)
        {
            foreach (var attribute in attributes)
            {
                if (((ColumnAttribute)attribute).IsAutoIncreaseKey == true)
                {
                    return true;
                }
            }
            return false;
        }

        public string ConvertLambdaExpressionToQueryString(Expression body)
        {
            //Console.WriteLine(body.GetType().BaseType);
            if (body == null)
            {
                return string.Empty;
            }
            if (body is ConstantExpression)
            {
                try
                {
                    if ((((ConstantExpression)body).Value) == null)
                    {
                        return "NULL";
                    }
                    else if (((ConstantExpression)body).Value.GetType() == typeof(string))
                    {
                        return '\'' + (((ConstantExpression)body).Value).ToString() + '\'';
                    }
                    return (((ConstantExpression)body).Value).ToString();
                }
                catch (Exception)
                {
                    return "NULL";
                }
            }
            if (body is MemberExpression)
            {
                //Chuyen doi sang columnname (neu co)
                var properties = ((MemberExpression)body).Expression.Type.GetProperties();
                for (int i = 0; i < properties.Length; i++)
                {
                    if (properties[i].Name == ((MemberExpression)body).Member.Name)
                    {
                        var attributes = properties[i].GetCustomAttributes(false);  //lay tat ca cac attributes cua property


                        foreach (var attribute in attributes)
                        {
                            if (((ColumnAttribute)attribute).ColumnName != null)
                            {
                                return ((ColumnAttribute)attribute).ColumnName;
                            }
                        }
                    }
                }
                return ((MemberExpression)body).Member.Name;
            }
            if (body is BinaryExpression)
            {
                return ConvertLambdaExpressionToQueryString(((BinaryExpression)body).Left)
                    + ConvertLambdaExpressionTypeToQueryString(((BinaryExpression)body).NodeType)
                    + ConvertLambdaExpressionToQueryString(((BinaryExpression)body).Right);
            }
            if (body is LambdaExpression)
            {
                return ConvertLambdaExpressionToQueryString(((LambdaExpression)body).Body);
            }
            return "";
        }

        //Chuyen LambdaExpression sang Query String
        public string ConvertLambdaExpressionTypeToQueryString(ExpressionType nodeType)
        {
            if (nodeType.Equals(ExpressionType.AndAlso))
            {
                return " AND ";
            }
            else if (nodeType.Equals(ExpressionType.And))
            {
                return " AND ";
            }
            else if (nodeType.Equals(ExpressionType.Or))
            {
                return " OR ";
            }
            else if (nodeType.Equals(ExpressionType.OrElse))
            {
                return " OR ";
            }
            else if (nodeType.Equals(ExpressionType.GreaterThan))
            {
                return " > ";
            }
            else if (nodeType.Equals(ExpressionType.GreaterThanOrEqual))
            {
                return " >= ";
            }
            else if (nodeType.Equals(ExpressionType.LessThan))
            {
                return " < ";
            }
            else if (nodeType.Equals(ExpressionType.LessThanOrEqual))
            {
                return " < ";
            }
            else if (nodeType.Equals(ExpressionType.Equal))
            {
                return " = ";
            }
            else if (nodeType.Equals(ExpressionType.NotEqual))
            {
                return " != ";
            }
            return "";
        }

        public string GetIdentityColumnNameAttribute(object[] attributes)
        {
            foreach (var attribute in attributes)
            {
                if (((ColumnAttribute)attribute).IsPrimaryKey != null)
                {
                    return ((ColumnAttribute)attribute).ColumnName;
                }
            }
            return null;
        }

        public string GetIdentityField<T>(T obj) where T : new()
        {
            var properties = obj.GetType().GetProperties();
            for (int i = 0; i < properties.Length; i++)
            {
                if (properties[i].GetValue(obj, null) == null) continue;

                var attributes = properties[i].GetCustomAttributes(false);  //Lay tat ca cac attributes cua property

                string identityColumnNameAttribute = GetIdentityColumnNameAttribute(attributes);

                if (identityColumnNameAttribute != null)
                {
                    return identityColumnNameAttribute;
                }
            }

            return "";
        }


        public int GetIdentityValue<T>(T obj) where T : new()
        {
            var properties = obj.GetType().GetProperties();  //Lay tat ca cac propety cua doi tuong hien tai

            for (int i = 0; i < properties.Length; i++)
            {
                if (properties[i].GetValue(obj, null) == null) continue;

                var attributes = properties[i].GetCustomAttributes(false);  //Lay tat ca cac attributes cua property


                string identityColumnNameAttribute = GetIdentityColumnNameAttribute(attributes);

                if (identityColumnNameAttribute != null)
                {
                    return int.Parse(properties[i].GetValue(obj, null).ToString());
                }
            }
            return -1;
        }
    }
}