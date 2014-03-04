using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.ServiceProcess;
using System.Data.SqlClient;
using IcePluginLibrary;
namespace DataBaseOperator
{
    public partial class FrmDBOperate : Form, IPlugin
    {
        #region Init Interface
        private Dictionary<string, EventHandler> _ChildNodes = new Dictionary<string, EventHandler>();

        public Dictionary<string, EventHandler> ChildNodes
        {
            get
            {
                return _ChildNodes;
            }
        }

        public void Run()
        {
            new FrmDBOperate().Show();
        }

        public PluginAttribute PluginInfo
        {
            get
            {
                AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());

                PluginAttribute objPluginInfo = new PluginAttribute();
                objPluginInfo.Name = "数据库工具";
                objPluginInfo.Version = ass.AssemblyVersion;
                objPluginInfo.Developer = ass.AssemblyCopyright;
                objPluginInfo.Webpage = ass.AssemblyTitle;
                objPluginInfo.Description = ass.AssemblyDescription;
                objPluginInfo.LoadWhenStart = true;
                objPluginInfo.GUID = ass.AssemblyGUID.ToUpper();
                return objPluginInfo;
            }

        }

        private bool enable = true;
        public bool Enable
        {
            get { return enable; }
            set { enable = value; }

        }

        private string _FullName = "";
        public string FullName
        {
            get { return _FullName; }
            set { _FullName = value; }

        }
        private int _Index = 0;
        public int Index
        {
            get { return _Index; }
            set { _Index = value; }

        }
        #endregion

