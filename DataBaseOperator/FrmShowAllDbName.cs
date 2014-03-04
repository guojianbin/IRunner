using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.Data.SqlClient;

namespace DataBaseOperator
{
    public partial class FrmShowAllDbName : Form
    {
        public FrmShowAllDbName()
        {
            InitializeComponent();
        }

        public string ConnectionString = "";
        public delegate void GetDBNameDelegate(string DBName);
        public event GetDBNameDelegate GetDBNameEvent;


        private void FrmShowAllDbName_Load(object sender, EventArgs e)
        {
            ArrayList al = GetAllDataBase();
            lbDBNames.Items.AddRange(al.ToArray());
        }

        /// <summary>
        /// 取所有数据库名,添加到lvDB
        /// </summary>
        /// <returns></returns>
        private ArrayList GetAllDataBase()
        {
            ArrayList DBNameList = new ArrayList();
            SqlConnection Connection = new SqlConnection(ConnectionString);
            DataTable DBNameTable = new DataTable();
            SqlDataAdapter Adapter = new SqlDataAdapter("Select Name FROM Master..SysDatabases order by Name ", Connection);

            lock (Adapter)
            {
                Adapter.Fill(DBNameTable);
            }

            foreach (DataRow row in DBNameTable.Rows)
            {
                DBNameList.Add(row["name"]);
            }

            return DBNameList;
        }

        private void btnSelectAndClose_Click(object sender, EventArgs e)
        {
            if (lbDBNames.SelectedIndex > -1)
            {
                string result = lbDBNames.SelectedItem.ToString();
                if (GetDBNameEvent != null)
                {
                    GetDBNameEvent(result);
                }
                this.Close();
            }
        }

        private void lbDBNames_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            btnSelectAndClose.PerformClick();
        }

    }
}