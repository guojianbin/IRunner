using System;
using System.Collections.Generic;
using System.Text;


namespace FileSearcher
{

    /*
        private string pattern = "*.*"; 
        private void button1_Click(object sender, EventArgs e) 
        { 
            DateTime dt = DateTime.Now; 
            DirectoryInfo di = new DirectoryInfo(path); 
            FileInfo[] fis = di.GetFiles(pattern, SearchOption.TopDirectoryOnly); 
            string all = ""; 
            for (int i = 0; i < fis.Length; i++) 
            { 
            all += fis[i].Name + "\n"; 
            } 
            TimeSpan span = DateTime.Now - dt; 
            this.label1.Text = fis.Length.ToString() + ":" + (span.Seconds * 1000 + span.Milliseconds).ToString(); 
        } 

        private void button2_Click(object sender, EventArgs e) 
        { 
            DateTime dt = DateTime.Now; 
            XFileSystem.FileDirectoryEnumerable win32 = new FileDirectoryEnumerable(); 
            win32.SearchPath = path; 
            win32.ReturnStringType = true; 
            win32.SearchPattern = pattern; 
            win32.SearchDirectory = false; 
            win32.SearchFile = true; 
            string all = ""; 
            int count = 0; 

            foreach (object name in win32) 
            { 
            all += name.ToString()+"\n"; 
            count++; 
            } 
            TimeSpan span = DateTime.Now - dt; 
            this.label2.Text = count.ToString()+":"+(span.Seconds * 1000 + span.Milliseconds).ToString(); 
        } 

        这是测试结果。文件数，和两个方法用的时间。 
        FileCount C# (ms) Win32(ms) 
        260 61 32 
        2412 250 203 
        3960 1671 1000 
        7290 8531 3734 
        15840 40812 19875 
     
     */

    /// <summary>
    /// 文件或目录遍历器,本类型为 FileDirectoryEnumerator 的一个包装
    /// </summary>
    /// <remarks>
    /// 
    /// 
    /// 以下代码演示使用这个文件目录遍历器
    /// 
    /// FileDirectoryEnumerable e = new FileDirectoryEnumerable();
    /// e.SearchPath = @"c:\";
    /// e.ReturnStringType = true ;
    /// e.SearchPattern = "*.exe";
    /// e.SearchDirectory = false ;
    /// e.SearchFile = true;
    /// foreach (object name in e)
    /// {
    ///     System.Console.WriteLine(name);
    /// }
    /// System.Console.ReadLine();
    /// 
    ///</remarks>
    public class FileDirectoryEnumerable : System.Collections.IEnumerable
    {
        private bool bolReturnStringType = true;
        /// <summary>
        /// 是否以字符串方式返回查询结果,若返回true则当前对象返回为字符串,
        /// 否则返回 System.IO.FileInfo或System.IO.DirectoryInfo类型
        /// </summary>
        public bool ReturnStringType
        {
            get { return bolReturnStringType; }
            set { bolReturnStringType = value; }
        }

        private string strSearchPattern = "*";
        /// <summary>
        /// 文件或目录名的通配符
        /// </summary>
        public string SearchPattern
        {
            get { return strSearchPattern; }
            set { strSearchPattern = value; }
        }
        private string strSearchPath = null;
        /// <summary>
        /// 搜索路径,必须为绝对路径
        /// </summary>
        public string SearchPath
        {
            get { return strSearchPath; }
            set { strSearchPath = value; }
        }

        private bool bolSearchForFile = true;
        /// <summary>
        /// 是否查找文件
        /// </summary>
        public bool SearchForFile
        {
            get { return bolSearchForFile; }
            set { bolSearchForFile = value; }
        }
        private bool bolSearchForDirectory = true;
        /// <summary>
        /// 是否查找子目录
        /// </summary>
        public bool SearchForDirectory
        {
            get { return bolSearchForDirectory; }
            set { bolSearchForDirectory = value; }
        }

