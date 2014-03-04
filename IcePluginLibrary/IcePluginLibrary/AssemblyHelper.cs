using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
namespace IcePluginLibrary
{
    /// <summary>
    /// �������Է�����
    /// </summary>
    public class AssemblyHelper
    {

        #region How to use
        /*
            [assembly: AssemblyTitle("��Ŀ����")]
            [assembly: AssemblyDescription("ϵͳ��������")]
            [assembly: AssemblyConfiguration("")]
            [assembly: AssemblyCompany("Ice.Company")]
            [assembly: AssemblyProduct("SystemMenuDemo")]
            [assembly: AssemblyCopyright("��Ȩ���� (C) Ice.Kwok 2009")]
            [assembly: AssemblyTrademark("Ice.Kwok  2009--Starts_2000")]
            [assembly: AssemblyCulture("")]
            [assembly: AssemblyVersion("1.0.0.0")]
            [assembly: AssemblyFileVersion("1.0.0.0")]
         
         */
        #endregion

        private Assembly assObj = null;

        public AssemblyHelper(Assembly obj)
        {
            if (obj != null)
            {
                assObj = obj;
            }
            else
                throw new Exception("The Assembly Object Can Not Be Null!");
        }

        #region �������Է�����
        /// <summary>
        /// ����
        /// </summary>
        public string AssemblyTitle
        {
            get
            {
                // ��ȡ�˳����ϵ����� Title ����
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyTitleAttribute), false);
                // ���������һ�� Title ����
                if (attributes.Length > 0)
                {
                    // ��ѡ���һ������
                    AssemblyTitleAttribute titleAttribute = (AssemblyTitleAttribute)attributes[0];
                    // ���������Ϊ�ǿ��ַ��������䷵��
                    if (titleAttribute.Title != "")
                        return titleAttribute.Title;
                }
                // ���û�� Title ���ԣ����� Title ����Ϊһ�����ַ������򷵻� .exe ������
                return System.IO.Path.GetFileNameWithoutExtension(assObj.CodeBase);
            }
        }
        /// <summary>
        /// �汾
        /// </summary>
        public string AssemblyVersion
        {
            get
            {
                return assObj.GetName().Version.ToString();
            }
        }
        /// <summary>
        /// ����
        /// </summary>
        public string AssemblyDescription
        {
            get
            {
                // ��ȡ�˳��򼯵����� Description ����
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyDescriptionAttribute), false);
                // ��� Description ���Բ����ڣ��򷵻�һ�����ַ���
                if (attributes.Length == 0)
                    return "";
                // ����� Description ���ԣ��򷵻ظ����Ե�ֵ
                return ((AssemblyDescriptionAttribute)attributes[0]).Description;
            }
        }
        /// <summary>
        /// ��Ʒ
        /// </summary>
        public string AssemblyProduct
        {
            get
            {
                // ��ȡ�˳����ϵ����� Product ����
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyProductAttribute), false);
                // ��� Product ���Բ����ڣ��򷵻�һ�����ַ���
                if (attributes.Length == 0)
                    return "";
                // ����� Product ���ԣ��򷵻ظ����Ե�ֵ
                return ((AssemblyProductAttribute)attributes[0]).Product;
            }
        }
        /// <summary>
        /// ��Ȩ
        /// </summary>
        public string AssemblyCopyright
        {
            get
            {
                // ��ȡ�˳����ϵ����� Copyright ����
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyCopyrightAttribute), false);
                // ��� Copyright ���Բ����ڣ��򷵻�һ�����ַ���
                if (attributes.Length == 0)
                    return "";
                // ����� Copyright ���ԣ��򷵻ظ����Ե�ֵ
                return ((AssemblyCopyrightAttribute)attributes[0]).Copyright;
            }
        }
        /// <summary>
        /// ��˾
        /// </summary>
        public string AssemblyCompany
        {
            get
            {
                // ��ȡ�˳����ϵ����� Company ����
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyCompanyAttribute), false);
                // ��� Company ���Բ����ڣ��򷵻�һ�����ַ���
                if (attributes.Length == 0)
                    return "";
                // ����� Company ���ԣ��򷵻ظ����Ե�ֵ
                return ((AssemblyCompanyAttribute)attributes[0]).Company;
            }
        }

        /// <summary>
        /// GUID(ԭʼGUID)
        /// </summary>
        public string AssemblyGUID
        {
            get
            {
                Attribute guid_attr = Attribute.GetCustomAttribute(assObj, typeof(System.Runtime.InteropServices.GuidAttribute));
                return ((System.Runtime.InteropServices.GuidAttribute)guid_attr).Value;
            }
        }

        /// <summary>
        /// GUID(ÿ�α����������GUID)
        /// </summary>
        public string AssemblyGUID2
        {
            get
            {

                return assObj.ManifestModule.ModuleVersionId.ToString();
            }
        }

        #endregion

    }

}