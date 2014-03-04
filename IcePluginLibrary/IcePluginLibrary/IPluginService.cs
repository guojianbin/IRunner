using System;
namespace IcePluginLibrary
{
    public interface IPluginService
    {
        IPlugin AddPlugin(string pluginPath);
        void RemovePlugin(string pluginKeyName);
        Boolean Contains(string pluginKeyName);
        Boolean EnablePlugin(string pluginKeyName);
        int LoadAllPlugin(string pluginsDirectory);
        Boolean UnEnablePlugin(string pluginKeyName);
        IPlugin[] GetPluginsByName(string pluginName);
        IPlugin GetOnePluginByFullName(string pluginPath);
        IPlugin GetOnePluginByKeyName(string keyName);
        void EnableAllPlugin();
        void UnEnableAllPlugin();
    }
}
