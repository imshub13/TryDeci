using Newtonsoft.Json;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace OracleToSql.Controllers
{
    public class DataTransferController : ApiController
    {

          [HttpGet]
           public bool LaodDataFromOracle()
           {
               try
               {
                   try
                   {
                       //change oracle connection string
                       string oradb = "Data Source=192.168.21.140:1521/orcl;User ID=SAPBI;Password=sapbi;Unicode=True";
                       OracleConnection oracleConnection = new OracleConnection(oradb);
                       oracleConnection.Open();
                       //need to change oracle table name in below query 
                       OracleCommand command = new OracleCommand("Select * from MFA", oracleConnection);
                       command.CommandType = CommandType.Text;

                       OracleDataReader oracleDataReader = command.ExecuteReader();
                       oracleDataReader.Read();
                       DataTable oracleRecievedData = new DataTable();

                       oracleRecievedData.Load(oracleDataReader);
                       command.Dispose();
                       oracleConnection.Close();
                       try
                       {
                           //need to sql change connection string
                           string sqlConnectionString = "Data Source=SHUBHAM-DESK;Initial Catalog=OracleToSql;User ID=shub13;Password=123";
                     

                           using (var sqlConnection = new SqlConnection(sqlConnectionString))
                           {
                               using (var cmd = new SqlCommand("SaveDataFromOracle", sqlConnection))
                               {
                                   cmd.CommandType = CommandType.StoredProcedure;

                                   var tvp = new SqlParameter
                                   {
                                       ParameterName = "@dt_OracleData",
                                       SqlDbType = SqlDbType.Structured,
                                       Value = oracleRecievedData,
                                       TypeName = "udt_OracleData"
                                   };
                                   cmd.Parameters.Add(tvp);
                                   sqlConnection.Open();
                                   cmd.ExecuteNonQuery();
                               }

                           }

                       }
                       catch (Exception ex)
                       {
                           throw ex;
                       }
                   }
                   catch (Exception ex)
                   {

                   }
                   return true;
               }
               catch (Exception ex)
               {
                   return false;
               }
           }
       }
    }

