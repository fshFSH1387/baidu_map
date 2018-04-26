using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace GROUP.Manage
{
    /// <summary>
    /// BaseClass 的摘要说明。
    /// </summary>
    public class BaseClass : System.Web.UI.Page
    {
        String strConn;
        public BaseClass()
        {

            strConn = ConfigurationManager.AppSettings["conn"];

        }

        //读写数据表--DataTable
        public DataTable ReadTable(String strSql)
        {
            DataTable dt = new DataTable();//创建一个数据表dt
            SqlConnection Conn = new SqlConnection(strConn);//定义新的数据连接控件并初始化
            Conn.Open();//打开连接
            SqlDataAdapter Cmd = new SqlDataAdapter(strSql, Conn);//定义并初始化数据适配器
            Cmd.Fill(dt);								//将数据适配器中的数据填充到数据集dt中
            Conn.Close();//关闭连接
            return dt;
        }

        //查找并返回多条数据
        public DataTable rows(string sql, string table)
        {
            DataSet ds = new DataSet();
            SqlConnection Conn = new SqlConnection(strConn);
            Conn.Open();
            SqlDataAdapter Cmd = new SqlDataAdapter(sql, Conn);
            ds = new DataSet();
            Cmd.Fill(ds, table);
            Conn.Close();
            return ds.Tables[table];
        }

        //读写数据集--DataSet
        public DataSet ReadDataSet(String strSql)
        {
            DataSet ds = new DataSet();//创建一个数据集ds
            SqlConnection Conn = new SqlConnection(strConn);//定义新的数据连接控件并初始化
            Conn.Open();//打开连接
            SqlDataAdapter Cmd = new SqlDataAdapter(strSql, Conn);//定义并初始化数据适配器
            Cmd.Fill(ds);								//将数据适配器中的数据填充到数据集ds中
            Conn.Close();//关闭连接
            return ds;
        }

        public DataSet GetDataSet(String strSql, String tableName)
        {
            DataSet ds = new DataSet();//创建一个数据集ds
            SqlConnection Conn = new SqlConnection(strConn);//定义新的数据连接控件并初始化
            Conn.Open();//打开连接
            SqlDataAdapter Cmd = new SqlDataAdapter(strSql, Conn);//定义并初始化数据适配器
            Cmd.Fill(ds, tableName);								//将数据适配器中的数据填充到数据集ds中
            Conn.Close();//关闭连接
            return ds;

        }

        public SqlDataReader readrow(String sql)
        {
            SqlConnection Conn = new SqlConnection(strConn);
            Conn.Open();//连接数据库
            SqlCommand Comm = new SqlCommand(sql, Conn);//定义并初始化Command控件
            SqlDataReader Reader = Comm.ExecuteReader();//创建Reader控件，并添加数据记录
            if (Reader.Read())
            {
                Comm.Dispose();
                return Reader;
            }
            else
            {
                Comm.Dispose();
                return null;
            }//如果Reader不为空，返回Reader，否则返回null

        }

        //读某一行中某一字段的值
        public string Readstr(String strSql, int flag)
        {
            DataSet ds = new DataSet();//创建一个数据集ds
            String str;

            SqlConnection Conn = new SqlConnection(strConn);//定义新的数据连接控件并初始化

            Conn.Open();//打开连接

            SqlDataAdapter Cmd = new SqlDataAdapter(strSql, Conn);//定义并初始化数据适配器
            Cmd.Fill(ds);								//将数据适配器中的数据填充到数据集ds中

            str = ds.Tables[0].Rows[0].ItemArray[flag].ToString();
            Conn.Close();//关闭连接
            return str;
        }


        public void execsql(String strSql)
        {
            SqlConnection Conn = new SqlConnection(strConn);//定义新的数据连接控件并初始化

            SqlCommand Comm = new SqlCommand(strSql, Conn);

            Conn.Open();//打开连接

            Comm.ExecuteNonQuery();//执行命令
            Conn.Close();//关闭连接

        }

    }
}