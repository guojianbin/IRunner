using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace DataBaseOperator
{
    public partial class FrmConfigDBConnection : Form
    {
        public FrmConfigDBConnection()
        {
            InitializeComponent();
        }

        public string InitConnectionString = "";

        public delegate void ConfigDelegate(string ConnStr);
        public event ConfigDelegate ConfigEvent;

        private void btnConfig_Click(object sender, EventArgs e)
        {
            // 利用 SqlConnectionStringBuilder 对象来构建连接字符串。 using System.Data.SqlClient;
            SqlConnectionStringBuilder connectionStringBuilder = new SqlConnectionStringBuilder();
            connectionStringBuilder.DataSource = txtDBServiceName.Text.Trim();


            if (cbWindowLogin.Checked)
            {
                connectionStringBuilder.IntegratedSecurity = true;

            }
            else
            {
                connectionStringBuilder.UserID = txtDBUser.Text.Trim();
                connectionStringBuilder.Password = txtDBPassword.Text.Trim();
            }

            //附加数据库
            //connectionStringBuilder.UserInstance = false;
            // 使用相对路径的手法来指定所要附加的 SQL Server 数据库文件。
            //connectionStringBuilder.AttachDBFilename = @"|DataDirectory|test.mdf";

            //从新设定附加至 SQL Server 实例的数据库名称
            connectionStringBuilder.InitialCatalog = txtDBName.Text.Trim();
            try
            {
                string ConnectionString = connectionStringBuilder.ConnectionString;
                if (ConfigEvent != null)
                {
                    ConfigEvent(ConnectionString);
                }
                this.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        private void cbWindowLogin_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cb = sender as CheckBox;
            if (cb.Checked)
            {
                txtDBUser.Enabled = false;
                txtDBPassword.Enabled = false;
            }
            else
            {
                txtDBUser.Enabled = true;
                txtDBPassword.Enabled = true;
            }
        }

        private void FrmConfigDBConnection_Load(object sender, EventArgs e)
        {
            if (InitConnectionString.Length > 0)
            {
                SqlConnectionStringBuilder connectionStringBuilder = new SqlConnectionStringBuilder(InitConnectionString);
                txtDBServiceName.Text = connectionStringBuilder.DataSource;
                txtDBName.Text = connectionStringBuilder.InitialCatalog;
                if (connectionStringBuilder.IntegratedSecurity == true)
                {
                    cbWindowLogin.Checked = true;
                }
                else
                {
                    txtDBUser.Text = connectionStringBuilder.UserID;
                    txtDBPassword.Text = connectionStringBuilder.Password;
                }

            }
        }
    }
}