        public void ShowAbout(object sender, EventArgs e)
        {
            AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());
            string strMessage = "名称：" + ass.AssemblyDescription + "\r\n";
            strMessage = strMessage + "版本：" + ass.AssemblyVersion + "\r\n"; ;
            strMessage = strMessage + "作者：" + ass.AssemblyCopyright + "";
            MessageBox.Show(strMessage, "关于...", MessageBoxButtons.OK);
        }

        public FrmDBOperate()
        {
            InitializeComponent();
            _ChildNodes.Add("关于...", new EventHandler(ShowAbout));
        }




        private void btnCheckExistMSSQL_Click(object sender, EventArgs e)
        {
            bool bResult = ServiceHelper.ExistSqlServerService("MSSQLSERVER");
            if (bResult == true)
            {
                ServiceControllerStatus status = ServiceHelper.GetSqlServerServiceStatus("MSSQLSERVER");
                MessageDialog.ShowErrorMsgBox("MSSQLSERVER服务运行状态：" + status.ToString());
            }
            else
            {
                MessageDialog.ShowErrorMsgBox("不存在MSSQLSERVER服务");
            }

        }

        private void btnOpenCofigFrm_Click(object sender, EventArgs e)
        {
            FrmConfigDBConnection objFrmConfigDBConnection = new FrmConfigDBConnection();
            objFrmConfigDBConnection.ConfigEvent += new FrmConfigDBConnection.ConfigDelegate(SetConfig);
            objFrmConfigDBConnection.InitConnectionString = txtDBConnectionString.Text;
            objFrmConfigDBConnection.ShowDialog();
        }
        /// <summary>
        /// 委托返回值
        /// </summary>
        /// <param name="ConStr"></param>
        private void SetConfig(string ConStr)
        {
            txtDBConnectionString.Text = ConStr;
        }

        private void btnattachDB_Click(object sender, EventArgs e)
        {
            MSSQLHelper DBHeler = new MSSQLHelper();
            DBHeler.ConnectionString = txtDBConnectionString.Text;
            
            DBHeler.DataBase_MDF_Address = txtMDFPath.Text;
            DBHeler.DataBase_LDF_Address = txtLDFPath.Text;
            DBHeler.DataBaseName = System.IO.Path.GetFileNameWithoutExtension(txtMDFPath.Text);
            DBHeler.AttachDataBase();
            MessageDialog.ShowInformationMsgBox("附加数据库成功.");
        }

        private void btnMDFPath_Click(object sender, EventArgs e)
        {
            txtMDFPath.Text = FileDialogHelper.Open("选择", "(MDF文件)|*.mdf");
            txtLDFPath.Text = txtMDFPath.Text.Replace(".mdf", "_log.ldf");
        }

        private void btnLDFPath_Click(object sender, EventArgs e)
        {
            txtLDFPath.Text = FileDialogHelper.Open("选择", "(LDF文件)|*.ldf");
        }

        private void btnDetachDB_Click(object sender, EventArgs e)
        {
            MSSQLHelper MSSQLHelper = new MSSQLHelper();
            MSSQLHelper.ConnectionString = txtDBConnectionString.Text;
            MSSQLHelper.DataBaseName = txtDetachDB.Text;
            MSSQLHelper.DetachDataBase();
            MessageDialog.ShowInformationMsgBox("分离数据库成功.");
        }

        private void btnDetachDBPath_Click(object sender, EventArgs e)
        {
            FrmShowAllDbName objFrmShowAllDbName = new FrmShowAllDbName();
            objFrmShowAllDbName.GetDBNameEvent += new FrmShowAllDbName.GetDBNameDelegate(SetDBName);
            objFrmShowAllDbName.ConnectionString = txtDBConnectionString.Text;
            objFrmShowAllDbName.ShowDialog();
        }
        private void SetDBName(string DBName)
        {
            txtDetachDB.Text = DBName;
        }

        private void btnBackupDB_Click(object sender, EventArgs e)
        {
            MSSQLHelper MSSQLHelper = new MSSQLHelper();
            MSSQLHelper.ConnectionString = txtDBConnectionString.Text;
            MSSQLHelper.DataBaseName = txtBackupFromDB.Text;
            MSSQLHelper.DataBaseOfBackupName = System.IO.Path.GetFileName(txtBackupToPath.Text) ;
            MSSQLHelper.DataBaseOfBackupPath = System.IO.Path.GetDirectoryName(txtBackupToPath.Text)+"\\";
            MSSQLHelper.BackupDataBase();
            MessageDialog.ShowInformationMsgBox("备份数据库成功.");
        }

        private void btnBackupFromDB_Click(object sender, EventArgs e)
        {
            FrmShowAllDbName objFrmShowAllDbName = new FrmShowAllDbName();
            objFrmShowAllDbName.GetDBNameEvent += new FrmShowAllDbName.GetDBNameDelegate(SetDBNameToBackup);
            objFrmShowAllDbName.ConnectionString = txtDBConnectionString.Text;
            objFrmShowAllDbName.ShowDialog();
        }

        private void SetDBNameToBackup(string DBName)
        {
            txtBackupFromDB.Text = DBName;
        }

        private void btnBackupDBToPath_Click(object sender, EventArgs e)
        {
            txtBackupToPath.Text = FileDialogHelper.SaveBakDb();
        }

        private void btnRestoreDB_Click(object sender, EventArgs e)
        {
            MSSQLHelper MSSQLHelper = new MSSQLHelper();
            MSSQLHelper.ConnectionString = txtDBConnectionString.Text;
            MSSQLHelper.LogicalDataBaseName = txtRestoreToDB.Text;
            MSSQLHelper.DataBaseName = "DBName";

            MSSQLHelper.DataBaseOfBackupName = System.IO.Path.GetFileName(txtRestoreDBFrombak.Text);
            MSSQLHelper.DataBaseOfBackupPath = System.IO.Path.GetDirectoryName(txtRestoreDBFrombak.Text) + "\\";
            MSSQLHelper.RestoreDataBase();
            MessageDialog.ShowInformationMsgBox("还原数据库成功.");
        }

        private void btnRestoreToDB_Click(object sender, EventArgs e)
        {
            FrmShowAllDbName objFrmShowAllDbName = new FrmShowAllDbName();
            objFrmShowAllDbName.GetDBNameEvent += new FrmShowAllDbName.GetDBNameDelegate(SetDBNameToRestore);
            objFrmShowAllDbName.ConnectionString = txtDBConnectionString.Text;
            objFrmShowAllDbName.ShowDialog();
        }

        private void SetDBNameToRestore(string DBName)
        {
            txtRestoreToDB.Text = DBName;
        }

        private void btnRestoreDBFrombak_Click(object sender, EventArgs e)
        {
            txtRestoreDBFrombak.Text = FileDialogHelper.Open("选择", "(备份文件)|*.bak");
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            ServiceHelper.Stop("MSSQLSERVER");
            MessageDialog.ShowInformationMsgBox("停止MSSQL服务成功.");
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            ServiceHelper.Start("MSSQLSERVER", new string[0]);
            MessageDialog.ShowInformationMsgBox("启动MSSQL服务成功.");
        }

        private void btnRestart_Click(object sender, EventArgs e)
        {
            ServiceHelper.Stop("MSSQLSERVER");
            ServiceHelper.Start("MSSQLSERVER", new string[0]);
            MessageDialog.ShowInformationMsgBox("重新启动MSSQL服务成功.");
        }

    }
}