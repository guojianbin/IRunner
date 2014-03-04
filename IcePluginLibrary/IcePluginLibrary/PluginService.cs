using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
namespace IcePluginLibrary
{
    public class PluginService : IPluginService
    {
        private Dictionary<string, IPlugin> plugins = new Dictionary<string, IPlugin>();
        private const string PluginClassFullName = "IcePluginLibrary.IPlugin";

        public Dictionary<string, IPlugin> Plugins
        {
            get { return plugins; }
        }

        public PluginService()
        {

        }

        public PluginService(Dictionary<string, IPlugin> InitPlugins)
        {
            plugins = InitPlugins;
        }

        #region IPluginService Members

        public IPlugin AddPlugin(string pluginPath)
        {
            return InitOnePluginByPath(pluginPath);
        }

        public void RemovePlugin(string pluginKeyName)
        {
            plugins.Remove(pluginKeyName);
        }

        private bool IsValidPlugin(Type t)
        {
            bool ret = false;
            Type[] interfaces = t.GetInterfaces();
            foreach (Type theInterface in interfaces)
            {
                if (theInterface.FullName == PluginClassFullName)
                {
                    ret = true;
                    break;
                }
            }
            return ret;
        }

        public IPlugin InitOnePluginByPath(string pluginPath)
        {
            string ext = System.IO.Path.GetExtension(pluginPath); // file.Substring(file.LastIndexOf("."));

            if (ext.ToLower() != ".dll") return null;

            int i = plugins.Count;
            Assembly tmp = Assembly.LoadFile(pluginPath);
            Type[] types = tmp.GetTypes();
            foreach (Type t in types)
            {
                if (IsValidPlugin(t))
                {
                    IPlugin plugin = (IPlugin)tmp.CreateInstance(t.FullName);
                    if (!Contains(plugin.PluginInfo.GUID))
                    {
                        plugins.Add(plugin.PluginInfo.GUID, plugin);
                        PluginAttribute attribute = plugin.PluginInfo;
                        if (plugin.PluginInfo != null)
                        {
                            plugin.Index = i + 1;
                            plugin.FullName = pluginPath;
                        }
                        else
                        {
                            throw new Exception("The Current Plugin(" + t.FullName + ") Properties Can Not Be Null!");
                        }
                    }
                    return plugin;
                }
            }
            return null;
        }

        public int LoadAllPlugin(string pluginsDirectory)
        {
            string[] files = System.IO.Directory.GetFiles(pluginsDirectory);
            PluginAttribute typeAttribute = new PluginAttribute();
            int result = 0;
            foreach (string file in files)
            {
                try
                {
                    if (AddPlugin(file) != null)
                    {
                        result++;
                    }
                }
                catch (Exception err)
                {
                    throw err;
                }
            }
            return result;

        }

        public bool Contains(string pluginKeyName)
        {
            return plugins.ContainsKey(pluginKeyName);
        }

        public bool EnablePlugin(string pluginKeyName)
        {
            if (Contains(pluginKeyName))
            {
                plugins[pluginKeyName].Enable = true;
                return true;
            }
            return false;
        }

        public bool UnEnablePlugin(string pluginKeyName)
        {
            if (Contains(pluginKeyName))
            {
                plugins[pluginKeyName].Enable = false;
                return true;
            }
            return false;
        }

        public void EnableAllPlugin()
        {
            foreach (KeyValuePair<string, IPlugin> kv in plugins)
            {
                kv.Value.Enable = true;
            }
        }

        public void UnEnableAllPlugin()
        {
            foreach (KeyValuePair<string, IPlugin> kv in plugins)
            {
                kv.Value.Enable = false;
            }
        }

        public IPlugin[] GetPluginsByName(string pluginName)
        {
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            foreach (KeyValuePair<string, IPlugin> kv in plugins)
            {
                if (kv.Value.PluginInfo.Name == pluginName)
                {
                    al.Add(kv.Value);
                }
            }
            return (IPlugin[])al.ToArray(typeof(IPlugin));
        }

        public IPlugin GetOnePluginByKeyName(string keyName)
        {
            return plugins[keyName];
        }

        public IPlugin GetOnePluginByFullName(string pluginPath)
        {
            foreach (KeyValuePair<string, IPlugin> kv in plugins)
            {
                if (kv.Value.FullName == pluginPath)
                {
                    return kv.Value;
                }
            }
            return null;
        }

        #endregion
    }
}