        private bool bolThrowIOException = true;
        /// <summary>
        /// 发生IO错误时是否抛出异常
        /// </summary>
        public bool ThrowIOException
        {
            get { return this.bolThrowIOException; }
            set { this.bolThrowIOException = value; }
        }
        /// <summary>
        /// 返回内置的文件和目录遍历器
        /// </summary>
        /// <returns>遍历器对象</returns>
        public System.Collections.IEnumerator GetEnumerator()
        {
            FileDirectoryEnumerator e = new FileDirectoryEnumerator();
            e.ReturnStringType = this.bolReturnStringType;
            e.SearchForDirectory = this.bolSearchForDirectory;
            e.SearchForFile = this.bolSearchForFile;
            e.SearchPath = this.strSearchPath;
            e.SearchPattern = this.strSearchPattern;
            e.ThrowIOException = this.bolThrowIOException;
            myList.Add(e);
            return e;
        }
        /// <summary>
        /// 关闭对象
        /// </summary>
        public void Close()
        {
            foreach (FileDirectoryEnumerator e in myList)
            {
                e.Close();
            }
            myList.Clear();
        }

        private System.Collections.ArrayList myList = new System.Collections.ArrayList();

    }//public class FileDirectoryEnumerable : System.Collections.IEnumerable

    /// <summary>
    /// 文件和目录的遍历器
    /// </summary>
    /// <remarks>本对象为Win32API函数 FindFirstFile , FindNextFile 
    /// 和 FindClose 的一个包装
    /// 
    /// 以下代码演示使用了 FileDirectoryEnumerator 
    /// 
    /// FileDirectoryEnumerator e = new FileDirectoryEnumerator();
    /// e.SearchPath = @"c:\";
    /// e.Reset();
    /// e.ReturnStringType = true ;
    /// while (e.MoveNext())
    /// {
    ///     System.Console.WriteLine
    ///         ( e.LastAccessTime.ToString("yyyy-MM-dd HH:mm:ss")
    ///         + "   " + e.FileLength + "  \t" + e.Name );
    /// }
    /// e.Close();
    /// System.Console.ReadLine();
    /// 
    /// </remarks>
    public class FileDirectoryEnumerator : System.Collections.IEnumerator
    {

        #region 表示对象当前状态的数据和属性 **********************************

        /// <summary>
        /// 当前对象
        /// </summary>
        private object objCurrentObject = null;

        private bool bolIsEmpty = false;
        /// <summary>
        /// 该目录为空
        /// </summary>
        public bool IsEmpty
        {
            get { return bolIsEmpty; }
        }
        private int intSearchedCount = 0;
        /// <summary>
        /// 已找到的对象的个数
        /// </summary>
        public int SearchedCount
        {
            get { return intSearchedCount; }
        }
        private bool bolIsFile = true;
        /// <summary>
        /// 当前对象是否为文件,若为true则当前对象为文件,否则为目录
        /// </summary>
        public bool IsFile
        {
            get { return bolIsFile; }
        }
        private int intLastErrorCode = 0;
        /// <summary>
        /// 最后一次操作的Win32错误代码
        /// </summary>
        public int LastErrorCode
        {
            get { return intLastErrorCode; }
        }
        /// <summary>
        /// 当前对象的名称
        /// </summary>
        public string Name
        {
            get
            {
                if (this.objCurrentObject != null)
                {
                    if (objCurrentObject is string)
                        return (string)this.objCurrentObject;
                    else
                        return ((System.IO.FileSystemInfo)this.objCurrentObject).Name;
                }
                return null;
            }
        }

