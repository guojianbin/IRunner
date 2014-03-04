using System;
using System.Data;
using System.Data.Common;
using System.Data.SQLite;
using System.Data.SqlTypes;

namespace FileSearcher
{
    public class SQLiteHelper
    {
        private static string DBPath = System.Windows.Forms.Application.StartupPath + @"\IRunner.db";
        //数据库连接字符串(web.config来配置)，可以动态更改connectionString支持多数据库.    
        public static string connectionString = DBPath;
        /// <summary>
        /// 获得连接对象
        /// </summary>
        /// <returns></returns>
        public static SQLiteConnection GetSQLiteConnection(string dbPath)
        {
            return new SQLiteConnection("Data Source=" + dbPath);
        }

        public static SQLiteConnection GetSQLiteConnection()
        {
            return new SQLiteConnection("Data Source=" + DBPath);
        }

        /// <summary>
        /// 创建SQLite数据库文件
        /// </summary>
        /// <param name="dbPath">要创建的SQLite数据库文件路径</param>
        public static void CreateDB(string dbPath)
        {
            using (SQLiteConnection connection = GetSQLiteConnection())
            {
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(connection))
                {
                    command.CommandText = "CREATE TABLE InitDBTable(id integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE)";
                    command.ExecuteNonQuery();
                    command.CommandText = "DROP TABLE InitDBTable";
                    command.ExecuteNonQuery();
                }
            }
        }

        public static void CreateDB()
        {
            CreateDB(DBPath);
        }

        public static void DeleteDB(string dbPath)
        {
            if (System.IO.File.Exists(dbPath))
            {
                System.IO.File.Delete(dbPath);
            }
        }

        public static void DeleteDB()
        {
            DeleteDB(DBPath);
        }

        public static void CreateTable()
        {
            string dbPath = DBPath;
            //如果不存在改数据库文件，则创建该数据库文件
            if (!System.IO.File.Exists(dbPath))
            {
                SQLiteHelper.CreateDB(dbPath);
            }
            //string sql = "CREATE TABLE Test3(id integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,Name char(3),TypeName varchar(50),addDate datetime,UpdateTime Date,Time time,Comments blob)";
            string sql = "CREATE TABLE IRunnerTable(Id integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,Name NVARCHAR(30),Py NVARCHAR(30),FilePath NVARCHAR(200))";
            SQLiteHelper.ExecuteNonQuery(sql, null);
        }

        public static void CreateConfigTable()
        {
            string dbPath = DBPath;
            if (!System.IO.File.Exists(dbPath))
            {
                SQLiteHelper.CreateDB(dbPath);
            }
            string sql = "CREATE TABLE t_Ice_Config(ConfigId integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,Name NVARCHAR(30),Value NVARCHAR(1000))";
            SQLiteHelper.ExecuteNonQuery(sql, null);
        }

        public static void CreateExePathTable()
        {
            string sql = "CREATE TABLE t_Ice_ExePath(ExeId integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,ExePath NVARCHAR(1000))";
            SQLiteHelper.ExecuteNonQuery(sql, null);
        }

        public static bool ExistsDB(string sDBPath)
        {
            if (System.IO.File.Exists(sDBPath))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool ExistsDB()
        {
            return ExistsDB(DBPath);
        }

        public static bool ExistsTable(string sTableName)
        {
            string sql = "SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name='" + sTableName + "'" ;
            int count = Convert.ToInt32(ExecuteScalar(sql, null));
            if (count > 0)
            {
                return true;
            }
            else 
            {
                return false;
            }
        }

        public static bool DeleteTable(string sTableName)
        {
            if (ExistsTable(sTableName) == true)
            {
                string sql = "DELETE FROM " + sTableName;
                SQLiteHelper.ExecuteNonQuery(sql, null);
                return true;
            }
            else
            {
                //throw new SqlNullValueException("不存在指定表名的表结构!");
                return true;
            }
            
        }

        public static bool DropTable(string sTableName)
        {
            if (ExistsTable(sTableName) == true)
            {
                string sql = "drop table " + sTableName;
                SQLiteHelper.ExecuteNonQuery(sql, null);
                return true;
            }
            else
            {
                //throw new SqlNullValueException("不存在指定表名的表结构!");
                return true;
            }

        }

        private static void PrepareCommand(SQLiteCommand cmd, SQLiteConnection conn, string cmdText, params object[] p)
        {



            if (conn.State != ConnectionState.Open)

                conn.Open();

            cmd.Parameters.Clear();

            cmd.Connection = conn;

            cmd.CommandText = cmdText;



            cmd.CommandType = CommandType.Text;

            cmd.CommandTimeout = 30;



            if (p != null)
            {

                foreach (object parm in p)

                    cmd.Parameters.AddWithValue(string.Empty, parm);

                //for (int i = 0; i < p.Length; i++)

                //    cmd.Parameters[i].Value = p[i];

            }

        }



        public static DataSet ExecuteDataset(string cmdText, params object[] p)
        {

            DataSet ds = new DataSet();

            SQLiteCommand command = new SQLiteCommand();

            using (SQLiteConnection connection = GetSQLiteConnection())
            {

                PrepareCommand(command, connection, cmdText, p);

                SQLiteDataAdapter da = new SQLiteDataAdapter(command);

                da.Fill(ds);

            }



            return ds;

        }



        public static DataRow ExecuteDataRow(string cmdText, params object[] p)
        {

            DataSet ds = ExecuteDataset(cmdText, p);

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)

                return ds.Tables[0].Rows[0];

            return null;

        }



