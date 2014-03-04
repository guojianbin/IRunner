using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
namespace IRunner
{
    public class FileDirSearcher
    {


        /// <summary>
        /// �ļ��б�����������������㷨��
        /// </summary>
        /// <param name="sPathName">��ʼ�ļ���</param>
        public static FileInfo[] TraversingAllFiles(string sPathName)
        {
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            //����һ���������ڱ�����Ŀ¼
            System.Collections.Generic.Queue<string> pathQueue = new System.Collections.Generic.Queue<string>();
            //���ȰѸ�Ŀ¼�������
            pathQueue.Enqueue(sPathName);
            //��ʼѭ�������ļ���ֱ�����������κ���Ŀ¼
            string path = string.Empty;
            while (pathQueue.Count > 0)
            {
                //�Ӷ�����ȡ��һ��Ŀ¼���Ѹ�Ŀ¼�µ�������Ŀ¼�������
                path = pathQueue.Dequeue();

                foreach (DirectoryInfo diChild in GetAllDirPath(path))
                {
                    pathQueue.Enqueue(diChild.FullName);
                }

                //���Ҹ�Ŀ¼�µ������ļ������δ���
                foreach (FileInfo fi in GetAllFilePath(path))
                    al.Add(fi);

            }
            return (FileInfo[])al.ToArray(typeof(FileInfo));
        }

        public static FileInfo[] GetAllFilePath(string path)
        {
            FileDirectoryEnumerator ef = new FileDirectoryEnumerator();
            ef.SearchPath = path;
            ef.Reset();
            ef.SearchForDirectory = false;
            ef.SearchForFile = true;
            ef.ReturnStringType = false;
            ef.ThrowIOException = false;
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            while (ef.MoveNext())
            {
                al.Add((FileInfo)ef.Current);
            }
            ef.Close();
            return (FileInfo[])al.ToArray(typeof(FileInfo));
        }

        public static DirectoryInfo[] GetAllDirPath(string path)
        {
            FileDirectoryEnumerator ef = new FileDirectoryEnumerator();
            ef.SearchPath = path;
            ef.Reset();
            ef.SearchForDirectory = true;
            ef.SearchForFile = false;
            ef.ReturnStringType = false;
            ef.ThrowIOException = false;
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            while (ef.MoveNext())
            {
                al.Add((DirectoryInfo)ef.Current);
            }
            ef.Close();
            return (DirectoryInfo[])al.ToArray(typeof(DirectoryInfo));
        }


    }
}
