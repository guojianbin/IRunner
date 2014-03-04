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

        ���ǲ��Խ�����ļ����������������õ�ʱ�䡣 
        FileCount C# (ms) Win32(ms) 
        260 61 32 
        2412 250 203 
        3960 1671 1000 
        7290 8531 3734 
        15840 40812 19875 
     
     */

    /// <summary>
    /// �ļ���Ŀ¼������,������Ϊ FileDirectoryEnumerator ��һ����װ
    /// </summary>
    /// <remarks>
    /// 
    /// 
    /// ���´�����ʾʹ������ļ�Ŀ¼������
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
        /// �Ƿ����ַ�����ʽ���ز�ѯ���,������true��ǰ���󷵻�Ϊ�ַ���,
        /// ���򷵻� System.IO.FileInfo��System.IO.DirectoryInfo����
        /// </summary>
        public bool ReturnStringType
        {
            get { return bolReturnStringType; }
            set { bolReturnStringType = value; }
        }

        private string strSearchPattern = "*";
        /// <summary>
        /// �ļ���Ŀ¼����ͨ���
        /// </summary>
        public string SearchPattern
        {
            get { return strSearchPattern; }
            set { strSearchPattern = value; }
        }
        private string strSearchPath = null;
        /// <summary>
        /// ����·��,����Ϊ����·��
        /// </summary>
        public string SearchPath
        {
            get { return strSearchPath; }
            set { strSearchPath = value; }
        }

        private bool bolSearchForFile = true;
        /// <summary>
        /// �Ƿ�����ļ�
        /// </summary>
        public bool SearchForFile
        {
            get { return bolSearchForFile; }
            set { bolSearchForFile = value; }
        }
        private bool bolSearchForDirectory = true;
        /// <summary>
        /// �Ƿ������Ŀ¼
        /// </summary>
        public bool SearchForDirectory
        {
            get { return bolSearchForDirectory; }
            set { bolSearchForDirectory = value; }
        }

        private bool bolThrowIOException = true;
        /// <summary>
        /// ����IO����ʱ�Ƿ��׳��쳣
        /// </summary>
        public bool ThrowIOException
        {
            get { return this.bolThrowIOException; }
            set { this.bolThrowIOException = value; }
        }
        /// <summary>
        /// �������õ��ļ���Ŀ¼������
        /// </summary>
        /// <returns>����������</returns>
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
        /// �رն���
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
    /// �ļ���Ŀ¼�ı�����
    /// </summary>
    /// <remarks>������ΪWin32API���� FindFirstFile , FindNextFile 
    /// �� FindClose ��һ����װ
    /// 
    /// ���´�����ʾʹ���� FileDirectoryEnumerator 
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

        #region ��ʾ����ǰ״̬�����ݺ����� **********************************

        /// <summary>
        /// ��ǰ����
        /// </summary>
        private object objCurrentObject = null;

        private bool bolIsEmpty = false;
        /// <summary>
        /// ��Ŀ¼Ϊ��
        /// </summary>
        public bool IsEmpty
        {
            get { return bolIsEmpty; }
        }
        private int intSearchedCount = 0;
        /// <summary>
        /// ���ҵ��Ķ���ĸ���
        /// </summary>
        public int SearchedCount
        {
            get { return intSearchedCount; }
        }
        private bool bolIsFile = true;
        /// <summary>
        /// ��ǰ�����Ƿ�Ϊ�ļ�,��Ϊtrue��ǰ����Ϊ�ļ�,����ΪĿ¼
        /// </summary>
        public bool IsFile
        {
            get { return bolIsFile; }
        }
        private int intLastErrorCode = 0;
        /// <summary>
        /// ���һ�β�����Win32�������
        /// </summary>
        public int LastErrorCode
        {
            get { return intLastErrorCode; }
        }
        /// <summary>
        /// ��ǰ���������
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
        /// ��ǰ���������·��
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
        /// ��ǰ��������
        /// </summary>
        public System.IO.FileAttributes Attributes
        {
            get { return (System.IO.FileAttributes)myData.dwFileAttributes; }
        }
        /// <summary>
        /// ��ǰ���󴴽�ʱ��
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
        /// ��ǰ����������ʱ��
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
        /// ��ǰ������󱣴�ʱ��
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
        /// ��ǰ�ļ�����,��Ϊ��ǰ����Ϊ�ļ��򷵻��ļ�����,����ǰ����ΪĿ¼�򷵻�0
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

        #region ���ƶ������Ե�һЩ���� ****************************************

        private bool bolThrowIOException = true;
        /// <summary>
        /// ����IO����ʱ�Ƿ��׳��쳣
        /// </summary>
        public bool ThrowIOException
        {
            get { return this.bolThrowIOException; }
            set { this.bolThrowIOException = value; }
        }
        private bool bolReturnStringType = true;
        /// <summary>
        /// �Ƿ����ַ�����ʽ���ز�ѯ���,������true��ǰ���󷵻�Ϊ�ַ���,
        /// ���򷵻� System.IO.FileInfo��System.IO.DirectoryInfo����
        /// </summary>
        public bool ReturnStringType
        {
            get { return bolReturnStringType; }
            set { bolReturnStringType = value; }
        }

        private string strSearchPattern = "*";
        /// <summary>
        /// Ҫƥ����ļ���Ŀ¼��,֧��ͨ���
        /// </summary>
        public string SearchPattern
        {
            get { return strSearchPattern; }
            set { strSearchPattern = value; }
        }
        private string strSearchPath = null;
        /// <summary>
        /// �����ĸ�Ŀ¼,����Ϊ����·��,������ͨ���,��Ŀ¼�������
        /// </summary>
        public string SearchPath
        {
            get { return strSearchPath; }
            set { strSearchPath = value; }
        }

        private bool bolSearchForFile = true;
        /// <summary>
        /// �Ƿ�����ļ�
        /// </summary>
        public bool SearchForFile
        {
            get { return bolSearchForFile; }
            set { bolSearchForFile = value; }
        }
        private bool bolSearchForDirectory = true;
        /// <summary>
        /// �Ƿ������Ŀ¼
        /// </summary>
        public bool SearchForDirectory
        {
            get { return bolSearchForDirectory; }
            set { bolSearchForDirectory = value; }
        }

        #endregion

        /// <summary>
        /// �رն���,ֹͣ����
        /// </summary>
        public void Close()
        {
            this.CloseHandler();
        }

        #region IEnumerator ��Ա **********************************************

        /// <summary>
        /// ���ص�ǰ����
        /// </summary>
        public object Current
        {
            get { return objCurrentObject; }
        }
        /// <summary>
        /// �ҵ���һ���ļ���Ŀ¼
        /// </summary>
        /// <returns>�����Ƿ�ɹ�</returns>
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
        /// �������ö���
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

        #region ����WIN32API�����Լ��ṹ **************************************

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

        #region �ڲ�����Ⱥ ****************************************************

        private static readonly IntPtr INVALID_HANDLE_VALUE = new IntPtr(-1);
        /// <summary>
        /// ���Ҵ���ĵײ���
        /// </summary>
        private System.IntPtr intSearchHandler = INVALID_HANDLE_VALUE;

        private WIN32_FIND_DATA myData = new WIN32_FIND_DATA();
        /// <summary>
        /// ��ʼ������־
        /// </summary>
        private bool bolStartSearchFlag = false;
        /// <summary>
        /// �ر��ڲ����
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
        /// ��ʼ����
        /// </summary>
        /// <returns>�����Ƿ�ɹ�</returns>
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
        /// ������һ��
        /// </summary>
        /// <returns>�����Ƿ�ɹ�</returns>
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
        /// ���µ�ǰ����
        /// </summary>
        /// <returns>�����Ƿ�ɹ�</returns>
        private bool UpdateCurrentObject()
        {
            if (intSearchHandler == INVALID_HANDLE_VALUE)
                return false;
            bool Result = false;
            this.objCurrentObject = null;
            if ((myData.dwFileAttributes & 0x10) == 0)
            {
                // ��ǰ����Ϊ�ļ�
                this.bolIsFile = true;
                if (this.bolSearchForFile)
                    Result = true;
            }
            else
            {
                // ��ǰ����ΪĿ¼
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
