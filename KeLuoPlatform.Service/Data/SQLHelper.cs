using System;
using System.Data;
using MySql.Data.MySqlClient;
using KeLuoPlatform.Common;
using Microsoft.Extensions.Configuration;

namespace KeLuoPlatform.Service.Data
{
   public static class SQLHelper
    {
        private static IConfiguration _config = Configuration.Load();

        private static readonly string conn= _config.GetConnectionString("Conn");

        /// <summary>
        /// 增、删、改的方法[ExecuteNonQuery] 返回所影响的行数，执行其他
        /// </summary>
        /// <param name="sql">Sql命令</param>
        /// <param name="cmdtype">SQL语句（CommandType.Text）或者存储过程(CommandType.StoredProcedure)</param>
        /// <param name="pms"></param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string sql, CommandType cmdtype, params MySqlParameter[] pms)
        {
            int i = -1;
            try
            {
                using (MySqlConnection con = new MySqlConnection(conn))
                {
                    using (MySqlCommand cmd = new MySqlCommand(sql, con))
                    {
                        //存储过程或者Sql语句
                        cmd.CommandType = cmdtype;
                        if (pms != null)
                        {
                            cmd.Parameters.AddRange(pms);
                        }

                        con.Open();
                        i = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }

            return i;
        }

        /// <summary>
        /// 执行查询、查询多少条数据；返回第一行，第一列方法[ExecuteScalar] 返回-1执行失败 
        /// </summary>
        /// <param name="sql">Sql命令</param>
        /// <param name="cmdtype">SQL语句（CommandType.Text）或者存储过程(CommandType.StoredProcedure)</param>
        /// <param name="pms"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string sql, CommandType cmdtype, params MySqlParameter[] pms)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(conn))
                {
                    using (MySqlCommand cmd = new MySqlCommand(sql, con))
                    {
                        //存储过程或者Sql语句
                        cmd.CommandType = cmdtype;
                        if (pms != null)
                        {
                            cmd.Parameters.AddRange(pms);
                        }

                        con.Open();
                        return cmd.ExecuteScalar();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// 执行查询，返回多行、多列的方法ExecuteReader()
        /// </summary>
        /// <param name="sql">Sql命令</param>
        /// <param name="cmdtype">SQL语句（CommandType.Text）或者存储过程(CommandType.StoredProcedure)</param>
        /// <param name="pms"></param>
        /// <returns></returns>
        public static MySqlDataReader ExecuteReader(string sql, CommandType cmdtype, params MySqlParameter[] pms)
        {
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                using (MySqlCommand cmd = new MySqlCommand(sql, con))
                {
                    //存储过程或者Sql语句
                    cmd.CommandType = cmdtype;
                    if (pms != null)
                    {
                        cmd.Parameters.AddRange(pms);
                    }

                    try
                    {
                        con.Open();
                        return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    }
                    catch
                    {
                        con.Close();
                        con.Dispose();
                        throw;
                    }
                }
            }
        }

        /// <summary>
        /// 执行返回多个查询时使用,返回DataTable类型
        /// </summary>
        /// <param name="sql">Sql命令</param>
        /// <param name="cmdtype">SQL语句（CommandType.Text）或者存储过程(CommandType.StoredProcedure)</param>
        /// <param name="pms">参数</param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string sql, CommandType cmdtype, params MySqlParameter[] pms)
        {
            DataTable dt = new DataTable();
            try
            {
                //通过adapter读取数据。
                using (MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn))
                {
                    adapter.SelectCommand.CommandType = cmdtype;
                    if (pms != null)
                    {
                        adapter.SelectCommand.Parameters.AddRange(pms);
                    }

                    adapter.Fill(dt);
                    return dt;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// 需要获得多个结果集的时候用该方法，返回DataSet对象。
        /// </summary>
        /// <param name="sql语句"></param>
        /// <returns></returns>

        public static DataSet ExecuteDataSet(string sql, params MySqlParameter[] paras)
        {
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                //数据适配器
                MySqlDataAdapter sqlda = new MySqlDataAdapter(sql, con);
                sqlda.SelectCommand.Parameters.AddRange(paras);
                DataSet ds = new DataSet();
                sqlda.Fill(ds);
                return ds;
                //不需要打开和关闭链接.
            }
        }

    }
}
