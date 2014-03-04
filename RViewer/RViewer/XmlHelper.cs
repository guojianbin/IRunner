using System.Xml;
using System.Data;
using System;
using System.Windows.Forms;
namespace RViewer
{
    /// <summary>
    /// Xml�Ĳ���������
    /// </summary>    
    public class XmlHelper : IDisposable
    {
        public static string XmlPath = Application.StartupPath + "\\RVList.xml";

        #region �ֶζ���
        /// <summary>
        /// XML�ļ�������·��
        /// </summary>
        private string _filePath = string.Empty;
        /// <summary>
        /// Xml�ĵ�
        /// </summary>
        private XmlDocument _xml;
        /// <summary>
        /// XML�ĸ��ڵ�
        /// </summary>
        private XmlElement _element;
        #endregion

        #region ���췽��
        /// <summary>
        /// ʵ����XmlHelper����
        /// </summary>
        /// <param name="xmlFilePath">Xml�ļ������·��</param>
        public XmlHelper(string xmlFilePath)
        {
            //��ȡXML�ļ��ľ���·��
            _filePath = xmlFilePath;
            CreateXMLElement();
        }

        public XmlHelper()
        {
            _filePath = XmlPath;
            CreateXMLElement();
        }

        public XmlHelper(XmlDocument xml, string xmlFilePath)
        {
            _xml = xml;
            _filePath = xmlFilePath;
            //ΪXML�ĸ��ڵ㸳ֵ
            _element = _xml.DocumentElement;
        }
        #endregion

        #region ����XML�ĸ��ڵ�
        /// <summary>
        /// ����XML�ĸ��ڵ�
        /// </summary>
        private void CreateXMLElement()
        {

            //����һ��XML����
            _xml = new XmlDocument();

            if (System.IO.File.Exists(_filePath))
            {
                //����XML�ļ�
                _xml.Load(this._filePath);
            }

            //ΪXML�ĸ��ڵ㸳ֵ
            _element = _xml.DocumentElement;
        }
        #endregion

        private void CreateXmlDeclaration()
        {
            if (_element == null)
            {
                XmlDeclaration dec = _xml.CreateXmlDeclaration("1.0", "utf-8", null);
                _xml.AppendChild(dec);

            }
        }

        /// <summary>
        /// �ĵ����ڵ�
        /// </summary>
        /// <returns></returns>
        public XmlNode RootNode
        {
            get { return _xml.DocumentElement; }
        }

        /// <summary>
        /// ��ȡ���ڵ�
        /// </summary>
        /// <returns></returns>
        public XmlNode CreateElement(string element)
        {
            if (_xml != null)
            {
                return _xml.CreateElement(element);
            }
            else
                return null;

        }

        /// <summary>
        /// �������
        /// </summary>
        /// <param name="node"></param>
        /// <param name="attributeName"></param>
        /// <param name="value"></param>
        public void SetAttribute(XmlNode node, string attributeName, string value)
        {
            try
            {
                XmlDocument doc = node.OwnerDocument;
                XmlAttribute attr = null;
                attr = doc.CreateAttribute(attributeName);
                attr.Value = value;
                node.Attributes.SetNamedItem(attr);
            }
            catch (Exception err)
            {
                string desc = err.Message;
            }
        }

        /// <summary>
        /// �������
        /// </summary>
        /// <param name="node"></param>
        /// <param name="attributeName"></param>
        /// <param name="value"></param>
        public void SetAttribute(XmlNode node, System.Collections.Generic.Dictionary<string, string> keyValues)
        {
            try
            {
                if (keyValues.Count > 0)
                {
                    XmlDocument doc = node.OwnerDocument;
                    XmlAttribute attr = null;
                    foreach (System.Collections.Generic.KeyValuePair<string, string> kv in keyValues)
                    {
                        attr = doc.CreateAttribute(kv.Key);
                        attr.Value = kv.Value;
                        node.Attributes.SetNamedItem(attr);
                    }
                }
            }
            catch (Exception err)
            {
                string desc = err.Message;
            }
        }

