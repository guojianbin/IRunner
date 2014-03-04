using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.CompilerServices;
using Microsoft.Win32;
using System.Net;
using System.Threading;
using System.Collections;
using IcePluginLibrary;
namespace Translator
{
    public partial class IceTranslate : Form, IcePluginLibrary.IPlugin
    {
        #region IDisposable 成员

        //public override void Dispose()
        //{
        //    dispose(true);
        //}

        //private void dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        m = null;
        //        objIceTranslate = null;
        //        if (this.Disposing == false)
        //        {
        //            this.Dispose();
        //        }
                
        //        GC.Collect();
        //        GC.WaitForPendingFinalizers();
        //        GC.Collect(0);
        //    }
        //}

        #endregion

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
            new IceTranslate().Show();
        }

        public PluginAttribute PluginInfo
        {
            get
            {
                AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());

                PluginAttribute objPluginInfo = new PluginAttribute();
                objPluginInfo.Name = "翻译工具";
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

        #region Fields


        /// <summary>
        /// notifyicon
        /// </summary>
        private NotifyIcon notifyicon = new NotifyIcon();

        /// <summary>
        /// notifyContextMenu
        /// </summary>
        private ContextMenu notifyContextMenu = new ContextMenu();

        /// <summary>
        /// isExit
        /// </summary>
        private bool isExit = false;

        /// <summary>
        /// request
        /// </summary>
        private TranslateRequest request;

        /// <summary>
        /// isRequest
        /// </summary>
        private bool isRequest = false;

        #endregion

        public IceTranslate()
        {
            InitializeComponent();

            _ChildNodes.Add("关于...", new EventHandler(ShowAbout));

            cmbSource.DisplayMember = "LanguageName";
            cmbSource.ValueMember = "LanguageKey";
            cmbTarge.DisplayMember = "LanguageName";
            cmbTarge.ValueMember = "LanguageKey";
            cmbSource.DataSource = GetLanguageList();
            cmbTarge.DataSource = GetLanguageList();
            cmbSource.SelectedValue = "zh-CN";
            cmbTarge.SelectedValue = "en";
            chkAuto_CheckedChanged(null, null);
            notifyicon.Visible = true;
            this.Hide();

        }

        private void btnSwitch_Click(object sender, EventArgs e)
        {
            string languageSource = cmbSource.SelectedValue.ToString();
            string languageTarge = cmbTarge.SelectedValue.ToString();

            cmbSource.SelectedValue = languageTarge;
            cmbTarge.SelectedValue = languageSource;

            //StartTranslate();
        }


        /// <summary>
        /// StartTranslate
        /// </summary>
        private void StartTranslate()
        {
            string source = txtSource.Text;
            txtResult.Clear();
            if (!string.IsNullOrEmpty(source))
            {
                txtResult.Text = "正在翻译...";

                request = new TranslateRequest(source, cmbSource.SelectedValue.ToString(), cmbTarge.SelectedValue.ToString());
                if (!isRequest)
                {
                    
                    TranslateExecute(request.Text, request.Source, request.Targe);
                }
            }
        }

        public delegate void TranslateExecuteDelegate(string source, string languageSource, string languageTarge); 
        /// <summary>
        /// TranslateExecute
        /// </summary>
        private void TranslateExecute(string source, string languageSource, string languageTarge)
        {
            if (this.InvokeRequired)
                Invoke(new TranslateExecuteDelegate(TranslateExecute), new object[] { source, languageSource, languageTarge });
            else
            {
                string result = GoogleTranslate.Execute(source, languageSource, languageTarge);
                SetResultText(result);
                isRequest = false;
            }
          
        }

        /// <summary>
        /// SetResultText
        /// </summary>
        /// <param name="value"></param>
        private void SetResultText(string value)
        {
            txtResult.Text = value;
        }

        private void chkAuto_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAuto.Checked)
            {
                txtSource.TextChanged += txtSource_TextChanged;
            }
            else
            {
                txtSource.TextChanged -= txtSource_TextChanged;
            }
        }

        /// <summary>
        /// txtSource_TextChanged
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void txtSource_TextChanged(object sender, EventArgs e)
        {
            StartTranslate();
        }

        /// <summary>
        /// GetLanguageList
        /// </summary>
        /// <returns></returns>
        private List<Language> GetLanguageList()
        {
            Hashtable array = new Hashtable();
            array.Add("en", "English");
            array.Add("zh-CN", "Chinese");
            #region Hashtable
            array.Add("sq", "Albanian");
            array.Add("ar", "Arabic");
            array.Add("ga", "Irish");
            array.Add("et", "Estonian");
            array.Add("be", "Belarusian");
            array.Add("bg", "Bulgarian");
            array.Add("is", "Icelandic");
            array.Add("pl", "Polish");
            array.Add("fa", "Persian");
            array.Add("af", "Boolean text (Afrikaans)");
            array.Add("da", "Danish");
            array.Add("de", "German");
            array.Add("ru", "Russian");
            array.Add("fr", "French");
            array.Add("tl", "Filipino");
            array.Add("fi", "Finnish");
            array.Add("ko", "Korean");
            array.Add("nl", "Dutch");
            array.Add("gl", "Galician");
            array.Add("ca", "Catalan");
            array.Add("cs", "Czech");
            array.Add("hr", "Croatian");
            array.Add("lv", "Latvian");
            array.Add("lt", "Lithuanian");
            array.Add("ro", "Romanian");
            array.Add("mt", "Maltese");
            array.Add("ms", "Malay");
            array.Add("mk", "Macedonian");
            array.Add("no", "Norwegian");
            array.Add("pt", "Portuguese");
            array.Add("ja", "Japanese");
            array.Add("sv", "Swedish");
            array.Add("sr", "Serbian");
            array.Add("sk", "Slovak");
            array.Add("sl", "Slovenian");
            array.Add("sw", "Swahili");
            array.Add("th", "Thai");
            array.Add("tr", "Turkish");
            array.Add("cy", "Welsh");
            array.Add("uk", "Ukrainian");
            array.Add("es", "Spanish");
            array.Add("iw", "Hebrew");
            array.Add("el", "Greek");
            array.Add("hu", "Hungarian");
            array.Add("it", "Italian");
            array.Add("yi", "Yiddish");
            array.Add("hi", "Hindi");
            array.Add("id", "Indonesian");
            array.Add("vi", "Vietnamese");
            #endregion

            List<Language> languages = new List<Language>();
            foreach (DictionaryEntry element in array)
            {
                languages.Add(new Language(element.Key.ToString(), element.Value.ToString()));
            }
            return languages;
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            StartTranslate();
        }


        private void IceTranslate_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (!isExit)
            {
                WindowState = FormWindowState.Minimized;
                e.Cancel = true;
            }
        }

        private void IceTranslate_SizeChanged(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Minimized)
            {
                this.Hide();
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            isExit = true;
            this.Close();
        }

        private void btnCopy_Click(object sender, EventArgs e)
        {
            this.CopyToClipboard();
        }

        private void CopyToClipboard()
        {
            try
            {
                Clipboard.SetDataObject(this.txtResult.Text);
                MessageBox.Show("成功复制至剪切板。", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);

            }
            catch (Exception exception1)
            {
                MessageBox.Show("The code could not be copied to the clipboard.\r\nDetail:" + exception1.Message, "Error Copying to Clipboard", MessageBoxButtons.OK, MessageBoxIcon.Hand, MessageBoxDefaultButton.Button1);
            }
        }


    }

    #region LanguageClass
    /// <summary>
    /// Language
    /// </summary>
    public class Language
    {
        /// <summary>
        /// Language
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public Language(string id, string name)
        {
            this.LanguageKey = id;
            this.LanguageName = name;
        }

        private string _LanguageKey = "";
        /// <summary>
        /// LanguageKey
        /// </summary>
        public string LanguageKey
        {
            get{return _LanguageKey;}
            set{_LanguageKey = value;}
        }
        private string _LanguageName = "";
        /// <summary>
        /// Name
        /// </summary>
        public string LanguageName
        {
            get { return _LanguageName; }
            set { _LanguageName = value; }
        }
    }

    #endregion

    #region TranslateRequest

    public class TranslateRequest
    {
        /// <summary>
        /// TranslateRequest
        /// </summary>
        public TranslateRequest(string source, string languageSource, string languageTarge)
        {
            this.Text = source;
            this.Source = languageSource;
            this.Targe = languageTarge;
        }
        private string _Text = "";
        private string _Source = "";
        private string _Targe = "";

        /// <summary>
        /// Text
        /// </summary>
        public string Text
        {
            get { return _Text; }
            set { _Text = value; }
        }

        /// <summary>
        /// Source
        /// </summary>
        public string Source
        {
            get { return _Source; }
            set { _Source = value; }
        }

        /// <summary>
        /// Targe
        /// </summary>
        public string Targe
        {
            get { return _Targe; }
            set { _Targe = value; }
        }
    }

    #endregion

}