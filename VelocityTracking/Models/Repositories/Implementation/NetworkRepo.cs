using TreatsApi.Model.Repositories.Interface;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System;

namespace TreatsApi.Model.Repositories.Implementation
{
    public class NetworkRepo : INetworkRepo
    {
        const string _connectionString = @"server=DESKTOP-6Q2U69E;database=VelocityTracking;user=IIS;password=admin123";
       
        public DataSet PostQueryDataTable(string query)
        {
            DataSet dataSet = SqlHelper.ExecuteDataset(_connectionString, CommandType.Text, query);
            return dataSet;
        }
        public DataSet CustomTypeDataTable(string StoredProcedureName, Dictionary<string, object> parameterValues)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    SqlCommand cmd = conn.CreateCommand();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = StoredProcedureName; //The name of the above mentioned stored procedure.  
                    foreach (var para in parameterValues)
                    {
                        SqlParameter param = cmd.Parameters.AddWithValue($"@{para.Key}", para.Value); //Here"@MyUDTableType" is the User-defined Table Type as a parameter.  
                    }
                    conn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        // Fill the DataSet using default values for DataTable names, etc
                        da.Fill(ds);
                        // Detach the SqlParameters from the command object, so they can be used again
                        cmd.Parameters.Clear();
                        conn.Close();
                        // Return the dataset
                        return ds;
                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet CustomTypeDataTable(string StoredProcedureName, Dictionary<string, DataTable> parameterValues)
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = StoredProcedureName; //The name of the above mentioned stored procedure.  
                foreach (var para in parameterValues)
                {
                    SqlParameter param = cmd.Parameters.AddWithValue($"@{para.Key}", para.Value); //Here"@MyUDTableType" is the User-defined Table Type as a parameter.  
                }
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    // Fill the DataSet using default values for DataTable names, etc
                    da.Fill(ds);
                    // Detach the SqlParameters from the command object, so they can be used again
                    cmd.Parameters.Clear();
                    conn.Close();
                    // Return the dataset
                    return ds;
                }

            }
        }






        public DataSet CustomTypeDataTableOpt(SqlConnection conn, string StoredProcedureName, Dictionary<string, object> parameterValues)
        {

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = StoredProcedureName; //The name of the above mentioned stored procedure.  
            foreach (var para in parameterValues)
            {
                SqlParameter param = cmd.Parameters.AddWithValue($"@{para.Key}", para.Value); //Here"@MyUDTableType" is the User-defined Table Type as a parameter.  
            }
            //conn.Open();
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                // Fill the DataSet using default values for DataTable names, etc
                da.Fill(ds);
                // Detach the SqlParameters from the command object, so they can be used again
                cmd.Parameters.Clear();
                //  conn.Close();
                // Return the dataset
                return ds;
            }

        }
        public string Post(string storedProcedure, object[] sqlParameter)
        {

            DataSet dataSet = SqlHelper.ExecuteDataset(_connectionString, storedProcedure, sqlParameter);
            string json = "";
            //string result = "";
            //int i = 0;
            if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
                json = JsonConvert.SerializeObject(dataSet.Tables[0]);
            //while ( i < dataSet.Tables.Count)
            //{
            //    if (dataSet.Tables.Count > 0 && dataSet.Tables[i].Rows.Count > 0 && dataSet.Tables[i].Rows.Count > 0)
            //    {
            //        json = JsonConvert.SerializeObject(dataSet.Tables[i]);

            //        result = string.Concat(result, json);
            //        result = result + "" + json;
            //    }
            //    i++;
            //}
            return json;
        }

        public DataSet PostDataTable(string storedProcedure, object[] sqlParameter)
        {
            DataSet dataSet = SqlHelper.ExecuteDataset(_connectionString, storedProcedure, sqlParameter);
            return dataSet;
        }
        public DataSet Execute(string storedProcedure, object[] sqlParameter)
        {
            DataSet dataSet = SqlHelper.ExecuteDataset(_connectionString, storedProcedure, sqlParameter);
            string json = "";
            if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
            {
                return dataSet;
            }
            return null;
        }


    }
}
