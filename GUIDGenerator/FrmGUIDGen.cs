using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using IcePluginLibrary;
namespace GUIDGenerator
{
    public partial class FrmGUIDGen : Form, IcePluginLibrary.IPlugin
    {
        private static Guid guid = Guid.NewGuid();

        public FrmGUIDGen()
        {
            InitializeComponent();
            _ChildNodes.Add("关于...", new EventHandler(ShowAbout));

            rbTypeB.CheckedChanged += rbType_CheckedChanged;
            rbTypeP.CheckedChanged += rbType_CheckedChanged;
            rbTypeD.CheckedChanged += rbType_CheckedChanged;
            rbTypeN.CheckedChanged += rbType_CheckedChanged;
        }

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
            this.ShowDialog();
        }

        public PluginAttribute PluginInfo
        {
            get
            {
                AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());

                PluginAttribute objPluginInfo = new PluginAttribute();
                objPluginInfo.Name = "GUID生成器";
                objPluginInfo.Version = ass.AssemblyVersion;//"1.0.0.0";
                objPluginInfo.Developer = ass.AssemblyCopyright;// "GuoJianBin";
                objPluginInfo.Webpage = ass.AssemblyTitle;//"632628489@qq.com";
                objPluginInfo.Description = ass.AssemblyDescription; // "系统锁定、注销、关机";
                objPluginInfo.LoadWhenStart = true;
                objPluginInfo.GUID = ass.AssemblyGUID.ToUpper(); //"C0876102-8C69-4FDC-A9E6-D68A17E9F068";
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
            string strMessage = "名称：GUID生成器\r\n";
            strMessage = strMessage + "版本：1.0.0.0\r\n"; ;
            strMessage = strMessage + "作者：GuoJianBin";
            MessageBox.Show(strMessage, "关于...", MessageBoxButtons.OK);  

        }

        private void btnNewGuid_Click(object sender, EventArgs e)
        {
            guid = Guid.NewGuid();
            lblResult.Text = GenerateGUID(guid);
        }

        private string GenerateGUID( Guid guid)
        {
            string result = string.Empty;
            if (rbTypeD.Checked == true)
            {
                result = guid.ToString("D");
            }
            else if (rbTypeN.Checked == true)
            {
                result = guid.ToString("N");
            }
            else if (rbTypeB.Checked == true)
            {
                result = guid.ToString("B");
            }
            else if (rbTypeP.Checked == true)
            {
                result = guid.ToString("P");
            }
            else
            {
                result = guid.ToString();
            }

            bool isUpper = cbUpper.Checked;
            if (isUpper)
            {
                return result.ToUpper();
            }
            else
            {
                return result.ToLower();
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void rbType_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = sender as RadioButton;
            if (rb != null)
            {
                lblResult.Text = GenerateGUID(guid);
            }
        }


        private void CopyToClipboard()
        {
            try
            {
                Clipboard.SetDataObject(this.lblResult.Text);
                MessageBox.Show("成功复制至剪切板。", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);

            }
            catch (Exception exception1)
            {
                MessageBox.Show("The GUID could not be copied to the clipboard.", "Error Copying to Clipboard", MessageBoxButtons.OK, MessageBoxIcon.Hand, MessageBoxDefaultButton.Button1);
            }
        }

        private void btnCopy_Click(object sender, EventArgs e)
        {
            CopyToClipboard();
        }

    }
}