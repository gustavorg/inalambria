using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace inalambria.Library
{
    public class MsSqlExtensions
    {
        private string connString = "";

        public MsSqlExtensions()
        {
            this.connString = CommonExtensions.Constants.ConnectionString;
        }

        public DataTable ExecuteDataTable(string procedureName, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(this.connString);
            SqlCommand cmd = cnn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = procedureName;
            if(parameters!=null)
            {
                cmd.Parameters.AddRange(parameters);
            }
            cnn.Open();
            SqlDataReader dtr = cmd.ExecuteReader();
            DataTable rtn = new DataTable();
            rtn.Load(dtr);
            cnn.Close();
            return rtn;
        }

        public SqlParameter[] ExecuteNonQuery(string procedureName, params SqlParameter[] parameters)
        {
            SqlConnection cnn = new SqlConnection(this.connString);
            SqlCommand cmd = cnn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = procedureName;
            if (parameters != null)
            {
                cmd.Parameters.AddRange(parameters);
            }
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            SqlParameter[] rtn = parameters.Where(x => x.Direction.Equals(ParameterDirection.Output)).ToArray();
            return rtn;
        }
    }
}
