using System;
using System.Collections.Generic;
using System.Text;

namespace DataBaseOperator
{
    public interface IDataBaseHelper
    {
        DataBaseType DBType { get;}
        string ConnectionString { get;set;}
        void AttachDataBase();
        void DetachDataBase();
        void BackupDataBase();
        void RestoreDataBase();
        void CompressDatabase();
    }
    /// <summary>
    /// ���ݿ�����
    /// </summary>
    public enum DataBaseType
    {
        MSSQL,
        Oracle,
        MySQL,
        SQLite,
        Access
    }
}
