using System;
using System.Collections.Generic;
using System.Text;

namespace IcePluginLibrary
{
    public interface IPlugin
    {
        /// <summary>
        /// �����Ϣ
        /// </summary>
        PluginAttribute PluginInfo
        { get; }
        /// <summary>
        /// �Ƿ�����
        /// </summary>
        bool Enable
        {
            get;
            set;
        }
        /// <summary>
        /// �Ӳ˵�
        /// </summary>
        Dictionary<string, EventHandler> ChildNodes
        {
            get;
        }
        /// <summary>
        /// ���в��
        /// </summary>
        void Run();

        /// <summary>
        /// ����·��
        /// </summary>
        string FullName
        {
            get;
            set;
        }

        /// <summary>
        /// ����
        /// </summary>
        int Index
        {
            get;
            set;
        }
        
    }
}
