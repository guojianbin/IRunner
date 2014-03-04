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
        /// ���ݿ������ַ��� 
        /// </summary> 
        private string _ConnectionString;
        /// <summary> 
        /// SQL������� 
        /// </summary> 
        public string StrSQL;
        /// <summary> 
        /// ���ݿ����Ӷ��� 
        /// </summary> 
        private SqlConnection Conn;
        /// <summary> 
        /// ���ݿ��������Comm 
        /// </summary> 
        private SqlCommand Comm;
        /// <summary> 
        /// Ҫ���������ݿ����� 
        /// </summary> 
        public string DataBaseName;
        /// <summary> 
        /// ���ݿ��߼��� 
        /// �߼���Ϊ���ݿⴴ����ĳ�ʼ�ļ������Ժ󲻻��������ݿ�Ĳ���(�籸�ݻ�ԭ)���ı� 
        /// �˴�Ҫ������DataBaseName 
        /// </summary> 
        public string LogicalDataBaseName;
        /// <summary> 
        /// ���ݿ��ļ�������ַ 
        /// </summary> 
        public string DataBase_MDF_Address;
        /// <summary> 
        /// ���ݿ���־�ļ�������ַ 
        /// </summary> 
        public string DataBase_LDF_Address;
        /// <summary> 
        /// �����ļ��� 
        /// </summary> 
        public string DataBaseOfBackupName;
        /// <summary> 
        /// �����ļ�·�� 
        /// </summary> 
        public string DataBaseOfBackupPath;
        /// <summary> 
        /// ���ݿ�ѹ���ȣ�1%��99% 
        /// </summary> 
        public string Percent;
        /// <summary> 
        /// ִ�д���/�޸����ݿ�ͱ��ͨ�ò��� 
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
        /// �ر�����ʹ�����ݿ�Ľ���
        /// </summary>
        /// <param name="DataBase"></param>
        private void KillSQLProcess(string DataBase)
        {
            // ���´������ڹر�����ʹ�����ݿ�Ľ���
            //string conStr = "Data Source=.;Database=master;Integrated Security=True";//�½�����,����ʹ��֮ǰ������
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
                // ǿ�йر��û�����
                cmd1.CommandText = "kill " + spidTable.Rows[iRow][0].ToString();
                cmd1.ExecuteNonQuery();
            }
            Conn.Close();
            Conn.Dispose();
        }

        #region IDataBaseHelper ��Ա

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
                //restore filelistonly from disk='E:\guojb�ļ��л���\WinForm��Ʒ\2014-01\ExjsHotel\DB_51aspx\baksfd123.bak'
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

        #region IDataBaseHelper ��Ա

        
        #endregion
    }
}
