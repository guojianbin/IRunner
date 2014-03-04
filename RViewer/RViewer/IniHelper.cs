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

        // 声明INI文件的写操作函数 WritePrivateProfileString()
        [System.Runtime.InteropServices.DllImport("kernel32")]
        private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);

        // 声明INI文件的读操作函数 GetPrivateProfileString()
        [System.Runtime.InteropServices.DllImport("kernel32")]
        private static extern int GetPrivateProfileString(string section, string key, string def, System.Text.StringBuilder retVal, int size, string filePath);

        #region 保存到ini文件
        /// <summary>
        /// 保存到ini文件。
        /// </summary>
        /// <param name="section">块</param>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="filename">存放路径</param
        /// <returns>是否成功</returns>
        public static bool SaveToIniFile(string section, string key, string value, string filename)
        {
            /*example:
              
            
                FilePath = Application.StartupPath + @"\ICE_DB.ini";
                // section=配置节，key=键名，value=键值，FilePath=路径
                string section = "数据库连接字符串";
                string key = "ConnectionStr";
                string value = txtConnectionStr.Text;
                WritePrivateProfileString(section, key, value, FilePath);
                MessageBox.Show("数据库连接成功备份啦~~", "提示", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
             */
            WritePrivateProfileString(section, key, value, filename);
            return true;
        }
        #endregion

        #region 读取ini文件
        /// <summary>
        /// 读取ini文件。
        /// </summary>
        /// <param name="section">块</param>
        /// <param name="key">键</param>
        /// <param name="filename">存放路径</param>
        /// <returns>值</returns>
        public static string GetFromIniFile(string section, string key, string filename)
        {
            /*example:
              
            FilePath = Application.StartupPath + @"\ICE_DB.ini";
            System.Text.StringBuilder temp = new System.Text.StringBuilder(1024);
            // section=配置节，key=键名，temp=上面，FilePath=路径
            string section = "数据库连接字符串";
            string key = "ConnectionStr";
            GetPrivateProfileString(section, key, "", temp, 255, FilePath);
            txtConnectionStr.Text = temp.ToString();
            MessageBox.Show("数据库连接成功恢复啦~~", "提示", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
             */
            System.Text.StringBuilder temp = new System.Text.StringBuilder(1024);
            GetPrivateProfileString(section, key, "", temp, 255, filename);
            return temp.ToString();
        }
        #endregion

            }
}
