using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
namespace DataBaseOperator
{
    public class MSSQLHelper:IDataBaseHelper
    {
        /// <summary> 
        /// 数据库连接字符串 
        /// </summary> 
        private string _ConnectionString;
        /// <summary> 
        /// SQL操作语句 
        /// </summary> 
        public string StrSQL;
        /// <summary> 
        /// 数据库连接对象 
        /// </summary> 
        private SqlConnection Conn;
        /// <summary> 
        /// 数据库操作对象Comm 
        /// </summary> 
        private SqlCommand Comm;
        /// <summary> 
        /// 要操作的数据库名称 
        /// </summary> 
        public string DataBaseName;
        /// <summary> 
        /// 数据库逻辑名 
        /// 逻辑名为数据库创建后的初始文件名，以后不会随着数据库的操作(如备份还原)而改变 
        /// 此处要区别于DataBaseName 
        /// </summary> 
        public string LogicalDataBaseName;
        /// <summary> 
        /// 数据库文件完整地址 
        /// </summary> 
        public string DataBase_MDF_Address;
        /// <summary> 
        /// 数据库日志文件完整地址 
        /// </summary> 
        public string DataBase_LDF_Address;
        /// <summary> 
        /// 备份文件名 
        /// </summary> 
        public string DataBaseOfBackupName;
        /// <summary> 
        /// 备份文件路径 
        /// </summary> 
        public string DataBaseOfBackupPath;
        /// <summary> 
        /// 数据库压缩比，1%－99% 
        /// </summary> 
        public string Percent;
        /// <summary> 
        /// 执行创建/修改数据库和表的通用操作 
        /// </summary> 
        public void DataBaseAndTableOperate()
        {
            try
            {
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();
                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = StrSQL;
                Comm.CommandType = CommandType.Text;
                Comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                Conn.Close();
            }
        }

        /// <summary>
        /// 关闭正在使用数据库的进程
        /// </summary>
        /// <param name="DataBase"></param>
        private void KillSQLProcess(string DataBase)
        {
            // 以下代码用于关闭正在使用数据库的进程
            //string conStr = "Data Source=.;Database=master;Integrated Security=True";//新建连接,避免使用之前的连接
            SqlConnection Conn = new SqlConnection(ConnectionString);
            Conn.Open();
            string sqlStr = "select spid from master..sysprocesses where dbid=db_id( '" + DataBase + "') ";
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, Conn);
            System.Data.DataTable spidTable = new System.Data.DataTable();
            sda.Fill(spidTable);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = Conn;
            for (int iRow = 0; iRow <= spidTable.Rows.Count - 1; iRow++)
            {
                // 强行关闭用户进程
                cmd1.CommandText = "kill " + spidTable.Rows[iRow][0].ToString();
                cmd1.ExecuteNonQuery();
            }
            Conn.Close();
            Conn.Dispose();
        }

        #region IDataBaseHelper 成员

        public DataBaseType DBType
        {
            get { return DataBaseType.MSSQL; }
        }

        public string ConnectionString
        {
            get
            {
                return _ConnectionString;
            }
            set
            {
                _ConnectionString = value; ;
            }
        }


        public void AttachDataBase()
        {
            try
            {
                KillSQLProcess(DataBaseName);
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();
                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = "sp_attach_db";
                Comm.Parameters.Add(new SqlParameter(@"dbname", SqlDbType.NVarChar));
                Comm.Parameters[@"dbname"].Value = DataBaseName;
                Comm.Parameters.Add(new SqlParameter(@"filename1", SqlDbType.NVarChar));
                Comm.Parameters[@"filename1"].Value = DataBase_MDF_Address;
                Comm.Parameters.Add(new SqlParameter(@"filename2", SqlDbType.NVarChar));
                Comm.Parameters[@"filename2"].Value = DataBase_LDF_Address;
                Comm.CommandType = CommandType.StoredProcedure;
                Comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                Conn.Close();
            } 
        }

        public void DetachDataBase()
        {
            try
            {
                KillSQLProcess(DataBaseName);
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();
                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = @"sp_detach_db";
                Comm.Parameters.Add(new SqlParameter(@"dbname", SqlDbType.NVarChar));
                Comm.Parameters[@"dbname"].Value = DataBaseName;
                Comm.CommandType = CommandType.StoredProcedure;
                Comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                Conn.Close();
            } 
        }

        public void BackupDataBase()
        {
            try
            {
                KillSQLProcess(DataBaseName);
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();
                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = "use master;backup database @dbname to disk = @backupname;";
                Comm.Parameters.Add(new SqlParameter(@"dbname", SqlDbType.NVarChar));
                Comm.Parameters[@"dbname"].Value = DataBaseName;
                Comm.Parameters.Add(new SqlParameter(@"backupname", SqlDbType.NVarChar));
                Comm.Parameters[@"backupname"].Value = @DataBaseOfBackupPath + @DataBaseOfBackupName;
                Comm.CommandType = CommandType.Text;
                Comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                Conn.Close();
            } 
        }

        public void RestoreDataBase()
        {
            try
            {
                KillSQLProcess(DataBaseName);
                string BackupFile = @DataBaseOfBackupPath + @DataBaseOfBackupName;
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();
                Comm = new SqlCommand();
                Comm.Connection = Conn;
                //restore filelistonly from disk='E:\guojb文件夹汇总\WinForm精品\2014-01\ExjsHotel\DB_51aspx\baksfd123.bak'
                //Comm.CommandText = "use master;restore database @DataBaseName from disk = @BackupFile with move '" + LogicalDataBaseName + "' to '" + DataBase_MDF_Address + "',move '" + LogicalDataBaseName + "_Log' to '" + DataBase_LDF_Address + "',stats = 10, replace;";
                Comm.CommandText = "restore database @DataBaseName from disk =@BackupFile with replace";
                Comm.Parameters.Add(new SqlParameter(@"DataBaseName", SqlDbType.NVarChar));
                Comm.Parameters[@"DataBaseName"].Value = DataBaseName;
                Comm.Parameters.Add(new SqlParameter(@"BackupFile", SqlDbType.NVarChar));
                Comm.Parameters[@"BackupFile"].Value = BackupFile;
                Comm.CommandType = CommandType.Text;
                Comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                Conn.Close();
            } 
        }

        public void CompressDatabase()
        {
            try
            {
                KillSQLProcess(DataBaseName);
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();
                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = "DBCC SHRINKDATABASE (" + DataBaseName + "," + Percent + ")";
                Comm.CommandType = CommandType.Text;
                Comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                Conn.Close();
            } 
        }

        #endregion

        #region IDataBaseHelper 成员

        
        #endregion
    }
}
