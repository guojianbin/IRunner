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
        #region �ƶ��ޱ߿���
        #region API����
        [DllImport("user32.dll")]
        public static extern bool ReleaseCapture();//�����ͷű���ǰ�߳���ĳ�����ڲ���Ĺ��

        /// <summary>
        /// ��ָ���Ĵ��巢��Windows��Ϣ
        /// </summary>
        /// <param name="hwdn">��ʾ������ŷ������Ŀ�Ĵ��ڵľ��</param>
        /// <param name="wMsg">��ʾ�����͵���Ϣ</param>
        /// <param name="mParam">ȡ���ڱ����͵���Ϣ����ʾ���ӵ���Ϣ��Ϣ</param>
        /// <param name="lParam">ȡ���ڱ����͵���Ϣ����ʾ���ӵ���Ϣ��Ϣ</param>
        /// <returns>��ʾ�����Ƿ�ɹ�</returns>
        [DllImport("user32.dll")]
        public static extern bool SendMessage(IntPtr hwdn, int wMsg, int mParam, int lParam);
        #endregion

        #region �����ı���
        public const int WM_SYSCOMMAND = 0x0112;//�ñ�����ʾ����Windows���͵���Ϣ����
        public const int SC_MOVE = 0xF010;//�ñ�����ʾ������Ϣ�ĸ�����Ϣ
        public const int HTCAPTION = 0x0002;//�ñ�����ʾ������Ϣ�ĸ�����Ϣ
        #endregion

        private void FrmSearchOnline_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();//�����ͷű���ǰ�߳���ĳ�����ڲ���Ĺ��
            SendMessage(this.Handle, WM_SYSCOMMAND, SC_MOVE + HTCAPTION, 0);//��Windows�����϶��������Ϣ
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
            byte[] byStr = System.Text.Encoding.UTF8.GetBytes(strCode); //Ĭ����System.Text.Encoding.Default.GetBytes(str)  
            System.Text.RegularExpressions.Regex regKey = new System.Text.RegularExpressions.Regex("^[A-Za-z0-9]+$");
            for (int i = 0; i < byStr.Length; i++)
            {
                string strBy = Convert.ToChar(byStr[i]).ToString();
                if (regKey.IsMatch(strBy))
                {
                    //����ĸ���������򲻽���ת��    
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