        /// <summary>
        /// 当前对象的完整路径
        /// </summary>
        public string FullName
        {
            get
            {
                if (this.objCurrentObject != null)
                {
                    if (objCurrentObject is string)
                        return (string)this.objCurrentObject;
                    else
                        return ((System.IO.FileSystemInfo)this.objCurrentObject).FullName;
                }
                return null;
            }
        }
        /// <summary>
        /// 当前对象属性
        /// </summary>
        public System.IO.FileAttributes Attributes
        {
            get { return (System.IO.FileAttributes)myData.dwFileAttributes; }
        }
        /// <summary>
        /// 当前对象创建时间
        /// </summary>
        public System.DateTime CreationTime
        {
            get
            {
                long time = ToLong(myData.ftCreationTime_dwHighDateTime, myData.ftCreationTime_dwLowDateTime);
                System.DateTime dtm = System.DateTime.FromFileTimeUtc(time);
                return dtm.ToLocalTime();
            }
        }
        /// <summary>
        /// 当前对象最后访问时间
        /// </summary>
        public System.DateTime LastAccessTime
        {
            get
            {
                long time = ToLong(myData.ftLastAccessTime_dwHighDateTime, myData.ftLastAccessTime_dwLowDateTime);
                System.DateTime dtm = System.DateTime.FromFileTimeUtc(time);
                return dtm.ToLocalTime();
            }
        }
        /// <summary>
        /// 当前对象最后保存时间
        /// </summary>
        public System.DateTime LastWriteTime
        {
            get
            {
                long time = ToLong(myData.ftLastWriteTime_dwHighDateTime, myData.ftLastWriteTime_dwLowDateTime);
                System.DateTime dtm = System.DateTime.FromFileTimeUtc(time);
                return dtm.ToLocalTime();
            }
        }
        /// <summary>
        /// 当前文件长度,若为当前对象为文件则返回文件长度,若当前对象为目录则返回0
        /// </summary>
        public long FileLength
        {
            get
            {
                if (this.bolIsFile)
                    return ToLong(myData.nFileSizeHigh, myData.nFileSizeLow);
                else
                    return 0;
            }
        }

        #endregion

        #region 控制对象特性的一些属性 ****************************************

        private bool bolThrowIOException = true;
        /// <summary>
        /// 发生IO错误时是否抛出异常
        /// </summary>
        public bool ThrowIOException
        {
            get { return this.bolThrowIOException; }
            set { this.bolThrowIOException = value; }
        }
        private bool bolReturnStringType = true;
        /// <summary>
        /// 是否以字符串方式返回查询结果,若返回true则当前对象返回为字符串,
        /// 否则返回 System.IO.FileInfo或System.IO.DirectoryInfo类型
        /// </summary>
        public bool ReturnStringType
        {
            get { return bolReturnStringType; }
            set { bolReturnStringType = value; }
        }

        private string strSearchPattern = "*";
        /// <summary>
        /// 要匹配的文件或目录名,支持通配符
        /// </summary>
        public string SearchPattern
        {
            get { return strSearchPattern; }
            set { strSearchPattern = value; }
        }
        private string strSearchPath = null;
        /// <summary>
        /// 搜索的父目录,必须为绝对路径,不得有通配符,该目录必须存在
        /// </summary>
        public string SearchPath
        {
            get { return strSearchPath; }
            set { strSearchPath = value; }
        }

        private bool bolSearchForFile = true;
        /// <summary>
        /// 是否查找文件
        /// </summary>
        public bool SearchForFile
        {
            get { return bolSearchForFile; }
            set { bolSearchForFile = value; }
        }
        private bool bolSearchForDirectory = true;
        /// <summary>
        /// 是否查找子目录
        /// </summary>
        public bool SearchForDirectory
        {
            get { return bolSearchForDirectory; }
            set { bolSearchForDirectory = value; }
        }

        #endregion

        /// <summary>
        /// 关闭对象,停止搜索
        /// </summary>
        public void Close()
        {
            this.CloseHandler();
        }

        #region IEnumerator 成员 **********************************************

        /// <summary>
        /// 返回当前对象
        /// </summary>
        public object Current
        {
            get { return objCurrentObject; }
        }
        /// <summary>
        /// 找到下一个文件或目录
        /// </summary>
        /// <returns>操作是否成功</returns>
        public bool MoveNext()
        {
            bool success = false;
            while (true)
            {
                if (this.bolStartSearchFlag)
                    success = this.SearchNext();
                else
                    success = this.StartSearch();
                if (success)
                {
                    if (this.UpdateCurrentObject())
                        return true;
                }
                else
                {
                    this.objCurrentObject = null;
                    return false;
                }
            }
        }

