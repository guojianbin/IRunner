using System;
using System.Collections.Generic;
using System.Text;
namespace IcePluginLibrary
{
    public class MenuService : IMenuService
    {
        private Dictionary<String, object> menuItems = new Dictionary<string, object>();

        public MenuService()
        {
            
        }

        public MenuService(Dictionary<String, object> InitMenuItems)
        {
            menuItems = InitMenuItems;
        }

        public Dictionary<String, object> MenuItems
        {
            get { return menuItems; }
        }
        #region IMenuService Members

        public void AddMenuItem(string menuItemName, object menuItem)
        {
            if (menuItems.ContainsKey(menuItemName))
            {
                throw new Exception("The menu KeyName(" + menuItemName + ") has existed!");
            }
            else
            {
                menuItems[menuItemName] = menuItem;
            }
        }

        public object GetMenuItem(string menuItemName)
        {
            object result = null;
            if (menuItems.ContainsKey(menuItemName))
            {
                result = menuItems[menuItemName];
            }
            return result;
        }

        public void RemoveMenuItem(string menuItemName)
        {
            if (menuItems.ContainsKey(menuItemName))
            {
                menuItems.Remove(menuItemName);
            }
        }

        #endregion
    }
}
