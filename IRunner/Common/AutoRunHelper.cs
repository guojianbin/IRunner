using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Win32;
namespace IRunner
{

    /// <summary>
    /// 程序自动运行帮助类
    /// </summary>
    public class AutoRunHelper
    {


        /// <summary>
        /// 设置应用程序开机自动运行
        /// </summary>
        /// <param name="fileName">应用程序的文件名</param>
        /// <param name="isAutoRun">是否自动运行，为false时，取消自动运行</param>
        /// <exception cref="System.Exception">设置不成功时抛出异常</exception>
        /// 
        //how to use? 
        //SetAutoRun(@"D:\CSharpStart.exe",true, " /start");
        public static void SetAutoRun(string fileName, bool isAutoRun, string args)
        {
            RegistryKey reg = null;
            try
            {
                if (!System.IO.File.Exists(fileName))
                    throw new Exception("应用程序不存在!");
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
        /// 开机启动项        
        /// </summary>       
        /// <param name="Started">是否启动</param>         
        /// <param name="name">启动值的名称</param>          
        /// <param name="path">启动程序的路径</param>         
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
                catch//没有权限会异常            
                { }
            }
            else
            {
                try
                {
                    Run.DeleteValue(name);
                    HKLM.Close();
                }
                catch//没有权限会异常 
                { }
            }
        }

    }
}
