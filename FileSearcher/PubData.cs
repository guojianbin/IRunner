using System;
using System.Collections.Generic;
using System.Text;
namespace FileSearcher
{
    public class PubData
    {


        /// <summary>
        /// 快捷方式存放路径
        /// </summary>
        public static string GV_ShortCutSavePath = System.Windows.Forms.Application.StartupPath + "\\ShortCutBase";

        /// <summary>
        /// 插件工具存放路径
        /// </summary>
        public static string GV_IcePluginsPath = System.Windows.Forms.Application.StartupPath + "\\IcePlugins";

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
