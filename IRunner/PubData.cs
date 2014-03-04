using System;
using System.Collections.Generic;
using System.Text;
using IcePluginLibrary;
namespace IRunner
{
    public class PubData
    {
        /// <summary>
        /// 插件集合
        /// </summary>
        public static System.Collections.Generic.Dictionary<string, IPlugin> AllPlugins = null;
        /// <summary>
        /// 插件菜单集合
        /// </summary>
        public static System.Collections.Generic.Dictionary<string, object> AllPluginMenus = null;

        /// <summary>
        /// 快捷方式存放路径
        /// </summary>
        public static string GV_ShortCutSavePath = System.Windows.Forms.Application.StartupPath + "\\ShortCutBase";

        /// <summary>
        /// 插件工具存放路径
        /// </summary>
        public static string GV_IcePluginsPath = System.Windows.Forms.Application.StartupPath + "\\IcePlugins";

        /// <summary>
        /// 实用工具存放路径
        /// </summary>
        public static string GV_IceUtilSofewarePath = System.Windows.Forms.Application.StartupPath + "\\IceUtilSofeware";

        /// <summary>
        /// 显示快捷键
        /// </summary>
        public static string GV_ShowShortCut = "Ctrl+Alt+O";
        /// <summary>
        /// 隐藏快捷键
        /// </summary>
        public static string GV_HideShortCut = "Ctrl+Alt+H";

        /// <summary>
        /// 运行命令快捷键
        /// </summary>
        public static string GV_RunCMDShortCut = "Ctrl+R";
        /// <summary>
        /// 显示桌面快捷键
        /// </summary>
        public static string GV_DesktopShortCut = "Ctrl+D";

        /// <summary>
        /// 搜索Internet资源快捷键
        /// </summary>
        public static string GV_SearchOnlineShortCut = "Ctrl+E";
        /// <summary>
        /// 截图快捷键
        /// </summary>
        public static string GV_CaptureScreenShortCut = "Ctrl+Alt+A";
        
        /// <summary>
        /// 是否随着windows启动
        /// </summary>
        public static bool GV_RunOnWindowsStartup = false;
        /// <summary>
        /// 是否置顶显示
        /// </summary>
        public static bool GV_ShowOnTopMost = false;

        /// <summary>
        /// 最小输入提示
        /// </summary>
        public static int GV_MinInput = 1;

        /// <summary>
        /// 显示最多行数
        /// </summary>
        public static int GV_ShowMaxRow = 30;

        /// <summary>
        /// 过滤后缀
        /// </summary>
        public static string GV_FilterString = ".exe;.lnk;.txt;.rtf;.ini;.htm;.html;.pdf;.rar;.zip;.7z;.gz;.bmp;.gif;.jpg;.jpeg;.ico;.pic;.png;.tif;.mp3;.wav;.aif;.avi;.mpg;.bat;.cmd;.xls;.xlsx;.doc;.docx;.ppt;.pptx;.sql;";

        /// <summary>
        /// 查询文件夹路径
        /// </summary>
        public static string GV_SearchPath = "%System%|%Desktop%|%StartMenu%";

        /// <summary>
        /// 创建快捷方式时候是否删除原文件快捷方式
        /// </summary>
        public static bool GV_CreateShowcutWithDel = false;

        /// <summary>
        /// 若文件不存在是否自动删除文件路径
        /// </summary>
        public static bool GV_AutoDelWhenFileNotExists = true;

        /// <summary>
        /// 默认网页浏览器
        /// </summary>
        public static string GV_DefaultBrowser = "Chrome.exe";
        

    }
}
