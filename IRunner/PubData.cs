using System;
using System.Collections.Generic;
using System.Text;
using IcePluginLibrary;
namespace IRunner
{
    public class PubData
    {
        /// <summary>
        /// �������
        /// </summary>
        public static System.Collections.Generic.Dictionary<string, IPlugin> AllPlugins = null;
        /// <summary>
        /// ����˵�����
        /// </summary>
        public static System.Collections.Generic.Dictionary<string, object> AllPluginMenus = null;

        /// <summary>
        /// ��ݷ�ʽ���·��
        /// </summary>
        public static string GV_ShortCutSavePath = System.Windows.Forms.Application.StartupPath + "\\ShortCutBase";

        /// <summary>
        /// ������ߴ��·��
        /// </summary>
        public static string GV_IcePluginsPath = System.Windows.Forms.Application.StartupPath + "\\IcePlugins";

        /// <summary>
        /// ʵ�ù��ߴ��·��
        /// </summary>
        public static string GV_IceUtilSofewarePath = System.Windows.Forms.Application.StartupPath + "\\IceUtilSofeware";

        /// <summary>
        /// ��ʾ��ݼ�
        /// </summary>
        public static string GV_ShowShortCut = "Ctrl+Alt+O";
        /// <summary>
        /// ���ؿ�ݼ�
        /// </summary>
        public static string GV_HideShortCut = "Ctrl+Alt+H";

        /// <summary>
        /// ���������ݼ�
        /// </summary>
        public static string GV_RunCMDShortCut = "Ctrl+R";
        /// <summary>
        /// ��ʾ�����ݼ�
        /// </summary>
        public static string GV_DesktopShortCut = "Ctrl+D";

        /// <summary>
        /// ����Internet��Դ��ݼ�
        /// </summary>
        public static string GV_SearchOnlineShortCut = "Ctrl+E";
        /// <summary>
        /// ��ͼ��ݼ�
        /// </summary>
        public static string GV_CaptureScreenShortCut = "Ctrl+Alt+A";
        
        /// <summary>
        /// �Ƿ�����windows����
        /// </summary>
        public static bool GV_RunOnWindowsStartup = false;
        /// <summary>
        /// �Ƿ��ö���ʾ
        /// </summary>
        public static bool GV_ShowOnTopMost = false;

        /// <summary>
        /// ��С������ʾ
        /// </summary>
        public static int GV_MinInput = 1;

        /// <summary>
        /// ��ʾ�������
        /// </summary>
        public static int GV_ShowMaxRow = 30;

        /// <summary>
        /// ���˺�׺
        /// </summary>
        public static string GV_FilterString = ".exe;.lnk;.txt;.rtf;.ini;.htm;.html;.pdf;.rar;.zip;.7z;.gz;.bmp;.gif;.jpg;.jpeg;.ico;.pic;.png;.tif;.mp3;.wav;.aif;.avi;.mpg;.bat;.cmd;.xls;.xlsx;.doc;.docx;.ppt;.pptx;.sql;";

        /// <summary>
        /// ��ѯ�ļ���·��
        /// </summary>
        public static string GV_SearchPath = "%System%|%Desktop%|%StartMenu%";

        /// <summary>
        /// ������ݷ�ʽʱ���Ƿ�ɾ��ԭ�ļ���ݷ�ʽ
        /// </summary>
        public static bool GV_CreateShowcutWithDel = false;

        /// <summary>
        /// ���ļ��������Ƿ��Զ�ɾ���ļ�·��
        /// </summary>
        public static bool GV_AutoDelWhenFileNotExists = true;

        /// <summary>
        /// Ĭ����ҳ�����
        /// </summary>
        public static string GV_DefaultBrowser = "Chrome.exe";
        

    }
}
