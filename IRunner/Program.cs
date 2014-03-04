using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace IRunner
{
    static class Program
    {
        static IRunnerMain objIRunnerMain = null;
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            bool bCreatedNew;
            //Create a new mutex using specific mutex name

            System.Threading.Mutex m = new System.Threading.Mutex(false, "IRunnerRunOnlyTime", out bCreatedNew);
            if (bCreatedNew)
            {
                objIRunnerMain = new IRunnerMain(args);
                Application.Run(objIRunnerMain);
            }
            else
            {
                MessageBox.Show("程序已经在运行！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Application.Exit();
            }
            //Application.Run(new IRunnerMain(args));
        }
    }
}