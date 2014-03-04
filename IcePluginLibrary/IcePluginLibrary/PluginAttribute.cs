using System;
namespace IcePluginLibrary
{
    public class PluginAttribute
    {
        private string _Name = "";
        private string _Version = "";
        private string _Developer = "";
        private string _Webpage = "";
        private object _Tag = null;
        private string _Description = "";
        private bool _LoadWhenStart = false;
        private string _GUID = "";

        public PluginAttribute() { }

        public PluginAttribute(string name, string version, string developer, string webpage, bool loadWhenStart, string description)
        {
            _Name = name;
            _Version = version;
            _Developer = developer;
            _Webpage = webpage;
            _LoadWhenStart = loadWhenStart;
            _Description = description;
        }

        /// <summary>
        /// Ψһ��ʾ��
        /// </summary>
        public string GUID
        {
            get
            {
                return _GUID;
            }
            set
            {
                _GUID = value;
            }
        }

        /// <summary>
        /// �������
        /// </summary>
        public string Name
        {
            get
            {
                return _Name;
            }
            set
            {
                _Name = value;
            }
        }
        /// <summary>
        /// �汾��
        /// </summary>
        public string Version
        {
            get
            {
                return _Version;
            }
            set
            {
                _Version = value;
            }
        }
        /// <summary>
        /// ������
        /// </summary>
        public string Developer
        {
            get
            {
                return _Developer;
            }
            set
            {
                _Developer = value;
            }
        }
        /// <summary>
        /// ��ҳ��ַ
        /// </summary>
        public string Webpage
        {
            get
            {
                return _Webpage;
            }
            set
            {
                _Webpage = value;
            }
        }
        /// <summary>
        /// ������Ϣ
        /// </summary>
        public string Description
        {
            get
            {
                return _Description;
            }
            set
            {
                _Description = value;
            }
        }
        /// <summary>
        /// �Ƿ�����ʱ����
        /// </summary>
        public bool LoadWhenStart
        {
            get
            {
                return _LoadWhenStart;
            }
            set
            {
                _LoadWhenStart = value;
            }
        }

        /// <summary>
        /// ��������
        /// </summary>
        public object Tag
        {
            get
            {
                return _Tag;
            }
            set
            {
                _Tag = value;
            }
        }
        

      
        
    }
}
