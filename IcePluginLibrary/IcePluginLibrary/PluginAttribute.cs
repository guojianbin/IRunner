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
        /// 唯一标示符
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
        /// 组件名称
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
        /// 版本号
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
        /// 开发者
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
        /// 网页地址
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
        /// 描述信息
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
        /// 是否启动时加载
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
        /// 附加数据
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
