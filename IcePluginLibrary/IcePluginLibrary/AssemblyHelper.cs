using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
namespace IcePluginLibrary
{
    /// <summary>
    /// 程序集属性访问器
    /// </summary>
    public class AssemblyHelper
    {

        #region How to use
        /*
            [assembly: AssemblyTitle("项目名称")]
            [assembly: AssemblyDescription("系统功能描述")]
            [assembly: AssemblyConfiguration("")]
            [assembly: AssemblyCompany("Ice.Company")]
            [assembly: AssemblyProduct("SystemMenuDemo")]
            [assembly: AssemblyCopyright("版权所有 (C) Ice.Kwok 2009")]
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

        #region 程序集属性访问器
        /// <summary>
        /// 标题
        /// </summary>
        public string AssemblyTitle
        {
            get
            {
                // 获取此程序集上的所有 Title 属性
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyTitleAttribute), false);
                // 如果至少有一个 Title 属性
                if (attributes.Length > 0)
                {
                    // 请选择第一个属性
                    AssemblyTitleAttribute titleAttribute = (AssemblyTitleAttribute)attributes[0];
                    // 如果该属性为非空字符串，则将其返回
                    if (titleAttribute.Title != "")
                        return titleAttribute.Title;
                }
                // 如果没有 Title 属性，或者 Title 属性为一个空字符串，则返回 .exe 的名称
                return System.IO.Path.GetFileNameWithoutExtension(assObj.CodeBase);
            }
        }
        /// <summary>
        /// 版本
        /// </summary>
        public string AssemblyVersion
        {
            get
            {
                return assObj.GetName().Version.ToString();
            }
        }
        /// <summary>
        /// 描述
        /// </summary>
        public string AssemblyDescription
        {
            get
            {
                // 获取此程序集的所有 Description 属性
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyDescriptionAttribute), false);
                // 如果 Description 属性不存在，则返回一个空字符串
                if (attributes.Length == 0)
                    return "";
                // 如果有 Description 属性，则返回该属性的值
                return ((AssemblyDescriptionAttribute)attributes[0]).Description;
            }
        }
        /// <summary>
        /// 产品
        /// </summary>
        public string AssemblyProduct
        {
            get
            {
                // 获取此程序集上的所有 Product 属性
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyProductAttribute), false);
                // 如果 Product 属性不存在，则返回一个空字符串
                if (attributes.Length == 0)
                    return "";
                // 如果有 Product 属性，则返回该属性的值
                return ((AssemblyProductAttribute)attributes[0]).Product;
            }
        }
        /// <summary>
        /// 版权
        /// </summary>
        public string AssemblyCopyright
        {
            get
            {
                // 获取此程序集上的所有 Copyright 属性
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyCopyrightAttribute), false);
                // 如果 Copyright 属性不存在，则返回一个空字符串
                if (attributes.Length == 0)
                    return "";
                // 如果有 Copyright 属性，则返回该属性的值
                return ((AssemblyCopyrightAttribute)attributes[0]).Copyright;
            }
        }
        /// <summary>
        /// 公司
        /// </summary>
        public string AssemblyCompany
        {
            get
            {
                // 获取此程序集上的所有 Company 属性
                object[] attributes = assObj.GetCustomAttributes(typeof(AssemblyCompanyAttribute), false);
                // 如果 Company 属性不存在，则返回一个空字符串
                if (attributes.Length == 0)
                    return "";
                // 如果有 Company 属性，则返回该属性的值
                return ((AssemblyCompanyAttribute)attributes[0]).Company;
            }
        }

        /// <summary>
        /// GUID(原始GUID)
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
        /// GUID(每次编译随机生成GUID)
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