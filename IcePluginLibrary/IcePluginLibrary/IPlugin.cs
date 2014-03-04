using System;
using System.Collections.Generic;
using System.Text;

namespace IcePluginLibrary
{
    public interface IPlugin
    {
        /// <summary>
        /// 插件信息
        /// </summary>
        PluginAttribute PluginInfo
        { get; }
        /// <summary>
        /// 是否启用
        /// </summary>
        bool Enable
        {
            get;
            set;
        }
        /// <summary>
        /// 子菜单
        /// </summary>
        Dictionary<string, EventHandler> ChildNodes
        {
            get;
        }
        /// <summary>
        /// 运行插件
        /// </summary>
        void Run();

        /// <summary>
        /// 所在路径
        /// </summary>
        string FullName
        {
            get;
            set;
        }

        /// <summary>
        /// 索引
        /// </summary>
        int Index
        {
            get;
            set;
        }
        
    }
}
