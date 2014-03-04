using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Diagnostics;
namespace IRunner
{
    public partial class FrmSearchOnline : Form
    {
        #region 移动无边框窗体
        #region API函数
        [DllImport("user32.dll")]
        public static extern bool ReleaseCapture();//用来释放被当前线程中某个窗口捕获的光标

        /// <summary>
        /// 向指定的窗体发送Windows消息
        /// </summary>
        /// <param name="hwdn">表示发送西欧阿西的目的窗口的句柄</param>
        /// <param name="wMsg">表示被发送的消息</param>
        /// <param name="mParam">取决于被发送的消息，表示附加的消息信息</param>
        /// <param name="lParam">取决于被发送的消息，表示附加的消息信息</param>
        /// <returns>表示处理是否成功</returns>
        [DllImport("user32.dll")]
        public static extern bool SendMessage(IntPtr hwdn, int wMsg, int mParam, int lParam);
        #endregion

        #region 声明的变量
        public const int WM_SYSCOMMAND = 0x0112;//该变量表示将向Windows发送的消息类型
        public const int SC_MOVE = 0xF010;//该变量表示发送消息的附加消息
        public const int HTCAPTION = 0x0002;//该变量表示发送消息的附加消息
        #endregion

        private void FrmSearchOnline_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();//用来释放被当前线程中某个窗口捕获的光标
            SendMessage(this.Handle, WM_SYSCOMMAND, SC_MOVE + HTCAPTION, 0);//向Windows发送拖动窗体的消息
        }
        #endregion

        public FrmSearchOnline()
        {
            InitializeComponent();
        }

        private void FrmSearchOnline_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            IRunnerMain mainForm = this.Owner as IRunnerMain;
            if (mainForm != null)
            {
                mainForm.Activate();
                e.Cancel = true;
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
            
        }

        private void btnBaiduSearch_Click(object sender, EventArgs e)
        {
            Process ProcBaidu = new Process();
            ProcBaidu.StartInfo.FileName = PubData.GV_DefaultBrowser;
            string searchText = ToUrlEncode(txtSerach.Text.Trim());
            ProcBaidu.StartInfo.Arguments = "http://www.baidu.com/s?wd=" + searchText;
            ProcBaidu.Start();
            this.Close();
        }

        private void btnGoogleSearch_Click(object sender, EventArgs e)
        {
            Process ProcGoogle = new Process();
            ProcGoogle.StartInfo.FileName = PubData.GV_DefaultBrowser;
            string searchText = ToUrlEncode(txtSerach.Text.Trim());
            ProcGoogle.StartInfo.Arguments = "http://www.google.com.hk/search?q=" + searchText;
            ProcGoogle.Start();
            this.Close();
        }

        private void FrmSearchOnline_Activated(object sender, EventArgs e)
        {
            txtSerach.Focus();
            txtSerach.SelectAll();
        }


        #region ToUrlEncode
        public static string ToUrlEncode(string strCode)
        {
            StringBuilder sb = new StringBuilder();
            byte[] byStr = System.Text.Encoding.UTF8.GetBytes(strCode); //默认是System.Text.Encoding.Default.GetBytes(str)  
            System.Text.RegularExpressions.Regex regKey = new System.Text.RegularExpressions.Regex("^[A-Za-z0-9]+$");
            for (int i = 0; i < byStr.Length; i++)
            {
                string strBy = Convert.ToChar(byStr[i]).ToString();
                if (regKey.IsMatch(strBy))
                {
                    //是字母或者数字则不进行转换    
                    sb.Append(strBy);
                }
                else
                {
                    sb.Append(@"%" + Convert.ToString(byStr[i], 16));
                }
            }
            return (sb.ToString());
        }
        #endregion 

        
    }
}