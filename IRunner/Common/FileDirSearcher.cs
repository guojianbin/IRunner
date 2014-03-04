using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
namespace IRunner
{
    public class FileDirSearcher
    {


        /// <summary>
        /// 文件夹遍历方法（广度优先算法）
        /// </summary>
        /// <param name="sPathName">起始文件夹</param>
        public static FileInfo[] TraversingAllFiles(string sPathName)
        {
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            //创建一个队列用于保存子目录
            System.Collections.Generic.Queue<string> pathQueue = new System.Collections.Generic.Queue<string>();
            //首先把根目录排入队中
            pathQueue.Enqueue(sPathName);
            //开始循环查找文件，直到队列中无任何子目录
            string path = string.Empty;
            while (pathQueue.Count > 0)
            {
                //从队列中取出一个目录，把该目录下的所有子目录排入队中
                path = pathQueue.Dequeue();

                foreach (DirectoryInfo diChild in GetAllDirPath(path))
                {
                    pathQueue.Enqueue(diChild.FullName);
                }

                //查找该目录下的所有文件，依次处理
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