        #region ��ȡָ��XPath���ʽ�Ľڵ����
        /// <summary>
        /// ��ȡָ��XPath���ʽ�Ľڵ����
        /// </summary>        
        /// <param name="xPath">XPath���ʽ,
        /// ����1: @"Skill/First/SkillItem", ��Ч�� @"//Skill/First/SkillItem"
        /// ����2: @"Table[USERNAME='a']" , []��ʾɸѡ,USERNAME��Table�µ�һ���ӽڵ�.
        /// ����3: @"ApplyPost/Item[@itemName='��λ���']",@itemName��Item�ڵ������.
        /// </param>
        public XmlNode GetNode(string xPath)
        {
            //����XPath�ڵ�
            return _element.SelectSingleNode(xPath);
        }
        #endregion

        #region ��ȡָ��XPath���ʽ�ڵ��ֵ
        /// <summary>
        /// ��ȡָ��XPath���ʽ�ڵ��ֵ
        /// </summary>
        /// <param name="xPath">XPath���ʽ,
        /// ����1: @"Skill/First/SkillItem", ��Ч�� @"//Skill/First/SkillItem"
        /// ����2: @"Table[USERNAME='a']" , []��ʾɸѡ,USERNAME��Table�µ�һ���ӽڵ�.
        /// ����3: @"ApplyPost/Item[@itemName='��λ���']",@itemName��Item�ڵ������.
        /// </param>
        public string GetValue(string xPath)
        {

            //����XPath�ڵ��ֵ
            return _element.SelectSingleNode(xPath).InnerText;
        }
        #endregion

        #region ��ȡָ��XPath���ʽ�ڵ������ֵ
        /// <summary>
        /// ��ȡָ��XPath���ʽ�ڵ������ֵ
        /// </summary>
        /// <param name="xPath">XPath���ʽ,
        /// ����1: @"Skill/First/SkillItem", ��Ч�� @"//Skill/First/SkillItem"
        /// ����2: @"Table[USERNAME='a']" , []��ʾɸѡ,USERNAME��Table�µ�һ���ӽڵ�.
        /// ����3: @"ApplyPost/Item[@itemName='��λ���']",@itemName��Item�ڵ������.
        /// </param>
        /// <param name="attributeName">������</param>
        public string GetAttributeValue(string xPath, string attributeName)
        {
            //����XPath�ڵ������ֵ
            return _element.SelectSingleNode(xPath).Attributes[attributeName].Value;
        }
        #endregion

        #region �����ڵ�
        /// <summary>
        /// 1. ���ܣ������ڵ㡣
        /// 2. ʹ��������������ڵ���뵽��ǰXml�ļ��С�
        /// </summary>        
        /// <param name="xmlNode">Ҫ�����Xml�ڵ�</param>
        public void AppendNode(XmlNode xmlNode)
        {
            //����ڵ�
            XmlNode node = _xml.ImportNode(xmlNode, true);

            //���ڵ���뵽���ڵ���
            _element.AppendChild(node);
        }

        /// <summary>
        /// 1. ���ܣ������ڵ㡣
        /// 2. ʹ����������DataSet�еĵ�һ����¼����Xml�ļ��С�
        /// </summary>        
        /// <param name="ds">DataSet��ʵ������DataSet��Ӧ��ֻ��һ����¼</param>
        public void AppendNode(DataSet ds)
        {
            //����XmlDataDocument����
            XmlDataDocument xmlDataDocument = new XmlDataDocument(ds);

            //����ڵ�
            XmlNode node = xmlDataDocument.DocumentElement.FirstChild;

            //���ڵ���뵽���ڵ���
            AppendNode(node);
        }
        #endregion

        #region ɾ���ڵ�
        /// <summary>
        /// ɾ��ָ��XPath���ʽ�Ľڵ�
        /// </summary>        
        /// <param name="xPath">XPath���ʽ,
        /// ����1: @"Skill/First/SkillItem", ��Ч�� @"//Skill/First/SkillItem"
        /// ����2: @"Table[USERNAME='a']" , []��ʾɸѡ,USERNAME��Table�µ�һ���ӽڵ�.
        /// ����3: @"ApplyPost/Item[@itemName='��λ���']",@itemName��Item�ڵ������.
        /// </param>
        public void RemoveNode(string xPath)
        {
            //��ȡҪɾ���Ľڵ�
            XmlNode node = _xml.SelectSingleNode(xPath);

            //ɾ���ڵ�
            _element.RemoveChild(node);
        }
        #endregion //ɾ���ڵ�

        #region ����XML�ļ�
        /// <summary>
        /// ����XML�ļ�
        /// </summary>        
        public void Save()
        {
            //����XML�ļ�
            _xml.Save(this._filePath);
        }
        #endregion //����XML�ļ�

        #region ��̬����

        #region �������ڵ����
        /// <summary>
        /// �������ڵ����
        /// </summary>
        /// <param name="xmlFilePath">Xml�ļ������·��</param>        
        private static XmlElement CreateRootElement(string xmlFilePath)
        {
            //�����������ʾXML�ļ��ľ���·��
            string filePath = "";

            //��ȡXML�ļ��ľ���·��
            filePath = xmlFilePath;

            //����XmlDocument����
            XmlDocument xmlDocument = new XmlDocument();
            //����XML�ļ�
            xmlDocument.Load(filePath);

            //���ظ��ڵ�
            return xmlDocument.DocumentElement;
        }
        #endregion

        #region ��ȡָ��XPath���ʽ�ڵ��ֵ
        /// <summary>
        /// ��ȡָ��XPath���ʽ�ڵ��ֵ
        /// </summary>
        /// <param name="xmlFilePath">Xml�ļ������·��</param>
        /// <param name="xPath">XPath���ʽ,
        /// ����1: @"Skill/First/SkillItem", ��Ч�� @"//Skill/First/SkillItem"
        /// ����2: @"Table[USERNAME='a']" , []��ʾɸѡ,USERNAME��Table�µ�һ���ӽڵ�.
        /// ����3: @"ApplyPost/Item[@itemName='��λ���']",@itemName��Item�ڵ������.
        /// </param>
        public static string GetValue(string xmlFilePath, string xPath)
        {
            //����������
            XmlElement rootElement = CreateRootElement(xmlFilePath);

            //����XPath�ڵ��ֵ
            return rootElement.SelectSingleNode(xPath).InnerText;
        }
        #endregion

        #region ��ȡָ��XPath���ʽ�ڵ������ֵ
        /// <summary>
        /// ��ȡָ��XPath���ʽ�ڵ������ֵ
        /// </summary>
        /// <param name="xmlFilePath">Xml�ļ������·��</param>
        /// <param name="xPath">XPath���ʽ,
        /// ����1: @"Skill/First/SkillItem", ��Ч�� @"//Skill/First/SkillItem"
        /// ����2: @"Table[USERNAME='a']" , []��ʾɸѡ,USERNAME��Table�µ�һ���ӽڵ�.
        /// ����3: @"ApplyPost/Item[@itemName='��λ���']",@itemName��Item�ڵ������.
        /// </param>
        /// <param name="attributeName">������</param>
        public static string GetAttributeValue(string xmlFilePath, string xPath, string attributeName)
        {
            //����������
            XmlElement rootElement = CreateRootElement(xmlFilePath);

            //����XPath�ڵ������ֵ
            return rootElement.SelectSingleNode(xPath).Attributes[attributeName].Value;
        }
        #endregion

        #endregion

        /// <summary>
        /// ��ȡ����
        /// </summary>
        /// <param name="path">·��</param>
        /// <param name="node">�ڵ�</param>
        /// <param name="attribute">���������ǿ�ʱ���ظ�����ֵ�����򷵻ش���ֵ</param>
        /// <returns>string</returns>
        /**************************************************
         * ʹ��ʾ��:
         * XmlHelper.Read(path, "/Node", "")
         * XmlHelper.Read(path, "/Node/Element[@Attribute='Name']", "Attribute")
         ************************************************/
        public static string Read(string path, string node, string attribute)
        {
            string value = "";
            try
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(path);
                XmlNode xn = doc.SelectSingleNode(node);
                if (xn != null)
                    if (xn.Attributes != null)
                        value = (attribute.Equals("") ? xn.InnerText : xn.Attributes[attribute].Value);
            }
            catch (Exception e)
            {
                return e.Message;
            }
            return value;
        }

