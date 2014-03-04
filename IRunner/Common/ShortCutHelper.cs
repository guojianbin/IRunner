using System;
using System.Text;

using System.Runtime.InteropServices;


namespace IRunner
{
    class ShortCutHelper
    {


        [StructLayout(LayoutKind.Sequential)]
        public struct FILETIME
        {
            uint dwLowDateTime;
            uint dwHighDateTime;
        }

        [ComImport]
        [Guid("0000010c-0000-0000-c000-000000000046")]
        [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
        public interface IPersist
        {
            [PreserveSig]
            void GetClassID(out Guid pClassID);
        }

        [ComImport]
        [Guid("0000010b-0000-0000-C000-000000000046")]
        [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
        public interface IPersistFile
            : IPersist
        {
            new void GetClassID(out Guid pClassID);

            [PreserveSig]
            int IsDirty();

            [PreserveSig]
            void Load(
                [MarshalAs(UnmanagedType.LPWStr)] string pszFileName,
                uint dwMode);

            [PreserveSig]
            void Save(
                [MarshalAs(UnmanagedType.LPWStr)] string pszFileName,
                [MarshalAs(UnmanagedType.Bool)] bool fRemember);

            [PreserveSig]
            void SaveCompleted([MarshalAs(UnmanagedType.LPWStr)] string pszFileName);

            [PreserveSig]
            void GetCurFile([MarshalAs(UnmanagedType.LPWStr)] string ppszFileName);
        }

        [GuidAttribute("00021401-0000-0000-C000-000000000046")]
        [ClassInterfaceAttribute(ClassInterfaceType.None)]
        [ComImportAttribute()]
        public class CShellLink
        {
        }

        public const int SW_SHOWNORMAL = 1;
        /// <summary>
        /// 创建快捷方式
        /// </summary>
        /// <param name="shortcutPath">快捷方式路径。</param>
        /// <param name="targetPath">目标路径。</param>
        /// <param name="workingDirectory">工作路径。</param>
        /// <param name="description">快捷键描述。</param>
        /*
         how to use?
            Shortcut.CreateShortcut(Shortcut.GetDeskDir() + "\\初学VC记录点滴.lnk", @"http://blog.csdn.net/testcs_dn", Shortcut.GetDeskDir(), "初学VC记录点滴", AppDomain.CurrentDomain.BaseDirectory + "favicon.ico");
         */
        public static bool CreateShortcut(string shortcutPath, string targetPath, string workingDirectory, string description, string iconLocation)
        {
            try
            {
                CShellLink cShellLink = new CShellLink();
                IShellLink iShellLink = (IShellLink)cShellLink;
                iShellLink.SetDescription(description);
                iShellLink.SetShowCmd(SW_SHOWNORMAL);
                iShellLink.SetPath(targetPath);
                iShellLink.SetWorkingDirectory(workingDirectory);

                if (!string.IsNullOrEmpty(iconLocation))
                {
                    iShellLink.SetIconLocation(iconLocation, 0);
                }

                IPersistFile iPersistFile = (IPersistFile)iShellLink;
                iPersistFile.Save(shortcutPath, false);
                Marshal.ReleaseComObject(iPersistFile);
                iPersistFile = null;
                Marshal.ReleaseComObject(iShellLink);
                iShellLink = null;
                Marshal.ReleaseComObject(cShellLink);
                cShellLink = null;
                return true;
            }
            catch //(System.Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// 创建桌面快捷方式
        /// </summary>
        /// <param name="targetPath">可执行文件路径</param>
        /// <param name="description">快捷方式名称</param>
        /// <param name="iconLocation">快捷方式图标路径</param>
        /// <param name="workingDirectory">工作路径</param>
        /// <returns></returns>

        public static bool CreateDesktopShortcut(string targetPath, string description, string iconLocation, string workingDirectory)
        {
            if (string.IsNullOrEmpty(workingDirectory))
            {
                workingDirectory = ShortCutHelper.GetDeskDir();
            }
            return ShortCutHelper.CreateShortcut(ShortCutHelper.GetDeskDir() + "\\" + description + ".lnk", targetPath, workingDirectory, description, iconLocation);
        }

        /// <summary>
        /// 创建程序菜单快捷方式
        /// </summary>
        /// <param name="targetPath">可执行文件路径</param>
        /// <param name="description">快捷方式名称</param>
        /// <param name="menuName">程序菜单中子菜单名称，为空则不创建子菜单</param>
        /// <param name="iconLocation">快捷方式图标路径</param>
        /// <param name="workingDirectory">工作路径</param>
        /// <returns></returns>
        /*
         how to use?
            Shortcut.CreateProgramsShortcut("http://blog.csdn.net/testcs_dn", "初学VC记录点滴", "初学VC记录点滴", AppDomain.CurrentDomain.BaseDirectory + "favicon.ico")
         */
        public static bool CreateProgramsShortcut(string targetPath, string description, string menuName, string iconLocation, string workingDirectory)
        {
            if (string.IsNullOrEmpty(workingDirectory))
            {
                workingDirectory = ShortCutHelper.GetProgramsDir();
            }
            string shortcutPath = ShortCutHelper.GetProgramsDir();
            if (!string.IsNullOrEmpty(menuName))
            {
                shortcutPath += "\\" + menuName;
                if (!System.IO.Directory.Exists(shortcutPath))
                {
                    try
                    {
                        System.IO.Directory.CreateDirectory(shortcutPath);
                    }
                    catch //(System.Exception ex)
                    {
                        return false;
                    }
                }
            }
            shortcutPath += "\\" + description + ".lnk";
            return ShortCutHelper.CreateShortcut(shortcutPath, targetPath, workingDirectory, description, iconLocation);
        }

        /*
       how to use?
          Shortcut.AddFavorites("http://blog.csdn.net/testcs_dn", "初学VC记录点滴", null, AppDomain.CurrentDomain.BaseDirectory + "favicon.ico")
       */
        public static bool AddFavorites(string url, string description, string folderName, string iconLocation, string workingDirectory)
        {
            if (string.IsNullOrEmpty(workingDirectory))
            {
                workingDirectory = ShortCutHelper.GetProgramsDir();
            }
            string shortcutPath = ShortCutHelper.GetFavoriteDir();
            if (!string.IsNullOrEmpty(folderName))
            {
                shortcutPath += "\\" + folderName;
                if (!System.IO.Directory.Exists(shortcutPath))
                {
                    try
                    {
                        System.IO.Directory.CreateDirectory(shortcutPath);
                    }
                    catch //(System.Exception ex)
                    {
                        return false;
                    }
                }
            }
            shortcutPath += "\\" + description + ".lnk";
            return ShortCutHelper.CreateShortcut(shortcutPath, url, workingDirectory, description, iconLocation);
        }

        internal const uint SHGFP_TYPE_CURRENT = 0;
        internal const int MAX_PATH = 260;
        internal const uint CSIDL_COMMON_STARTMENU = 0x0016;              // All Users\Start Menu
        internal const uint CSIDL_COMMON_PROGRAMS = 0x0017;               // All Users\Start Menu\Programs
        internal const uint CSIDL_COMMON_DESKTOPDIRECTORY = 0x0019;       // All Users\Desktop
        internal const uint CSIDL_PROGRAM_FILES = 0x0026;                 // C:\Program Files
        internal const uint CSIDL_FLAG_CREATE = 0x8000;                   // new for Win2K, or this in to force creation of folder
        internal const uint CSIDL_COMMON_FAVORITES = 0x001f;              // All Users Favorites

        [DllImport("shell32.dll", CharSet = CharSet.Unicode, PreserveSig = false)]
        internal static extern void SHGetFolderPathW(
            IntPtr hwndOwner,
            int nFolder,
            IntPtr hToken,
            uint dwFlags,
            IntPtr pszPath);

        internal static string SHGetFolderPath(int nFolder)
        {
            string pszPath = new string(' ', MAX_PATH);
            IntPtr bstr = Marshal.StringToBSTR(pszPath);
            SHGetFolderPathW(IntPtr.Zero, nFolder, IntPtr.Zero, SHGFP_TYPE_CURRENT, bstr);
            string path = Marshal.PtrToStringBSTR(bstr);
            int index = path.IndexOf('\0');
            string path2 = path.Substring(0, index);
            Marshal.FreeBSTR(bstr);
            return path2;
        }

        /// <summary>
        /// 获取特殊路径
        /// </summary>
        /// <param name="csidl"></param>
        /// <returns></returns>
        public static string GetSpecialFolderPath(uint csidl)
        {
            return SHGetFolderPath((int)(csidl | CSIDL_FLAG_CREATE));
        }

        public static string GetDeskDir()
        {
            return GetSpecialFolderPath(CSIDL_COMMON_DESKTOPDIRECTORY);
        }

        public static string GetProgramsDir()
        {
            return GetSpecialFolderPath(CSIDL_COMMON_PROGRAMS);
        }

        public static string GetFavoriteDir()
        {
            return GetSpecialFolderPath(CSIDL_COMMON_FAVORITES);
        }


        [Flags()]

        public enum SLR_FLAGS
        {

            SLR_NO_UI = 0x1,

            SLR_ANY_MATCH = 0x2,

            SLR_UPDATE = 0x4,

            SLR_NOUPDATE = 0x8,

            SLR_NOSEARCH = 0x10,

            SLR_NOTRACK = 0x20,

            SLR_NOLINKINFO = 0x40,

            SLR_INVOKE_MSI = 0x80

        }



        [Flags()]

        public enum SLGP_FLAGS
        {

            SLGP_SHORTPATH = 0x1,

            SLGP_UNCPRIORITY = 0x2,

            SLGP_RAWPATH = 0x4

        }



        [StructLayoutAttribute(LayoutKind.Sequential, CharSet = CharSet.Unicode)]

        // Unicode version

        public struct WIN32_FIND_DATA
        {

            public int dwFileAttributes;

            public FILETIME ftCreationTime;

            public FILETIME ftLastAccessTime;

            public FILETIME ftLastWriteTime;

            public int nFileSizeHigh;

            public int nFileSizeLow;

            public int dwReserved0;

            public int dwReserved1;

            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = MAX_PATH)]

            public string cFileName;

            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 14)]

