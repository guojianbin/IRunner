using System;
using System.Collections.Generic;
using System.Text;

using System.Runtime.InteropServices;
using System.Windows.Forms;
namespace RViewer
{
    class IniHelper
    {

        public static string IniPath = Application.StartupPath + "\\IceSys.ini";

        // ����INI�ļ���д�������� WritePrivateProfileString()
        [System.Runtime.InteropServices.DllImport("kernel32")]
        private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);

        // ����INI�ļ��Ķ��������� GetPrivateProfileString()
        [System.Runtime.InteropServices.DllImport("kernel32")]
        private static extern int GetPrivateProfileString(string section, string key, string def, System.Text.StringBuilder retVal, int size, string filePath);

        #region ���浽ini�ļ�
        /// <summary>
        /// ���浽ini�ļ���
        /// </summary>
        /// <param name="section">��</param>
        /// <param name="key">��</param>
        /// <param name="value">ֵ</param>
        /// <param name="filename">���·��</param
        /// <returns>�Ƿ�ɹ�</returns>
        public static bool SaveToIniFile(string section, string key, string value, string filename)
        {
            /*example:
              
            
                FilePath = Application.StartupPath + @"\ICE_DB.ini";
                // section=���ýڣ�key=������value=��ֵ��FilePath=·��
                string section = "���ݿ������ַ���";
                string key = "ConnectionStr";
                string value = txtConnectionStr.Text;
                WritePrivateProfileString(section, key, value, FilePath);
                MessageBox.Show("���ݿ����ӳɹ�������~~", "��ʾ", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
             */
            WritePrivateProfileString(section, key, value, filename);
            return true;
        }
        #endregion

        #region ��ȡini�ļ�
        /// <summary>
        /// ��ȡini�ļ���
        /// </summary>
        /// <param name="section">��</param>
        /// <param name="key">��</param>
        /// <param name="filename">���·��</param>
        /// <returns>ֵ</returns>
        public static string GetFromIniFile(string section, string key, string filename)
        {
            /*example:
              
            FilePath = Application.StartupPath + @"\ICE_DB.ini";
            System.Text.StringBuilder temp = new System.Text.StringBuilder(1024);
            // section=���ýڣ�key=������temp=���棬FilePath=·��
            string section = "���ݿ������ַ���";
            string key = "ConnectionStr";
            GetPrivateProfileString(section, key, "", temp, 255, FilePath);
            txtConnectionStr.Text = temp.ToString();
            MessageBox.Show("���ݿ����ӳɹ��ָ���~~", "��ʾ", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
             */
            System.Text.StringBuilder temp = new System.Text.StringBuilder(1024);
            GetPrivateProfileString(section, key, "", temp, 255, filename);
            return temp.ToString();
        }
        #endregion

            }
}