        /// <summary>
        /// ��������
        /// </summary>
        /// <param name="path">·��</param>
        /// <param name="node">�ڵ�</param>
        /// <param name="element">Ԫ�������ǿ�ʱ������Ԫ�أ������ڸ�Ԫ���в�������</param>
        /// <param name="attribute">���������ǿ�ʱ�����Ԫ������ֵ���������Ԫ��ֵ</param>
        /// <param name="value">ֵ</param>
        /// <returns></returns>
        /**************************************************
         * ʹ��ʾ��:
         * XmlHelper.Insert(path, "/Node", "Element", "", "Value")
         * XmlHelper.Insert(path, "/Node", "Element", "Attribute", "Value")
         * XmlHelper.Insert(path, "/Node", "", "Attribute", "Value")
         ************************************************/
        public static void Insert(string path, string node, string element, string attribute, string value)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            XmlNode xn = doc.SelectSingleNode(node);
            if (element.Equals(""))
            {
                if (!attribute.Equals(""))
                {
                    XmlElement xe = (XmlElement)xn;
                    if (xe != null) xe.SetAttribute(attribute, value);
                }
            }
            else
            {
                XmlElement xe = doc.CreateElement(element);
                if (attribute.Equals(""))
                    xe.InnerText = value;
                else
                    xe.SetAttribute(attribute, value);
                if (xn != null) xn.AppendChild(xe);
            }
            doc.Save(path);
        }

        /// <summary>
        /// �޸�����
        /// </summary>
        /// <param name="path">·��</param>
        /// <param name="node">�ڵ�</param>
        /// <param name="attribute">���������ǿ�ʱ�޸ĸýڵ�����ֵ�������޸Ľڵ�ֵ</param>
        /// <param name="value">ֵ</param>
        /// <returns></returns>
        /**************************************************
         * ʹ��ʾ��:
         * XmlHelper.Insert(path, "/Node", "", "Value")
         * XmlHelper.Insert(path, "/Node", "Attribute", "Value")
         ************************************************/
        public static void Update(string path, string node, string attribute, string value)
        {
            try
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(path);
                XmlNode xn = doc.SelectSingleNode(node);
                XmlElement xe = (XmlElement)xn;
                if (attribute.Equals(""))
                {
                    if (xe != null) xe.InnerText = value;
                }
                else if (xe != null) xe.SetAttribute(attribute, value);
                doc.Save(path);
            }
            catch (Exception)
            {
                return;
            }
        }

        /// <summary>
        /// ɾ������
        /// </summary>
        /// <param name="path">·��</param>
        /// <param name="node">�ڵ�</param>
        /// <param name="attribute">���������ǿ�ʱɾ���ýڵ�����ֵ������ɾ���ڵ�ֵ</param>
        /// <returns></returns>
        /**************************************************
         * ʹ��ʾ��:
         * XmlHelper.Delete(path, "/Node", "")
         * XmlHelper.Delete(path, "/Node", "Attribute")
         ************************************************/
        public static void Delete(string path, string node, string attribute)
        {
            try
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(path);
                XmlNode xn = doc.SelectSingleNode(node);
                XmlElement xe = (XmlElement)xn;
                if (attribute.Equals(""))
                {
                    if (xn != null) if (xn.ParentNode != null) xn.ParentNode.RemoveChild(xn);
                }
                else if (xe != null) xe.RemoveAttribute(attribute);
                doc.Save(path);
            }
            catch
            {
                return;
            }
        }


        /// <summary>
        /// �½�һ��XML�ĵ�
        /// </summary>
        /// <param name="sfilePath"></param>
        /// <returns></returns>
        public static XmlDocument InitXmlDoc(string sfilePath)
        {
            //����һ��XML����
            XmlDocument _xml = new XmlDocument();

            if (System.IO.File.Exists(sfilePath))
            {
                //����XML�ļ�
                _xml.Load(sfilePath);
                return _xml;
            }
            XmlDeclaration dec = _xml.CreateXmlDeclaration("1.0", "utf-8", null);
            _xml.AppendChild(dec);
            //�������ڵ� config           
            XmlElement config = _xml.CreateElement("iceBoxItemList");
            _xml.AppendChild(config);
            //�������xml�ļ�������D��             
            _xml.Save(sfilePath);
            return _xml;
        }


        #region IDisposable ��Ա

        public void Dispose()
        {
            if (_xml != null)
            {
                _xml = null;
            }
        }

        #endregion
    }
}
