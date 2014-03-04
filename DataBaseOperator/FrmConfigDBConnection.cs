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
            // ���� SqlConnectionStringBuilder ���������������ַ����� using System.Data.SqlClient;
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

            //�������ݿ�
            //connectionStringBuilder.UserInstance = false;
            // ʹ�����·�����ַ���ָ����Ҫ���ӵ� SQL Server ���ݿ��ļ���
            //connectionStringBuilder.AttachDBFilename = @"|DataDirectory|test.mdf";

            //�����趨������ SQL Server ʵ�������ݿ�����
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