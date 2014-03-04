using System;
using System.Text;
using System.IO;
namespace RViewer
{
    /// <summary>
    /// �ļ�������
    /// </summary>
    public static class DirFile
    {
        #region ���ָ��Ŀ¼�Ƿ����
        /// <summary>
        /// ���ָ��Ŀ¼�Ƿ����
        /// </summary>
        /// <param name="directoryPath">Ŀ¼�ľ���·��</param>
        /// <returns></returns>
        public static bool IsExistDirectory(string directoryPath)
        {
            return Directory.Exists(directoryPath);
        }
        #endregion

        #region ���ָ���ļ��Ƿ����,������ڷ���true
        /// <summary>
        /// ���ָ���ļ��Ƿ����,��������򷵻�true��
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>        
        public static bool IsExistFile(string filePath)
        {
            return File.Exists(filePath);
        }
        #endregion

        #region ��ȡָ��Ŀ¼�е��ļ��б�
        /// <summary>
        /// ��ȡָ��Ŀ¼�������ļ��б�
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>        
        public static string[] GetFileNames(string directoryPath)
        {
            //���Ŀ¼�����ڣ����׳��쳣
            if (!IsExistDirectory(directoryPath))
            {
                throw new FileNotFoundException();
            }

            //��ȡ�ļ��б�
            return Directory.GetFiles(directoryPath);
        }
        #endregion

        #region ��ȡָ��Ŀ¼��������Ŀ¼�б�,��Ҫ����Ƕ�׵���Ŀ¼�б�,��ʹ�����ط���.
        /// <summary>
        /// ��ȡָ��Ŀ¼��������Ŀ¼�б�,��Ҫ����Ƕ�׵���Ŀ¼�б�,��ʹ�����ط���.
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>        
        public static string[] GetDirectories(string directoryPath)
        {
            try
            {
                return Directory.GetDirectories(directoryPath);
            }
            catch (IOException ex)
            {
                throw ex;
            }
        }
        #endregion

        #region ��ȡָ��Ŀ¼����Ŀ¼�������ļ��б�
        /// <summary>
        /// ��ȡָ��Ŀ¼����Ŀ¼�������ļ��б�
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>
        /// <param name="searchPattern">ģʽ�ַ�����"*"����0��N���ַ���"?"����1���ַ���
        /// ������"Log*.xml"��ʾ����������Log��ͷ��Xml�ļ���</param>
        /// <param name="isSearchChild">�Ƿ�������Ŀ¼</param>
        public static string[] GetFileNames(string directoryPath, string searchPattern, bool isSearchChild)
        {
            //���Ŀ¼�����ڣ����׳��쳣
            if (!IsExistDirectory(directoryPath))
            {
                throw new FileNotFoundException();
            }

            try
            {
                if (isSearchChild)
                {
                    return Directory.GetFiles(directoryPath, searchPattern, SearchOption.AllDirectories);
                }
                else
                {
                    return Directory.GetFiles(directoryPath, searchPattern, SearchOption.TopDirectoryOnly);
                }
            }
            catch (IOException ex)
            {
                throw ex;
            }
        }
        #endregion

        #region ���ָ��Ŀ¼�Ƿ�Ϊ��
        /// <summary>
        /// ���ָ��Ŀ¼�Ƿ�Ϊ��
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>        
        public static bool IsEmptyDirectory(string directoryPath)
        {
            try
            {
                //�ж��Ƿ�����ļ�
                string[] fileNames = GetFileNames(directoryPath);
                if (fileNames.Length > 0)
                {
                    return false;
                }

                //�ж��Ƿ�����ļ���
                string[] directoryNames = GetDirectories(directoryPath);
                if (directoryNames.Length > 0)
                {
                    return false;
                }

                return true;
            }
            catch
            {
                //�����¼��־
                //LogHelper.WriteTraceLog(TraceLogLevel.Error, ex.Message);
                return true;
            }
        }
        #endregion

