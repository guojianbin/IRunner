using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using IcePluginLibrary;
namespace TestBuilder
{
    public partial class IceTextBuilder : Form, IcePluginLibrary.IPlugin
    {
        public IceTextBuilder()
        {
            InitializeComponent();
            _ChildNodes.Add("关于...", new EventHandler(ShowAbout));
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
            new IceTextBuilder().Show();
        }

        public PluginAttribute PluginInfo
        {
            get
            {
                AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());

                PluginAttribute objPluginInfo = new PluginAttribute();
                objPluginInfo.Name = "TextBuilder";
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
            string strMessage = "名称：" + ass.AssemblyDescription +"\r\n";
            strMessage = strMessage + "版本：" + ass.AssemblyVersion + "\r\n"; ;
            strMessage = strMessage + "作者：" + ass.AssemblyCopyright + "";
            MessageBox.Show(strMessage, "关于...", MessageBoxButtons.OK);
        }

        private void tsmiClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tsmiClear_Click(object sender, EventArgs e)
        {
            rtxtSource.Clear();
            rtxtResult.Clear();
        }

        private void tsmiGenCSharp_Click(object sender, EventArgs e)
        {
            rtxtResult.Text = GenerateCSharpStringBuilderCode();
        }

        private void tsmiGenVB_Click(object sender, EventArgs e)
        {
            rtxtResult.Text = GenerateVBStringBuilderCode();
        }

        private string EscapeString(string source)
        {
            if (source != null)
            {
                return source.Replace("\"", "\"\"");
            }
            return string.Empty;
        }

        private string GenerateCSharpStringBuilderCode()
        {
            StringBuilder builder = new StringBuilder(0x1388);
            builder.Append("System.Text.StringBuilder sb = new System.Text.StringBuilder(5000);");
            builder.Append("\r\n");
            foreach (string str2 in this.rtxtSource.Lines)
            {
                builder.Append("sb.Append(@\"");
                builder.Append(this.EscapeString(str2));
                builder.Append("\");");
                builder.Append("\r\n");
                //if (this.cbPreserveCRLF.Checked)
                //{
                //builder.Append("sb.Append(Environment.NewLine);");
                //builder.Append("\r\n");
                //}
            }
            return builder.ToString();
        }

        private string GenerateVBStringBuilderCode()
        {
            StringBuilder builder = new StringBuilder(0x1388);
            builder.Append("Dim sb As New System.Text.StringBuilder(5000)");
            builder.Append("\r\n");
            foreach (string str2 in this.rtxtSource.Lines)
            {
                builder.Append("sb.Append(\"");
                builder.Append(this.EscapeString(str2));
                builder.Append("\")");
                builder.Append("\r\n");
                //if (this.cbPreserveCRLF.Checked)
                //{
                //builder.Append("sb.Append(vbCrLf)");
                //builder.Append("\r\n");
                //}
            }
            return builder.ToString();
        }

        private void tsmiCopy_Click(object sender, EventArgs e)
        {
            this.CopyToClipboard();
        }

        private void CopyToClipboard()
        {
            try
            {
                Clipboard.SetDataObject(this.rtxtResult.Text);
                MessageBox.Show("成功复制至剪切板。", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
            
            }
            catch (Exception exception1)
            {
                MessageBox.Show("The code could not be copied to the clipboard.", "Error Copying to Clipboard", MessageBoxButtons.OK, MessageBoxIcon.Hand, MessageBoxDefaultButton.Button1);
            }
        }

    }
}