        /// <summary>

        /// 返回受影响的行数

        /// </summary>

        /// <param name="cmdText">a</param>

        /// <param name="commandParameters">传入的参数</param>

        /// <returns></returns>

        public static int ExecuteNonQuery(string cmdText, params object[] p)
        {

            SQLiteCommand command = new SQLiteCommand();



            using (SQLiteConnection connection = GetSQLiteConnection())
            {

                PrepareCommand(command, connection, cmdText, p);

                return command.ExecuteNonQuery();

            }

        }

        /// <summary>
        /// 对SQLite数据库执行增删改操作，返回受影响的行数。
        /// </summary>
        /// <param name="sql">要执行的增删改的SQL语句</param>
        /// <param name="parameters">执行增删改语句所需要的参数，参数必须以它们在SQL语句中的顺序为准</param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string sql, SQLiteParameter[] parameters)
        {
            int affectedRows = 0;
            using (SQLiteConnection connection = GetSQLiteConnection())
            {
                connection.Open();
                using (DbTransaction transaction = connection.BeginTransaction())
                {
                    using (SQLiteCommand command = new SQLiteCommand(connection))
                    {
                        command.CommandText = sql;
                        if (parameters != null)
                        {
                            command.Parameters.AddRange(parameters);
                        }
                        affectedRows = command.ExecuteNonQuery();
                    }
                    transaction.Commit();
                }
            }
            return affectedRows;
        }
        /// <summary>
        /// 执行一个查询语句，返回一个关联的SQLiteDataReader实例
        /// </summary>
        /// <param name="sql">要执行的查询语句</param>
        /// <param name="parameters">执行SQL查询语句所需要的参数，参数必须以它们在SQL语句中的顺序为准</param>
        /// <returns></returns>
        public static SQLiteDataReader ExecuteReader(string sql, SQLiteParameter[] parameters)
        {
            SQLiteConnection connection = new SQLiteConnection(connectionString);
            SQLiteCommand command = new SQLiteCommand(sql, connection);
            if (parameters != null)
            {
                command.Parameters.AddRange(parameters);
            }
            connection.Open();
            return command.ExecuteReader(CommandBehavior.CloseConnection);
        }
        /// <summary>
        /// 执行一个查询语句，返回一个包含查询结果的DataTable
        /// </summary>
        /// <param name="sql">要执行的查询语句</param>
        /// <param name="parameters">执行SQL查询语句所需要的参数，参数必须以它们在SQL语句中的顺序为准</param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string sql, SQLiteParameter[] parameters)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                using (SQLiteCommand command = new SQLiteCommand(sql, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }
                    SQLiteDataAdapter adapter = new SQLiteDataAdapter(command);
                    DataTable data = new DataTable();
                    adapter.Fill(data);
                    return data;
                }
            }

        }

        /// <summary>
        /// 查询数据库中的所有数据类型信息
        /// </summary>
        /// <returns></returns>
        public static DataTable GetSchema()
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();
                DataTable data = connection.GetSchema("TABLES");
                connection.Close();
                //foreach (DataColumn column in data.Columns)
                //{
                //        Console.WriteLine(column.ColumnName);
                //}
                return data;
            }
        }


        /// <summary>

        /// 返回SqlDataReader对象

        /// </summary>

        /// <param name="cmdText"></param>

        /// <param name="commandParameters">传入的参数</param>

        /// <returns></returns>

        public static SQLiteDataReader ExecuteReader(string cmdText, params object[] p)
        {
            SQLiteCommand command = new SQLiteCommand();
            SQLiteConnection connection = GetSQLiteConnection();
            try
            {
                PrepareCommand(command, connection, cmdText, p);
                SQLiteDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                return reader;
            }

            catch
            {

                connection.Close();

                throw;

            }

        }

        /// <summary>
        /// 返回结果集中的第一行第一列，忽略其他行或列
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="commandParameters">传入的参数</param>
        /// <returns></returns>
        public static object ExecuteScalar(string cmdText, params object[] p)
        {
            SQLiteCommand cmd = new SQLiteCommand();
            using (SQLiteConnection connection = GetSQLiteConnection())
            {
                PrepareCommand(cmd, connection, cmdText, p);
                return cmd.ExecuteScalar();
            }

        }



        /// <summary>

        /// 分页

        /// </summary>

        /// <param name="recordCount"></param>

        /// <param name="pageIndex"></param>

        /// <param name="pageSize"></param>

        /// <param name="cmdText"></param>

        /// <param name="countText"></param>

        /// <param name="p"></param>

        /// <returns></returns>

        public static DataSet ExecutePager(ref int recordCount, int pageIndex, int pageSize, string cmdText, string countText, params object[] p)
        {

            if (recordCount < 0)

                recordCount = int.Parse(ExecuteScalar(countText, p).ToString());



            DataSet ds = new DataSet();



            SQLiteCommand command = new SQLiteCommand();

            using (SQLiteConnection connection = GetSQLiteConnection())
            {

                PrepareCommand(command, connection, cmdText, p);

                SQLiteDataAdapter da = new SQLiteDataAdapter(command);

                da.Fill(ds, (pageIndex - 1) * pageSize, pageSize, "result");

            }

            return ds;

        }

        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">多条SQL语句</param>        
        public static void ExecuteSqlTran(System.Collections.ArrayList SQLStringList)
        {
            using (SQLiteConnection conn = GetSQLiteConnection())
            {
                conn.Open();
                SQLiteCommand cmd = new SQLiteCommand();
                cmd.Connection = conn;
                SQLiteTransaction tx = conn.BeginTransaction();
                cmd.Transaction = tx;
                try
                {
                    string strsql = string.Empty;
                    for (int n = 0; n < SQLStringList.Count; n++)
                    {
                        strsql = SQLStringList[n].ToString();
                        if (strsql.Trim().Length > 1)
                        {
                            cmd.CommandText = strsql;
                            cmd.ExecuteNonQuery();
                        }
                    }
                    tx.Commit();
                }
                catch (System.Data.SQLite.SQLiteException E)
                {
                    tx.Rollback();
                    throw new Exception(E.Message);
                }
            }
        }

        /// <summary>
        /// 压缩
        /// </summary>
        public static void ExecuteVACUUM()
        {
            using (SQLiteConnection conn = GetSQLiteConnection())
            {
                conn.Open();
                SQLiteCommand cmd = new SQLiteCommand("VACUUM",conn);
                
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (System.Data.SQLite.SQLiteException E)
                {
                    throw new Exception(E.Message);
                }
            }
        }
       
       

        #region 公用方法

        public static int GetMaxID(string FieldName, string TableName)
        {
            string strsql = "select max(" + FieldName + ")+1 from " + TableName;
            object obj = GetSingle(strsql);
            if (obj == null)
            {
                return 1;
            }
            else
            {
                return int.Parse(obj.ToString());
            }
        }

        public static bool Exists(string strSql)
        {
            object obj = GetSingle(strSql);
            int cmdresult;
            if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
            {
                cmdresult = 0;
            }
            else
            {
                cmdresult = int.Parse(obj.ToString());
            }
            if (cmdresult == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public static bool Exists(string strSql, params SQLiteParameter[] cmdParms)
        {
            object obj = GetSingle(strSql, cmdParms);
            int cmdresult;
            if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
            {
                cmdresult = 0;
            }
            else
            {
                cmdresult = int.Parse(obj.ToString());
            }
            if (cmdresult == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        #endregion

        #region  执行简单SQL语句

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                using (SQLiteCommand cmd = new SQLiteCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows;
                    }
                    catch (System.Data.SQLite.SQLiteException E)
                    {
                        connection.Close();
                        throw new Exception(E.Message);
                    }
                }
            }
        }


        /// <summary>
        /// 执行带一个存储过程参数的的SQL语句。
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <param name="content">参数内容,比如一个字段是格式复杂的文章，有特殊符号，可以通过这个方式添加</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString, string content)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                SQLiteCommand cmd = new SQLiteCommand(SQLString, connection);
                SQLiteParameter myParameter = new SQLiteParameter("@content", DbType.String);
                myParameter.Value = content;
                cmd.Parameters.Add(myParameter);
                try
                {
                    connection.Open();
                    int rows = cmd.ExecuteNonQuery();
                    return rows;
                }
                catch (System.Data.SQLite.SQLiteException E)
                {
                    throw new Exception(E.Message);
                }
                finally
                {
                    cmd.Dispose();
                    connection.Close();
                }
            }
        }
        /// <summary>
        /// 向数据库里插入图像格式的字段(和上面情况类似的另一种实例)
        /// </summary>
        /// <param name="strSQL">SQL语句</param>
        /// <param name="fs">图像字节,数据库的字段类型为image的情况</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSqlInsertImg(string strSQL, byte[] fs)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                SQLiteCommand cmd = new SQLiteCommand(strSQL, connection);
                SQLiteParameter myParameter = new SQLiteParameter("@fs", DbType.Binary);
                myParameter.Value = fs;
                cmd.Parameters.Add(myParameter);
                try
                {
                    connection.Open();
                    int rows = cmd.ExecuteNonQuery();
                    return rows;
                }
                catch (System.Data.SQLite.SQLiteException E)
                {
                    throw new Exception(E.Message);
                }
                finally
                {
                    cmd.Dispose();
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="SQLString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        public static object GetSingle(string SQLString)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                using (SQLiteCommand cmd = new SQLiteCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        object obj = cmd.ExecuteScalar();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (System.Data.SQLite.SQLiteException e)
                    {
                        connection.Close();
                        throw new Exception(e.Message);
                    }
                }
            }
        }
        /// <summary>
        /// 执行查询语句，返回SQLiteDataReader
        /// </summary>
        /// <param name="strSQL">查询语句</param>
        /// <returns>SQLiteDataReader</returns>
        public static SQLiteDataReader ExecuteReader(string strSQL)
        {
            SQLiteConnection connection = new SQLiteConnection(connectionString);
            SQLiteCommand cmd = new SQLiteCommand(strSQL, connection);
            try
            {
                connection.Open();
                SQLiteDataReader myReader = cmd.ExecuteReader();
                return myReader;
            }
            catch (System.Data.SQLite.SQLiteException e)
            {
                throw new Exception(e.Message);
            }

        }
        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="SQLString">查询语句</param>
        /// <returns>DataSet</returns>
        public static DataSet Query(string SQLString)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    SQLiteDataAdapter command = new SQLiteDataAdapter(SQLString, connection);
                    command.Fill(ds, "ds");
                }
                catch (System.Data.SQLite.SQLiteException ex)
                {
                    throw new Exception(ex.Message);
                }
                return ds;
            }
        }


        #endregion

        #region 执行带参数的SQL语句

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString, params SQLiteParameter[] cmdParms)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                using (SQLiteCommand cmd = new SQLiteCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return rows;
                    }
                    catch (System.Data.SQLite.SQLiteException E)
                    {
                        throw new Exception(E.Message);
                    }
                }
            }
        }


        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">SQL语句的哈希表（key为sql语句，value是该语句的SQLiteParameter[]）</param>
        public static void ExecuteSqlTran(System.Collections.Hashtable SQLStringList)
        {
            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();
                using (SQLiteTransaction trans = conn.BeginTransaction())
                {
                    SQLiteCommand cmd = new SQLiteCommand();
                    try
                    {
                        //循环
                        foreach (System.Collections.DictionaryEntry myDE in SQLStringList)
                        {
                            string cmdText = myDE.Key.ToString();
                            SQLiteParameter[] cmdParms = (SQLiteParameter[])myDE.Value;
                            PrepareCommand(cmd, conn, trans, cmdText, cmdParms);
                            int val = cmd.ExecuteNonQuery();
                            cmd.Parameters.Clear();

                            trans.Commit();
                        }
                    }
                    catch
                    {
                        trans.Rollback();
                        throw;
                    }
                }
            }
        }


        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="SQLString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        public static object GetSingle(string SQLString, params SQLiteParameter[] cmdParms)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                using (SQLiteCommand cmd = new SQLiteCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        object obj = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (System.Data.SQLite.SQLiteException e)
                    {
                        throw new Exception(e.Message);
                    }
                }
            }
        }

     
        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="SQLString">查询语句</param>
        /// <returns>DataSet</returns>
        public static DataSet Query(string SQLString, params SQLiteParameter[] cmdParms)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                SQLiteCommand cmd = new SQLiteCommand();
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                using (SQLiteDataAdapter da = new SQLiteDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "ds");
                        cmd.Parameters.Clear();
                    }
                    catch (System.Data.SQLite.SQLiteException ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    return ds;
                }
            }
        }


        private static void PrepareCommand(SQLiteCommand cmd, SQLiteConnection conn, SQLiteTransaction trans, string cmdText, SQLiteParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;
            cmd.CommandType = CommandType.Text;//cmdType;
            if (cmdParms != null)
            {
                foreach (SQLiteParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }

        #endregion


    }
}
