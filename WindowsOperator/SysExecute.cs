using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using IcePluginLibrary;
namespace WindowsOperator
{
    public partial class SysExecute :IcePluginLibrary.IPlugin
    {
        public SysExecute()
        {
            _ChildNodes.Add("锁定", new EventHandler(Lock));
            _ChildNodes.Add("注销", new EventHandler(Cancel));
            _ChildNodes.Add("关机", new EventHandler(ShutDown));
            _ChildNodes.Add("重启", new EventHandler(ReStart));
            _ChildNodes.Add("%Split%", null);
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
            //
        }

        public PluginAttribute PluginInfo
        {
            get
            {
                AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());

                PluginAttribute objPluginInfo = new PluginAttribute();
                objPluginInfo.Name = "系统工具";
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
            string strMessage = "名称：系统锁定、注销、关机\r\n";
            strMessage = strMessage + "版本：1.0.0.0\r\n"; ;
            strMessage = strMessage + "作者：GuoJianBin";
            MessageBox.Show(strMessage, "关于...", MessageBoxButtons.OK);
        }

        // 锁定计算机. 
        [DllImport("user32.dll")]
        private static extern void LockWorkStation();//须写extern
        public void Lock(object sender, EventArgs e)
        {
            LockWorkStation();
        }

        //注销计算机
        [DllImport("user32.dll", EntryPoint = "ExitWindowsEx", CharSet = CharSet.Ansi)]
        private static extern int ExitWindowsEx(int a, int b);
        public void Cancel(object sender, EventArgs e)
        {
            ExitWindowsEx(0, 0);
        }
        //关闭计算机.
        public void ShutDown(object sender, EventArgs e)
        {
            System.Diagnostics.Process mp = new System.Diagnostics.Process();
            mp.StartInfo.FileName = "cmd.exe";
            mp.StartInfo.RedirectStandardInput = true;
            mp.StartInfo.RedirectStandardOutput = true;
            mp.StartInfo.RedirectStandardError = true;
            mp.StartInfo.UseShellExecute = false;
            mp.StartInfo.CreateNoWindow = true;
            mp.Start();//启动进程
            mp.StandardInput.WriteLine("shutdown -s -t 0");//关机
        }

        //重启计算机
        private void ReStart(object sender, EventArgs e)
        {
            System.Diagnostics.Process mp = new System.Diagnostics.Process();
            mp.StartInfo.FileName = "cmd.exe";
            mp.StartInfo.RedirectStandardInput = true;
            mp.StartInfo.RedirectStandardOutput = true;
            mp.StartInfo.RedirectStandardError = true;
            mp.StartInfo.UseShellExecute = false;
            mp.StartInfo.CreateNoWindow = true;
            mp.Start();//启动进程
            mp.StandardInput.WriteLine("shutdown -r -t 0");//重启
        }

    }
}