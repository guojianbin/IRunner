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
        //���ݿ������ַ���(web.config������)�����Զ�̬����connectionString֧�ֶ����ݿ�.    
        public static string connectionString = DBPath;
        /// <summary>
        /// ������Ӷ���
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
        /// ����SQLite���ݿ��ļ�
        /// </summary>
        /// <param name="dbPath">Ҫ������SQLite���ݿ��ļ�·��</param>
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
            //��������ڸ����ݿ��ļ����򴴽������ݿ��ļ�
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
                //throw new SqlNullValueException("������ָ�������ı�ṹ!");
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
                //throw new SqlNullValueException("������ָ�������ı�ṹ!");
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

        /// ������Ӱ�������

        /// </summary>

        /// <param name="cmdText">a</param>

        /// <param name="commandParameters">����Ĳ���</param>

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
        /// ��SQLite���ݿ�ִ����ɾ�Ĳ�����������Ӱ���������
        /// </summary>
        /// <param name="sql">Ҫִ�е���ɾ�ĵ�SQL���</param>
        /// <param name="parameters">ִ����ɾ���������Ҫ�Ĳ���������������������SQL����е�˳��Ϊ׼</param>
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
        /// ִ��һ����ѯ��䣬����һ��������SQLiteDataReaderʵ��
        /// </summary>
        /// <param name="sql">Ҫִ�еĲ�ѯ���</param>
        /// <param name="parameters">ִ��SQL��ѯ�������Ҫ�Ĳ���������������������SQL����е�˳��Ϊ׼</param>
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
        /// ִ��һ����ѯ��䣬����һ��������ѯ�����DataTable
        /// </summary>
        /// <param name="sql">Ҫִ�еĲ�ѯ���</param>
        /// <param name="parameters">ִ��SQL��ѯ�������Ҫ�Ĳ���������������������SQL����е�˳��Ϊ׼</param>
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
        /// ��ѯ���ݿ��е���������������Ϣ
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

        /// ����SqlDataReader����

        /// </summary>

        /// <param name="cmdText"></param>

        /// <param name="commandParameters">����Ĳ���</param>

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
        /// ���ؽ�����еĵ�һ�е�һ�У����������л���
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="commandParameters">����Ĳ���</param>
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

        /// ��ҳ

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
        /// ִ�ж���SQL��䣬ʵ�����ݿ�����
        /// </summary>
        /// <param name="SQLStringList">����SQL���</param>        
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
        /// ѹ��
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
       
       

        #region ���÷���

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

        #region  ִ�м�SQL���

        /// <summary>
        /// ִ��SQL��䣬����Ӱ��ļ�¼��
        /// </summary>
        /// <param name="SQLString">SQL���</param>
        /// <returns>Ӱ��ļ�¼��</returns>
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
        /// ִ�д�һ���洢���̲����ĵ�SQL��䡣
        /// </summary>
        /// <param name="SQLString">SQL���</param>
        /// <param name="content">��������,����һ���ֶ��Ǹ�ʽ���ӵ����£���������ţ�����ͨ�������ʽ���</param>
        /// <returns>Ӱ��ļ�¼��</returns>
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
        /// �����ݿ������ͼ���ʽ���ֶ�(������������Ƶ���һ��ʵ��)
        /// </summary>
        /// <param name="strSQL">SQL���</param>
        /// <param name="fs">ͼ���ֽ�,���ݿ���ֶ�����Ϊimage�����</param>
        /// <returns>Ӱ��ļ�¼��</returns>
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
        /// ִ��һ�������ѯ�����䣬���ز�ѯ�����object����
        /// </summary>
        /// <param name="SQLString">�����ѯ������</param>
        /// <returns>��ѯ�����object��</returns>
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
        /// ִ�в�ѯ��䣬����SQLiteDataReader
        /// </summary>
        /// <param name="strSQL">��ѯ���</param>
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
        /// ִ�в�ѯ��䣬����DataSet
        /// </summary>
        /// <param name="SQLString">��ѯ���</param>
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

        #region ִ�д�������SQL���

        /// <summary>
        /// ִ��SQL��䣬����Ӱ��ļ�¼��
        /// </summary>
        /// <param name="SQLString">SQL���</param>
        /// <returns>Ӱ��ļ�¼��</returns>
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
        /// ִ�ж���SQL��䣬ʵ�����ݿ�����
        /// </summary>
        /// <param name="SQLStringList">SQL���Ĺ�ϣ��keyΪsql��䣬value�Ǹ�����SQLiteParameter[]��</param>
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
                        //ѭ��
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
        /// ִ��һ�������ѯ�����䣬���ز�ѯ�����object����
        /// </summary>
        /// <param name="SQLString">�����ѯ������</param>
        /// <returns>��ѯ�����object��</returns>
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
        /// ִ�в�ѯ��䣬����DataSet
        /// </summary>
        /// <param name="SQLString">��ѯ���</param>
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
