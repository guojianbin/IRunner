using System;
using System.Collections.Generic;
using System.Text;
using System.Management;
using System.Globalization;
using System.Diagnostics;

namespace IRunner
{
    public class Processor
    {

        /// <summary>
        /// 关闭指定进程ID的进程以及子进程（关闭进程树）
        /// </summary>
        /// <param name="id"></param>
        public static void FindAndKillProcess(int id)
        {
            killProcess(id);
        }
        /// <summary>
        /// 关闭指定进程名称的进程以及子进程（关闭进程树）
        /// </summary>
        /// <param name="name"></param>
        public static void FindAndKillProcess(string name)
        {
            foreach (Process clsProcess in Process.GetProcesses())
            {
                if ((clsProcess.ProcessName.StartsWith(name, StringComparison.CurrentCulture)) || (clsProcess.MainWindowTitle.StartsWith(name, StringComparison.CurrentCulture)))
                    killProcess(clsProcess.Id);
            }
        }
        /// <summary>
        /// 关闭进程树
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        private static bool killProcess(int pid)
        {
            Process[] procs = Process.GetProcesses();
            for (int i = 0; i < procs.Length; i++)
            {
                if (getParentProcess(procs[i].Id) == pid)
                    killProcess(procs[i].Id);
            }

            try
            {
                Process myProc = Process.GetProcessById(pid);
                myProc.Kill();
            }
            //进程已经退出
            catch (ArgumentException)
            {
                ;
            }
            return true;
        }
        /// <summary>
        /// 获取父进程ID
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        private static int getParentProcess(int Id)
        {
            int parentPid = 0;
            using (ManagementObject mo = new ManagementObject("win32_process.handle='" + Id.ToString(CultureInfo.InvariantCulture) + "'"))
            {
                try
                {
                    mo.Get();
                }
                catch (ManagementException)
                {
                    return -1;
                }
                parentPid = Convert.ToInt32(mo["ParentProcessId"], CultureInfo.InvariantCulture);
            }
            return parentPid;
        }

    }
}
