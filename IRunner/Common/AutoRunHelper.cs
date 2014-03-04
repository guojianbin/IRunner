using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Win32;
namespace IRunner
{

    /// <summary>
    /// �����Զ����а�����
    /// </summary>
    public class AutoRunHelper
    {


        /// <summary>
        /// ����Ӧ�ó��򿪻��Զ�����
        /// </summary>
        /// <param name="fileName">Ӧ�ó�����ļ���</param>
        /// <param name="isAutoRun">�Ƿ��Զ����У�Ϊfalseʱ��ȡ���Զ�����</param>
        /// <exception cref="System.Exception">���ò��ɹ�ʱ�׳��쳣</exception>
        /// 
        //how to use? 
        //SetAutoRun(@"D:\CSharpStart.exe",true, " /start");
        public static void SetAutoRun(string fileName, bool isAutoRun, string args)
        {
            RegistryKey reg = null;
            try
            {
                if (!System.IO.File.Exists(fileName))
                    throw new Exception("Ӧ�ó��򲻴���!");
                String name = fileName.Substring(fileName.LastIndexOf(@"\") + 1);
                reg = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\Run", true);
                if (reg == null)
                    reg = Registry.LocalMachine.CreateSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\Run");
                if (isAutoRun)
                    reg.SetValue(name, fileName + args);
                else
                    reg.SetValue(name, false);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (reg != null)
                    reg.Close();
            }

        }


        /// <summary>         
        /// ����������        
        /// </summary>       
        /// <param name="Started">�Ƿ�����</param>         
        /// <param name="name">����ֵ������</param>          
        /// <param name="path">���������·��</param>         
        public void RunWhenStart(bool Started, string name, string path)
        {
            RegistryKey HKLM = Registry.LocalMachine;
            RegistryKey Run = HKLM.CreateSubKey(@"SOFTWARE/Microsoft/Windows/CurrentVersion/Run");
            if (Started == true)
            {
                try
                {
                    Run.SetValue(name, path);
                    HKLM.Close();
                }
                catch//û��Ȩ�޻��쳣            
                { }
            }
            else
            {
                try
                {
                    Run.DeleteValue(name);
                    HKLM.Close();
                }
                catch//û��Ȩ�޻��쳣 
                { }
            }
        }

    }
}
