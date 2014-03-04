using Microsoft.Win32;
namespace IRunner
{
    /// <summary>
    /// ϵͳ�˵�������
    /// </summary>
    public class SystemMenuHelper
    {
        /// <summary>
        /// �����ļ��Ҽ��˵�
        /// </summary>
        /// <param name="itemName"></param>
        /// <param name="associatedProgramFullPath"></param>
        public void AddFileContextMenuItem(string itemName, string associatedProgramFullPath, string menuDesciption)
        {
            //�����shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"*\shell", true);
            if (shellKey == null)
            {
                shellKey = Registry.ClassesRoot.CreateSubKey(@"*\shell");
            }

            //������Ҽ���ʾ�Ĳ˵�����
            RegistryKey rightCommondKey = shellKey.CreateSubKey(itemName);
            rightCommondKey.SetValue("", menuDesciption);
            RegistryKey associatedProgramKey = rightCommondKey.CreateSubKey("command");

            //����Ĭ��ֵ�������ĳ���
            associatedProgramKey.SetValue(string.Empty, associatedProgramFullPath);

            //ˢ�µ����̲��ͷ���Դ
            associatedProgramKey.Close();
            rightCommondKey.Close();
            shellKey.Close();
        }
        /// <summary>
        /// �����ļ����Ҽ��˵�
        /// </summary>
        /// <param name="itemName"></param>
        /// <param name="associatedProgramFullPath"></param>
        public void AddDirectoryContextMenuItem(string itemName, string associatedProgramFullPath, string menuDesciption)
        {
            //�����shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"directory\shell", true);
            if (shellKey == null)
            {
                shellKey = Registry.ClassesRoot.CreateSubKey(@"*\shell");
            }

            //������Ҽ���ʾ�Ĳ˵�����
            RegistryKey rightCommondKey = shellKey.CreateSubKey(itemName);
            rightCommondKey.SetValue("", menuDesciption);
            RegistryKey associatedProgramKey = rightCommondKey.CreateSubKey("command");

            //����Ĭ��ֵ�������ĳ���
            associatedProgramKey.SetValue("", associatedProgramFullPath);


            //ˢ�µ����̲��ͷ���Դ
            associatedProgramKey.Close();
            rightCommondKey.Close();
            shellKey.Close();
        }
        /// <summary>
        /// ɾ���ļ��Ҽ��˵�
        /// </summary>
        /// <param name="itemName"></param>
        public void DelFileContextMenuItem(string itemName)
        {
            //�����shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"*\shell", true);
            if (shellKey != null)
            {
                shellKey.DeleteSubKeyTree(itemName);
            }
            shellKey.Close();
        }
        /// <summary>
        /// ɾ���ļ����Ҽ��˵�
        /// </summary>
        /// <param name="itemName"></param>
        public void DelDirectoryContextMenuItem(string itemName)
        {
            //�����shell 
            RegistryKey shellKey = Registry.ClassesRoot.OpenSubKey(@"directory\shell", true);
            if (shellKey != null)
            {
                shellKey.DeleteSubKeyTree(itemName);
            }
            shellKey.Close();
        }

    }
}