        #region ���ָ��Ŀ¼���Ƿ����ָ�����ļ�
        /// <summary>
        /// ���ָ��Ŀ¼���Ƿ����ָ�����ļ�,��Ҫ������Ŀ¼��ʹ�����ط���.
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>
        /// <param name="searchPattern">ģʽ�ַ�����"*"����0��N���ַ���"?"����1���ַ���
        /// ������"Log*.xml"��ʾ����������Log��ͷ��Xml�ļ���</param>        
        public static bool Contains(string directoryPath, string searchPattern)
        {
            try
            {
                //��ȡָ�����ļ��б�
                string[] fileNames = GetFileNames(directoryPath, searchPattern, false);

                //�ж�ָ���ļ��Ƿ����
                if (fileNames.Length == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                //LogHelper.WriteTraceLog(TraceLogLevel.Error, ex.Message);
            }
        }

        /// <summary>
        /// ���ָ��Ŀ¼���Ƿ����ָ�����ļ�
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>
        /// <param name="searchPattern">ģʽ�ַ�����"*"����0��N���ַ���"?"����1���ַ���
        /// ������"Log*.xml"��ʾ����������Log��ͷ��Xml�ļ���</param> 
        /// <param name="isSearchChild">�Ƿ�������Ŀ¼</param>
        public static bool Contains(string directoryPath, string searchPattern, bool isSearchChild)
        {
            try
            {
                //��ȡָ�����ļ��б�
                string[] fileNames = GetFileNames(directoryPath, searchPattern, true);

                //�ж�ָ���ļ��Ƿ����
                if (fileNames.Length == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                //LogHelper.WriteTraceLog(TraceLogLevel.Error, ex.Message);
            }
        }
        #endregion



        #region ����ʱ��õ�Ŀ¼�� / ��ʽ:yyyyMMdd ���� HHmmssff
        /// <summary>
        /// ����ʱ��õ�Ŀ¼��yyyyMMdd
        /// </summary>
        /// <returns></returns>
        public static string GetDateDir()
        {
            return DateTime.Now.ToString("yyyyMMdd");
        }
        /// <summary>
        /// ����ʱ��õ��ļ���HHmmssff
        /// </summary>
        /// <returns></returns>
        public static string GetDateFile()
        {
            return DateTime.Now.ToString("HHmmssff");
        }
        #endregion

        #region �����ļ���
        /// <summary>
        /// �����ļ���(�ݹ�)
        /// </summary>
        /// <param name="varFromDirectory">Դ�ļ���·��</param>
        /// <param name="varToDirectory">Ŀ���ļ���·��</param>
        public static void CopyFolder(string varFromDirectory, string varToDirectory)
        {
            Directory.CreateDirectory(varToDirectory);

            if (!Directory.Exists(varFromDirectory)) return;

            string[] directories = Directory.GetDirectories(varFromDirectory);

            if (directories.Length > 0)
            {
                foreach (string d in directories)
                {
                    CopyFolder(d, varToDirectory + d.Substring(d.LastIndexOf("\\")));
                }
            }
            string[] files = Directory.GetFiles(varFromDirectory);
            if (files.Length > 0)
            {
                foreach (string s in files)
                {
                    File.Copy(s, varToDirectory + s.Substring(s.LastIndexOf("\\")), true);
                }
            }
        }
        #endregion

        #region ����ļ�,����ļ��������򴴽�
        /// <summary>
        /// ����ļ�,����ļ��������򴴽�  
        /// </summary>
        /// <param name="FilePath">·��,�����ļ���</param>
        public static void ExistsFile(string FilePath)
        {
            //if(!File.Exists(FilePath))    
            //File.Create(FilePath);    
            //����д���ᱨ��,��ϸ�����뿴����.........   
            if (!File.Exists(FilePath))
            {
                FileStream fs = File.Create(FilePath);
                fs.Close();
            }
        }
        #endregion

        #region ɾ��ָ���ļ��ж�Ӧ�����ļ�������ļ�
        /// <summary>
        /// ɾ��ָ���ļ��ж�Ӧ�����ļ�������ļ�
        /// </summary>
        /// <param name="varFromDirectory">ָ���ļ���·��</param>
        /// <param name="varToDirectory">��Ӧ�����ļ���·��</param>
        public static void DeleteFolderFiles(string varFromDirectory, string varToDirectory)
        {
            Directory.CreateDirectory(varToDirectory);

            if (!Directory.Exists(varFromDirectory)) return;

            string[] directories = Directory.GetDirectories(varFromDirectory);

            if (directories.Length > 0)
            {
                foreach (string d in directories)
                {
                    DeleteFolderFiles(d, varToDirectory + d.Substring(d.LastIndexOf("\\")));
                }
            }


            string[] files = Directory.GetFiles(varFromDirectory);

            if (files.Length > 0)
            {
                foreach (string s in files)
                {
                    File.Delete(varToDirectory + s.Substring(s.LastIndexOf("\\")));
                }
            }
        }
        #endregion

        #region ���ļ��ľ���·���л�ȡ�ļ���( ������չ�� )
        /// <summary>
        /// ���ļ��ľ���·���л�ȡ�ļ���( ������չ�� )
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>        
        public static string GetFileName(string filePath)
        {
            //��ȡ�ļ�������
            FileInfo fi = new FileInfo(filePath);
            return fi.Name;
        }
        #endregion

        #region �����ļ��ο�����,ҳ��������
        /// <summary>
        /// �����ļ��ο�����,ҳ��������
        /// </summary>
        /// <param name="cDir">��·��</param>
        /// <param name="TempId">ģ�������滻���</param>
        public static void CopyFiles(string cDir, string TempId)
        {
            //if (Directory.Exists(Request.PhysicalApplicationPath + "\\Controls"))
            //{
            //    string TempStr = string.Empty;
            //    StreamWriter sw;
            //    if (File.Exists(Request.PhysicalApplicationPath + "\\Controls\\Default.aspx"))
            //    {
            //        TempStr = File.ReadAllText(Request.PhysicalApplicationPath + "\\Controls\\Default.aspx");
            //        TempStr = TempStr.Replace("{$ChannelId$}", TempId);

            //        sw = new StreamWriter(Request.PhysicalApplicationPath + "\\" + cDir + "\\Default.aspx", false, System.Text.Encoding.GetEncoding("GB2312"));
            //        sw.Write(TempStr);
            //        sw.Close();
            //    }
            //    if (File.Exists(Request.PhysicalApplicationPath + "\\Controls\\Column.aspx"))
            //    {
            //        TempStr = File.ReadAllText(Request.PhysicalApplicationPath + "\\Controls\\Column.aspx");
            //        TempStr = TempStr.Replace("{$ChannelId$}", TempId);

            //        sw = new StreamWriter(Request.PhysicalApplicationPath + "\\" + cDir + "\\List.aspx", false, System.Text.Encoding.GetEncoding("GB2312"));
            //        sw.Write(TempStr);
            //        sw.Close();
            //    }
            //    if (File.Exists(Request.PhysicalApplicationPath + "\\Controls\\Content.aspx"))
            //    {
            //        TempStr = File.ReadAllText(Request.PhysicalApplicationPath + "\\Controls\\Content.aspx");
            //        TempStr = TempStr.Replace("{$ChannelId$}", TempId);

            //        sw = new StreamWriter(Request.PhysicalApplicationPath + "\\" + cDir + "\\View.aspx", false, System.Text.Encoding.GetEncoding("GB2312"));
            //        sw.Write(TempStr);
            //        sw.Close();
            //    }
            //    if (File.Exists(Request.PhysicalApplicationPath + "\\Controls\\MoreDiss.aspx"))
            //    {
            //        TempStr = File.ReadAllText(Request.PhysicalApplicationPath + "\\Controls\\MoreDiss.aspx");
            //        TempStr = TempStr.Replace("{$ChannelId$}", TempId);

            //        sw = new StreamWriter(Request.PhysicalApplicationPath + "\\" + cDir + "\\DissList.aspx", false, System.Text.Encoding.GetEncoding("GB2312"));
            //        sw.Write(TempStr);
            //        sw.Close();
            //    }
            //    if (File.Exists(Request.PhysicalApplicationPath + "\\Controls\\ShowDiss.aspx"))
            //    {
            //        TempStr = File.ReadAllText(Request.PhysicalApplicationPath + "\\Controls\\ShowDiss.aspx");
            //        TempStr = TempStr.Replace("{$ChannelId$}", TempId);

            //        sw = new StreamWriter(Request.PhysicalApplicationPath + "\\" + cDir + "\\Diss.aspx", false, System.Text.Encoding.GetEncoding("GB2312"));
            //        sw.Write(TempStr);
            //        sw.Close();
            //    }
            //    if (File.Exists(Request.PhysicalApplicationPath + "\\Controls\\Review.aspx"))
            //    {
            //        TempStr = File.ReadAllText(Request.PhysicalApplicationPath + "\\Controls\\Review.aspx");
            //        TempStr = TempStr.Replace("{$ChannelId$}", TempId);

            //        sw = new StreamWriter(Request.PhysicalApplicationPath + "\\" + cDir + "\\Review.aspx", false, System.Text.Encoding.GetEncoding("GB2312"));
            //        sw.Write(TempStr);
            //        sw.Close();
            //    }
            //    if (File.Exists(Request.PhysicalApplicationPath + "\\Controls\\Search.aspx"))
            //    {
            //        TempStr = File.ReadAllText(Request.PhysicalApplicationPath + "\\Controls\\Search.aspx");
            //        TempStr = TempStr.Replace("{$ChannelId$}", TempId);

            //        sw = new StreamWriter(Request.PhysicalApplicationPath + "\\" + cDir + "\\Search.aspx", false, System.Text.Encoding.GetEncoding("GB2312"));
            //        sw.Write(TempStr);
            //        sw.Close();
            //    }
            //}
        }
        #endregion

        #region ����һ��Ŀ¼
        /// <summary>
        /// ����һ��Ŀ¼
        /// </summary>
        /// <param name="directoryPath">Ŀ¼�ľ���·��</param>
        public static void CreateDirectory(string directoryPath)
        {
            //���Ŀ¼�������򴴽���Ŀ¼
            if (!IsExistDirectory(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }
        }
        #endregion

        #region ����һ���ļ�
        /// <summary>
        /// ����һ���ļ���
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>
        public static void CreateFile(string filePath)
        {
            try
            {
                //����ļ��������򴴽����ļ�
                if (!IsExistFile(filePath))
                {
                    //����һ��FileInfo����
                    FileInfo file = new FileInfo(filePath);

                    //�����ļ�
                    FileStream fs = file.Create();

                    //�ر��ļ���
                    fs.Close();
                }
            }
            catch (Exception ex)
            {
                //LogHelper.WriteTraceLog(TraceLogLevel.Error, ex.Message);
                throw ex;
            }
        }

        /// <summary>
        /// ����һ���ļ�,�����ֽ���д���ļ���
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>
        /// <param name="buffer">������������</param>
        public static void CreateFile(string filePath, byte[] buffer)
        {
            try
            {
                //����ļ��������򴴽����ļ�
                if (!IsExistFile(filePath))
                {
                    //����һ��FileInfo����
                    FileInfo file = new FileInfo(filePath);

                    //�����ļ�
                    FileStream fs = file.Create();

                    //д���������
                    fs.Write(buffer, 0, buffer.Length);

                    //�ر��ļ���
                    fs.Close();
                }
            }
            catch (Exception ex)
            {
                //LogHelper.WriteTraceLog(TraceLogLevel.Error, ex.Message);
                throw ex;
            }
        }
        #endregion

        #region ��ȡ�ı��ļ�������
        /// <summary>
        /// ��ȡ�ı��ļ�������
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>        
        public static int GetLineCount(string filePath)
        {
            //���ı��ļ��ĸ��ж���һ���ַ���������
            string[] rows = File.ReadAllLines(filePath);

            //��������
            return rows.Length;
        }
        #endregion

        #region ��ȡһ���ļ��ĳ���
        /// <summary>
        /// ��ȡһ���ļ��ĳ���,��λΪByte
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>        
        public static int GetFileSize(string filePath)
        {
            //����һ���ļ�����
            FileInfo fi = new FileInfo(filePath);

            //��ȡ�ļ��Ĵ�С
            return (int)fi.Length;
        }
        #endregion

        #region ��ȡָ��Ŀ¼�е���Ŀ¼�б�
        /// <summary>
        /// ��ȡָ��Ŀ¼����Ŀ¼��������Ŀ¼�б�
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>
        /// <param name="searchPattern">ģʽ�ַ�����"*"����0��N���ַ���"?"����1���ַ���
        /// ������"Log*.xml"��ʾ����������Log��ͷ��Xml�ļ���</param>
        /// <param name="isSearchChild">�Ƿ�������Ŀ¼</param>
        public static string[] GetDirectories(string directoryPath, string searchPattern, bool isSearchChild)
        {
            try
            {
                if (isSearchChild)
                {
                    return Directory.GetDirectories(directoryPath, searchPattern, SearchOption.AllDirectories);
                }
                else
                {
                    return Directory.GetDirectories(directoryPath, searchPattern, SearchOption.TopDirectoryOnly);
                }
            }
            catch (IOException ex)
            {
                throw ex;
            }
        }
        #endregion

        #region ���ı��ļ�д������

        /// <summary>
        /// ���ı��ļ���д������
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>
        /// <param name="text">д�������</param>
        /// <param name="encoding">����</param>
        public static void WriteText(string filePath, string text, Encoding encoding)
        {
            //���ļ�д������
            File.WriteAllText(filePath, text, encoding);
        }
        #endregion

        #region ���ı��ļ���β��׷������
        /// <summary>
        /// ���ı��ļ���β��׷������
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>
        /// <param name="content">д�������</param>
        public static void AppendText(string filePath, string content)
        {
            File.AppendAllText(filePath, content);
        }
        #endregion

        #region �������ļ������ݸ��Ƶ����ļ���
        /// <summary>
        /// ��Դ�ļ������ݸ��Ƶ�Ŀ���ļ���
        /// </summary>
        /// <param name="sourceFilePath">Դ�ļ��ľ���·��</param>
        /// <param name="destFilePath">Ŀ���ļ��ľ���·��</param>
        public static void Copy(string sourceFilePath, string destFilePath)
        {
            File.Copy(sourceFilePath, destFilePath, true);
        }
        #endregion

        #region ���ļ��ľ���·���л�ȡ�ļ���( ��������չ�� )
        /// <summary>
        /// ���ļ��ľ���·���л�ȡ�ļ���( ��������չ�� )
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>        
        public static string GetFileNameNoExtension(string filePath)
        {
            //��ȡ�ļ�������
            FileInfo fi = new FileInfo(filePath);
            return fi.Name.Split('.')[0];
        }
        #endregion

        #region ���ļ��ľ���·���л�ȡ��չ��
        /// <summary>
        /// ���ļ��ľ���·���л�ȡ��չ��
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>        
        public static string GetExtension(string filePath)
        {
            //��ȡ�ļ�������
            FileInfo fi = new FileInfo(filePath);
            return fi.Extension;
        }
        #endregion

        #region ����ļ�����
        /// <summary>
        /// ����ļ�����
        /// </summary>
        /// <param name="filePath">�ļ��ľ���·��</param>
        public static void ClearFile(string filePath)
        {
            //ɾ���ļ�
            File.Delete(filePath);

            //���´������ļ�
            CreateFile(filePath);
        }
        #endregion

        #region ɾ��ָ��Ŀ¼
        /// <summary>
        /// ɾ��ָ��Ŀ¼����������Ŀ¼
        /// </summary>
        /// <param name="directoryPath">ָ��Ŀ¼�ľ���·��</param>
        public static void DeleteDirectory(string directoryPath)
        {
            if (IsExistDirectory(directoryPath))
            {
                Directory.Delete(directoryPath, true);
            }
        }
        #endregion

        #region ��ȡ�ļ�����һ��Ŀ¼
        /// <summary>
        /// ��ȡ�ļ�����һ��Ŀ¼
        /// </summary>
        /// <param name="filePath"></param>
        public static string GetLastDirectory(string filePath)
        {
            if (IsExistFile(filePath))
            {
                int lastIndex = filePath.LastIndexOf("\\");
                return filePath.Substring(0, lastIndex);
            }
            else
                return "";
        }
        #endregion

    }
}