            public string cAlternateFileName;

            private const int MAX_PATH = 260;

        }



        [

         ComImport(),

         InterfaceType(ComInterfaceType.InterfaceIsIUnknown),

         Guid("000214F9-0000-0000-C000-000000000046")

         ]



        // Unicode version

        public interface IShellLink
        {

            void GetPath(

              [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszFile,

              int cchMaxPath,

              out WIN32_FIND_DATA pfd,

              SLGP_FLAGS fFlags);



            void GetIDList(

              out IntPtr ppidl);



            void SetIDList(

              IntPtr pidl);



            void GetDescription(

              [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszName,

              int cchMaxName);



            void SetDescription(

              [MarshalAs(UnmanagedType.LPWStr)] string pszName);



            void GetWorkingDirectory(

              [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszDir,

              int cchMaxPath);



            void SetWorkingDirectory(

              [MarshalAs(UnmanagedType.LPWStr)] string pszDir);



            void GetArguments(

              [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszArgs,

              int cchMaxPath);



            void SetArguments(

              [MarshalAs(UnmanagedType.LPWStr)] string pszArgs);



            void GetHotkey(

              out short pwHotkey);



            void SetHotkey(

              short wHotkey);



            void GetShowCmd(

              out int piShowCmd);



            void SetShowCmd(

              int iShowCmd);



            void GetIconLocation(

              [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszIconPath,

              int cchIconPath,

              out int piIcon);



            void SetIconLocation(

              [MarshalAs(UnmanagedType.LPWStr)] string pszIconPath,

              int iIcon);



            void SetRelativePath(

              [MarshalAs(UnmanagedType.LPWStr)] string pszPathRel,

              int dwReserved);



            void Resolve(

              IntPtr hwnd,

              SLR_FLAGS fFlags);



            void SetPath(

              [MarshalAs(UnmanagedType.LPWStr)] string pszFile);

        }



        [

        ComImport(),

        Guid("00021401-0000-0000-C000-000000000046")

        ]
        public class ShellLink
        {

        }

        /// <summary>
        /// 获取快捷方式的所在运行目录
        /// </summary>
        /// <param name="srcFileName"></param>
        /// <returns></returns>
        public static string GetParentPathOfShortcut(string srcFileName)
        {
            ShortCutHelper.IShellLink vShellLink = (ShortCutHelper.IShellLink)new ShortCutHelper.ShellLink();
            UCOMIPersistFile vPersistFile = vShellLink as UCOMIPersistFile;

            vPersistFile.Load(srcFileName, 0);

            StringBuilder vStringBuilder = new StringBuilder(260);

            ShortCutHelper.WIN32_FIND_DATA vWIN32_FIND_DATA;

            vShellLink.GetPath(vStringBuilder, vStringBuilder.Capacity,

                out vWIN32_FIND_DATA, ShortCutHelper.SLGP_FLAGS.SLGP_RAWPATH);

            return vStringBuilder.ToString();
        }



    }
}