        /// <summary>
        /// 重新设置对象
        /// </summary>
        public void Reset()
        {
            if (this.strSearchPath == null)
                throw new System.ArgumentNullException("SearchPath can not be null");
            if (this.strSearchPattern == null || this.strSearchPattern.Length == 0)
                this.strSearchPattern = "*";

            this.intSearchedCount = 0;
            this.objCurrentObject = null;
            this.CloseHandler();
            this.bolStartSearchFlag = false;
            this.bolIsEmpty = false;
            this.intLastErrorCode = 0;
        }

        #endregion

        #region 声明WIN32API函数以及结构 **************************************

        [Serializable,
        System.Runtime.InteropServices.StructLayout
            (System.Runtime.InteropServices.LayoutKind.Sequential,
            CharSet = System.Runtime.InteropServices.CharSet.Auto
            ),
        System.Runtime.InteropServices.BestFitMapping(false)]
        private struct WIN32_FIND_DATA
        {
            public int dwFileAttributes;
            public int ftCreationTime_dwLowDateTime;
            public int ftCreationTime_dwHighDateTime;
            public int ftLastAccessTime_dwLowDateTime;
            public int ftLastAccessTime_dwHighDateTime;
            public int ftLastWriteTime_dwLowDateTime;
            public int ftLastWriteTime_dwHighDateTime;
            public int nFileSizeHigh;
            public int nFileSizeLow;
            public int dwReserved0;
            public int dwReserved1;
            [System.Runtime.InteropServices.MarshalAs
                (System.Runtime.InteropServices.UnmanagedType.ByValTStr,
                SizeConst = 400)]
            public string cFileName;
            [System.Runtime.InteropServices.MarshalAs
                (System.Runtime.InteropServices.UnmanagedType.ByValTStr,
                SizeConst = 14)]
            public string cAlternateFileName;
        }

        [System.Runtime.InteropServices.DllImport
            ("kernel32.dll",
            CharSet = System.Runtime.InteropServices.CharSet.Auto,
            SetLastError = true)]
        private static extern IntPtr FindFirstFile(string pFileName, ref WIN32_FIND_DATA pFindFileData);

        [System.Runtime.InteropServices.DllImport
            ("kernel32.dll",
           CharSet = System.Runtime.InteropServices.CharSet.Auto,
            SetLastError = true)]
        private static extern bool FindNextFile(IntPtr hndFindFile, ref WIN32_FIND_DATA lpFindFileData);

        [System.Runtime.InteropServices.DllImport("kernel32.dll", SetLastError = true)]
        private static extern bool FindClose(IntPtr hndFindFile);

        private static long ToLong(int height, int low)
        {
            long v = (uint)height;
            v = v << 0x20;
            v = v | ((uint)low);
            return v;
        }

        private static void WinIOError(int errorCode, string str)
        {
            switch (errorCode)
            {
                case 80:
                    throw new System.IO.IOException("IO_FileExists :" + str);
                case 0x57:
                    throw new System.IO.IOException("IOError:" + MakeHRFromErrorCode(errorCode));
                case 0xce:
                    throw new System.IO.PathTooLongException("PathTooLong:" + str);
                case 2:
                    throw new System.IO.FileNotFoundException("FileNotFound:" + str);
                case 3:
                    throw new System.IO.DirectoryNotFoundException("PathNotFound:" + str);
                case 5:
                    throw new UnauthorizedAccessException("UnauthorizedAccess:" + str);
                case 0x20:
                    throw new System.IO.IOException("IO_SharingViolation:" + str);
            }
            throw new System.IO.IOException("IOError:" + MakeHRFromErrorCode(errorCode));
        }

        private static int MakeHRFromErrorCode(int errorCode)
        {
            return (-2147024896 | errorCode);
        }

        #endregion

        #region 内部代码群 ****************************************************

