using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace IRunner
{
    public partial class FrmSetting : Form
    {
        public FrmSetting()
        {
            InitializeComponent();
        }

        private void btnSaveSetting_Click(object sender, EventArgs e)
        {
            //SQLiteHelper.DropTable("t_Ice_Config");
            //SQLiteHelper.CreateConfigTable();
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            //系统
            PubData.GV_ShowShortCut = txtShowShortCut.Text.Trim();
            SaveToConfig(al, "ShowShortCut", txtShowShortCut.Text.Trim());

            PubData.GV_HideShortCut = txtHideShortCut.Text.Trim();
            SaveToConfig(al, "HideShortCut", txtHideShortCut.Text.Trim());

            PubData.GV_RunCMDShortCut = txtRunCMDShortCut.Text.Trim();
            SaveToConfig(al, "RunCMDShortCut", txtRunCMDShortCut.Text.Trim());

            PubData.GV_CaptureScreenShortCut = txtCaptureScreenShortCut.Text.Trim();
            SaveToConfig(al, "CaptureScreenShortCut", txtCaptureScreenShortCut.Text.Trim());

            PubData.GV_SearchOnlineShortCut = txtSearchOnlineShortCut.Text.Trim();
            SaveToConfig(al, "SearchOnlineShortCut", txtSearchOnlineShortCut.Text.Trim());

            PubData.GV_DesktopShortCut = txtDesktopShortCut.Text.Trim();
            SaveToConfig(al, "DesktopShortCut", txtDesktopShortCut.Text.Trim());

            PubData.GV_RunOnWindowsStartup = cbAutoRunWithWindowsOn.Checked;
            SaveToConfig(al, "RunOnWindowsStartup", cbAutoRunWithWindowsOn.Checked.ToString().Trim());
            AutoRunHelper.SetAutoRun(Application.ExecutablePath, cbAutoRunWithWindowsOn.Checked," /start");

            PubData.GV_ShowOnTopMost = cbShowOnTopMost.Checked;
            SaveToConfig(al, "ShowOnTopMost", cbShowOnTopMost.Checked.ToString().Trim());

            PubData.GV_DefaultBrowser = txtDefaultBrowser.Text.Trim();
            SaveToConfig(al, "DefaultBrowser", txtDefaultBrowser.Text.Trim());

            PubData.GV_CreateShowcutWithDel = cbCreateShowcutWithDel.Checked;
            SaveToConfig(al, "CreateShowcutWithDel", cbCreateShowcutWithDel.Checked.ToString().Trim());

            PubData.GV_AutoDelWhenFileNotExists = cbAutoDelWhenFileNotExists.Checked;
            SaveToConfig(al, "AutoDelWhenFileNotExists", cbAutoDelWhenFileNotExists.Checked.ToString().Trim());

            //搜索盒
            PubData.GV_MinInput = Convert.ToInt32(txtMinShowTip.Text.Trim());
            SaveToConfig(al, "MinInput", txtMinShowTip.Text.Trim());

            PubData.GV_ShowMaxRow = Convert.ToInt32(txtShowMaxRow.Text.Trim());
            SaveToConfig(al, "ShowMaxRow", txtShowMaxRow.Text.Trim());

            PubData.GV_FilterString = txtFilterExt.Text.Trim();
            SaveToConfig(al, "FilterString", txtFilterExt.Text.Trim());

            StringBuilder sbSearchPaths = new StringBuilder();
            if (txtSearchIndexPath.Text.Length > 0)
            {
                foreach (string filePath in txtSearchIndexPath.Lines)
                {
                    if (filePath.Trim().Length > 0)
                    {
                        sbSearchPaths.Append(filePath.Trim() + "|");
                        SaveToConfig(al, "SearchPath", filePath.Trim());
                    }
                }
            }
            PubData.GV_SearchPath = sbSearchPaths.ToString().TrimEnd('|');

            SQLiteHelper.ExecuteSqlTran(al);
            this.Close();
        }

        private void SaveToConfig(System.Collections.ArrayList al, string key, string value)
        {
            //const string sql = "INSERT INTO t_Ice_Config(Name,Value) values('{0}','{1}')";
            const string sql = "UPDATE t_Ice_Config SET Value = '{1}' WHERE Name = '{0}'";
            al.Add(string.Format(sql, key, ConvertHelper.GetSafeSqlString(value, true)));
        }

       
        private void FrmSetting_Load(object sender, EventArgs e)
        {

            txtHideShortCut.KeyDown += txtShortCut_KeyDown;
            txtShowShortCut.KeyDown += txtShortCut_KeyDown;
            txtCaptureScreenShortCut.KeyDown += txtShortCut_KeyDown;
            txtRunCMDShortCut.KeyDown += txtShortCut_KeyDown;
            txtSearchOnlineShortCut.KeyDown += txtShortCut_KeyDown;
            txtDesktopShortCut.KeyDown += txtShortCut_KeyDown;

            txtShowShortCut.Text = PubData.GV_ShowShortCut;
            txtHideShortCut.Text = PubData.GV_HideShortCut;
            txtRunCMDShortCut.Text = PubData.GV_RunCMDShortCut;
            txtCaptureScreenShortCut.Text = PubData.GV_CaptureScreenShortCut;
            txtSearchOnlineShortCut.Text = PubData.GV_SearchOnlineShortCut;
            txtDesktopShortCut.Text = PubData.GV_DesktopShortCut;

            cbAutoRunWithWindowsOn.Checked = PubData.GV_RunOnWindowsStartup;
            cbShowOnTopMost.Checked = PubData.GV_ShowOnTopMost;

            txtMinShowTip.Text = PubData.GV_MinInput.ToString();
            txtShowMaxRow.Text = PubData.GV_ShowMaxRow.ToString();
            txtFilterExt.Text = PubData.GV_FilterString;

            txtDefaultBrowser.Text = PubData.GV_DefaultBrowser.ToString();
            cbCreateShowcutWithDel.Checked = PubData.GV_CreateShowcutWithDel;
            cbAutoDelWhenFileNotExists.Checked = PubData.GV_AutoDelWhenFileNotExists;

            if (PubData.GV_SearchPath.Length > 0)
            {
                string[] paths = PubData.GV_SearchPath.Split('|');
                txtSearchIndexPath.Clear();
                foreach (string filePath in paths)
                {
                    txtSearchIndexPath.Text += filePath + System.Environment.NewLine;
                }
            }

        }

        private void RegisterToShortCutTextBox(TextBox txtbox, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Back)
            {
                txtbox.Text = "";
                return;
            }
            if (e.Modifiers == 0) //没有修改键
            {
                e.Handled = true;
                txtbox.Clear();
                return;
            }

            HotKeyHelper value = null;
            if (e.KeyCode == Keys.ShiftKey || e.KeyCode == Keys.ControlKey || e.KeyCode == Keys.Menu || e.KeyCode == Keys.None)
            {//除修改键外，没有按键
                value = new HotKeyHelper(e.Modifiers, Keys.None);
            }
            else
            {
                value = new HotKeyHelper(e.Modifiers, e.KeyCode);
            }

            txtbox.Text = value.ToString();//赋值
            e.Handled = true;
            base.OnKeyDown(e);

        }

        private void txtShortCut_KeyDown(object sender, KeyEventArgs e)
        {
            TextBox txtBox = sender as TextBox;
            RegisterToShortCutTextBox(txtBox, e);
        }

    }
}