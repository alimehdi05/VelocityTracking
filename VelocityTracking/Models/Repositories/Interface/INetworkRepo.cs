using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace TreatsApi.Model.Repositories.Interface
{
    interface INetworkRepo
    {                
        string Post(string storedProcedure, object[] sqlParameter);
        DataSet Execute(string storedProcedure, object[] sqlParameter);

        DataSet PostDataTable(string v, object[] obj);

        DataSet CustomTypeDataTable(string StoredProcedureName, Dictionary<string, object> parameterValues);
        DataSet CustomTypeDataTableOpt(SqlConnection conn, string StoredProcedureName, Dictionary<string, object> parameterValues);
        DataSet PostQueryDataTable(string query);

    }
}
