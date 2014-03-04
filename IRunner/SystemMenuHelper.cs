using Microsoft.Win32;
namespace IRunner
{
    /// <summary>
    /// 系统菜单帮助类
    /// </summary>
    public class SystemMenuHelper
    {
        /// <summary>
        /// 增加文件右键菜单
        /// </summary>
        /// <param name="itemName"></param>
        /// <param name="associatedProgramFullPath"></param>
        public void AddFileContextMenuItem(string itemName, string associatedProgramFullPath, string menuDesciption)
        {
            //创建项：shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"*\shell", true);
            if (shellKey == null)
            {
                shellKey = Registry.ClassesRoot.CreateSubKey(@"*\shell");
            }

            //创建项：右键显示的菜单名称
            RegistryKey rightCommondKey = shellKey.CreateSubKey(itemName);
            rightCommondKey.SetValue("", menuDesciption);
            RegistryKey associatedProgramKey = rightCommondKey.CreateSubKey("command");

            //创建默认值：关联的程序
            associatedProgramKey.SetValue(string.Empty, associatedProgramFullPath);

            //刷新到磁盘并释放资源
            associatedProgramKey.Close();
            rightCommondKey.Close();
            shellKey.Close();
        }
        /// <summary>
        /// 增加文件夹右键菜单
        /// </summary>
        /// <param name="itemName"></param>
        /// <param name="associatedProgramFullPath"></param>
        public void AddDirectoryContextMenuItem(string itemName, string associatedProgramFullPath, string menuDesciption)
        {
            //创建项：shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"directory\shell", true);
            if (shellKey == null)
            {
                shellKey = Registry.ClassesRoot.CreateSubKey(@"*\shell");
            }

            //创建项：右键显示的菜单名称
            RegistryKey rightCommondKey = shellKey.CreateSubKey(itemName);
            rightCommondKey.SetValue("", menuDesciption);
            RegistryKey associatedProgramKey = rightCommondKey.CreateSubKey("command");

            //创建默认值：关联的程序
            associatedProgramKey.SetValue("", associatedProgramFullPath);


            //刷新到磁盘并释放资源
            associatedProgramKey.Close();
            rightCommondKey.Close();
            shellKey.Close();
        }
        /// <summary>
        /// 删除文件右键菜单
        /// </summary>
        /// <param name="itemName"></param>
        public void DelFileContextMenuItem(string itemName)
        {
            //创建项：shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"*\shell", true);
            if (shellKey != null)
            {
                shellKey.DeleteSubKeyTree(itemName);
            }
            shellKey.Close();
        }
        /// <summary>
        /// 删除文件夹右键菜单
        /// </summary>
        /// <param name="itemName"></param>
        public void DelDirectoryContextMenuItem(string itemName)
        {
            //创建项：shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"directory\shell", true);
            if (shellKey != null)
            {
                shellKey.DeleteSubKeyTree(itemName);
            }
            shellKey.Close();
        }

    }
}
