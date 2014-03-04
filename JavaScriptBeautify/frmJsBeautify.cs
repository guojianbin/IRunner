using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using IcePluginLibrary;
namespace JavaScriptBeautify
{
    public partial class frmJsBeautify : Form, IPlugin
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
            new frmJsBeautify().Show();
        }

        public PluginAttribute PluginInfo
        {
            get
            {
                AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());

                PluginAttribute objPluginInfo = new PluginAttribute();
                objPluginInfo.Name = "JS美化工具";
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


        WebBrowser wb = new WebBrowser();

        public frmJsBeautify()
        {
            InitializeComponent();
            _ChildNodes.Add("关于...", new EventHandler(ShowAbout));
            this.tsmiFormat.Enabled = false;
            this.tsmiCopy.Enabled = false;
            this.tsmiClear.Enabled = false;
            this.tsmiCompress.Enabled = false;
        }


        private void ExecJsMethod(string jsMethod)
        {
            if (wb.Document.GetElementById("content") != null)
            {
                wb.Document.GetElementById("content").InnerText = this.txtJsSource.Text;
                mshtml.IHTMLDocument2 currentDoc = (mshtml.IHTMLDocument2)wb.Document.DomDocument;
                mshtml.IHTMLWindow2 win = (mshtml.IHTMLWindow2)currentDoc.parentWindow;
                win.execScript(jsMethod, "javascript");//调用函数F1
                this.txtJsSource.Text = wb.Document.GetElementById("content").InnerText;
            }
            //string sReuslt = wb.Document.InvokeScript("do_js_beautify").ToString();
            //this.txtJsSource.Text = sReuslt;
        }

        private void tsmiFormat_Click(object sender, EventArgs e)
        {
            ExecJsMethod("do_js_beautify()");
        }

        private void frmJsBeautify_Load(object sender, EventArgs e)
        {
            wb.Navigate(System.Environment.CurrentDirectory.ToString() + @"\WebFile\JavaScript-HTML格式化工具_站长工具_我拉网.htm");
            wb.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(wb_DocumentCompleted);
        }

        void wb_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {
            this.tsmiFormat.Enabled = true;
            this.tsmiCopy.Enabled = true;
            this.tsmiClear.Enabled = true;
            this.tsmiCompress.Enabled = true;
        }

        private void tsmiCompress_Click(object sender, EventArgs e)
        {
            ExecJsMethod("pack_js(0)");
        }

        private void tsmiCopy_Click(object sender, EventArgs e)
        {
            ExecJsMethod("copy()");
        }

        private void tsmiClear_Click(object sender, EventArgs e)
        {
            this.txtJsSource.Clear();
            ExecJsMethod("Empty()");
        }

        private void tsmiClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tsmiRunJs_Click(object sender, EventArgs e)
        {
            new FrmJSExecutor().ShowDialog();
        }

    }
}