        private static readonly IntPtr INVALID_HANDLE_VALUE = new IntPtr(-1);
        /// <summary>
        /// 查找处理的底层句柄
        /// </summary>
        private System.IntPtr intSearchHandler = INVALID_HANDLE_VALUE;

        private WIN32_FIND_DATA myData = new WIN32_FIND_DATA();
        /// <summary>
        /// 开始搜索标志
        /// </summary>
        private bool bolStartSearchFlag = false;
        /// <summary>
        /// 关闭内部句柄
        /// </summary>
        private void CloseHandler()
        {
            if (this.intSearchHandler != INVALID_HANDLE_VALUE)
            {
                FindClose(this.intSearchHandler);
                this.intSearchHandler = INVALID_HANDLE_VALUE;
            }
        }
        /// <summary>
        /// 开始搜索
        /// </summary>
        /// <returns>操作是否成功</returns>
        private bool StartSearch()
        {
            bolStartSearchFlag = true;
            bolIsEmpty = false;
            objCurrentObject = null;
            intLastErrorCode = 0;

            string strPath = System.IO.Path.Combine(strSearchPath, this.strSearchPattern);
            this.CloseHandler();
            intSearchHandler = FindFirstFile(strPath, ref myData);
            if (intSearchHandler == INVALID_HANDLE_VALUE)
            {
                intLastErrorCode = System.Runtime.InteropServices.Marshal.GetLastWin32Error();
                if (intLastErrorCode == 2)
                {
                    bolIsEmpty = true;
                    return false;
                }
                if (this.bolThrowIOException)
                    WinIOError(intLastErrorCode, strSearchPath);
                else
                    return false;
            }
            return true;
        }
        /// <summary>
        /// 搜索下一个
        /// </summary>
        /// <returns>操作是否成功</returns>
        private bool SearchNext()
        {
            if (bolStartSearchFlag == false)
                return false;
            if (bolIsEmpty)
                return false;
            if (intSearchHandler == INVALID_HANDLE_VALUE)
                return false;
            intLastErrorCode = 0;
            if (FindNextFile(intSearchHandler, ref myData) == false)
            {
                intLastErrorCode = System.Runtime.InteropServices.Marshal.GetLastWin32Error();
                this.CloseHandler();
                if (intLastErrorCode != 0 && intLastErrorCode != 0x12)
                {
                    if (this.bolThrowIOException)
                        WinIOError(intLastErrorCode, strSearchPath);
                    else
                        return false;
                }
                return false;
            }
            return true;
        }//private bool SearchNext()

        /// <summary>
        /// 更新当前对象
        /// </summary>
        /// <returns>操作是否成功</returns>
        private bool UpdateCurrentObject()
        {
            if (intSearchHandler == INVALID_HANDLE_VALUE)
                return false;
            bool Result = false;
            this.objCurrentObject = null;
            if ((myData.dwFileAttributes & 0x10) == 0)
            {
                // 当前对象为文件
                this.bolIsFile = true;
                if (this.bolSearchForFile)
                    Result = true;
            }
            else
            {
                // 当前对象为目录
                this.bolIsFile = false;
                if (this.bolSearchForDirectory)
                {
                    if (myData.cFileName == "." || myData.cFileName == "..")
                        Result = false;
                    else
                        Result = true;
                }
            }
            if (Result)
            {
                if (this.bolReturnStringType)
                    this.objCurrentObject = myData.cFileName;
                else
                {
                    string p = System.IO.Path.Combine(this.strSearchPath, myData.cFileName);
                    if (p.Length < 260)
                    {
                        if (this.bolIsFile)
                        {
                            this.objCurrentObject = new System.IO.FileInfo(p);
                        }
                        else
                        {
                            this.objCurrentObject = new System.IO.DirectoryInfo(p);
                        }
                    }

                }
                this.intSearchedCount++;
            }
            return Result;
        }//private bool UpdateCurrentObject()

        #endregion

    }//public class FileDirectoryEnumerator : System.Collections.IEnumerator

}
