using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace RViewer
{
    public partial class frmSetting : Form
    {
        public frmSetting()
        {
            InitializeComponent();
        }

        private void btnSaveSetting_Click(object sender, EventArgs e)
        {
            string FilePath = IniHelper.IniPath;
            // section=配置节，key=键名，value=键值，FilePath=路径
            string section = "文本编码格式";
            string key = "TextEncoding";
            string value = txtTextEncoding.Text.Trim();
            IniHelper.SaveToIniFile(section, key, value, FilePath);
            PubData.DefaulTextEncoding = txtTextEncoding.Text.Trim();

            section = "循环读取目录";
            key = "AutoReadChildDir";
            value = chbReadChildDir.Checked.ToString();
            IniHelper.SaveToIniFile(section, key, value, FilePath);
            PubData.DefaultReadChildDir = chbReadChildDir.Checked;

            section = "自动保存工程";
            key = "AutoClose";
            value = chbAutoSave.Checked.ToString();
            IniHelper.SaveToIniFile(section, key, value, FilePath);
            PubData.IsAutoSaveProject = chbAutoSave.Checked;
            this.Close();
        }

        private void frmSetting_Load(object sender, EventArgs e)
        {
            txtTextEncoding.Text = PubData.DefaulTextEncoding;
            chbReadChildDir.Checked = PubData.DefaultReadChildDir;
            chbAutoSave.Checked = PubData.IsAutoSaveProject;
        }
    }
}