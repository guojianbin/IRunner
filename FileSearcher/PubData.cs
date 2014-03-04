using System;
using System.Collections.Generic;
using System.Text;
namespace FileSearcher
{
    public class PubData
    {


        /// <summary>
        /// ��ݷ�ʽ���·��
        /// </summary>
        public static string GV_ShortCutSavePath = System.Windows.Forms.Application.StartupPath + "\\ShortCutBase";

        /// <summary>
        /// ������ߴ��·��
        /// </summary>
        public static string GV_IcePluginsPath = System.Windows.Forms.Application.StartupPath + "\\IcePlugins";

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
