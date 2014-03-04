using System;
namespace IcePluginLibrary
{
    public interface IMenuService
    {
        void AddMenuItem(string menuItemName, object menuItem);
        object GetMenuItem(string menuItemName);
        void RemoveMenuItem(string menuItemName);
    }
}
