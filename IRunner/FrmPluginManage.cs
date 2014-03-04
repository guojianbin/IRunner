using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using IcePluginLibrary;
namespace IRunner
{
    public partial class FrmPluginManage : Form
    {
        public FrmPluginManage()
        {
            InitializeComponent();
            foreach (KeyValuePair<string, IPlugin> kv in PubData.AllPlugins)
            {
                AddPluginToView(kv.Value);
            }

        }

        private void AddPluginToView(IPlugin plugin)
        {
            if (plugin != null)
            {
                ListViewItem lvi = new ListViewItem();
                if (plugin.Enable == true)
                {
                    lvi.Checked = true;
                }
                else
                {
                    lvi.Checked = false;
                }
                lvi.ToolTipText = plugin.FullName;
                lvi.Tag = plugin.PluginInfo.GUID;
                lvi.SubItems.Add(plugin.PluginInfo.Name);
                lvi.SubItems.Add(plugin.FullName);
                lvPlugin.Items.Add(lvi);
            }

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            PluginService service = new PluginService(PubData.AllPlugins);
            MenuService menuService = new MenuService(PubData.AllPluginMenus);
            string keyName = string.Empty;
            IRunnerMain mainForm = this.Owner as IRunnerMain;
            if (mainForm == null)
            {
                throw new Exception("The Owner Form:IRunnerMain Can Not Be Null!");
            }
            ToolStripMenuItem menuItem = null;
            foreach (ListViewItem item in lvPlugin.Items)
            {
                keyName = item.Tag.ToString();
                if (!item.Checked)
                {
                    service.UnEnablePlugin(keyName);
                    menuItem = (ToolStripMenuItem)menuService.GetMenuItem(keyName);
                    if (mainForm.tsddbPluginMenu.DropDownItems.Contains(menuItem))
                    {
                        mainForm.tsddbPluginMenu.DropDownItems.Remove(menuItem);
                    }
                   
                }
                else
                {
                    service.EnablePlugin(keyName);
                    menuItem = (ToolStripMenuItem)menuService.GetMenuItem(keyName);
                    if (!mainForm.tsddbPluginMenu.DropDownItems.Contains(menuItem))
                    {
                        mainForm.tsddbPluginMenu.DropDownItems.Add(menuItem);
                    }
                    
                }
            }
            
            this.Close();
        }

        private void lvPlugin_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {
            if (lvPlugin.SelectedItems.Count > 0 && lvPlugin.SelectedItems[0] != null)
            {
                string keyName = lvPlugin.SelectedItems[0].Tag.ToString();
                PluginService service = new PluginService(PubData.AllPlugins);
                MenuService menuService = new MenuService(PubData.AllPluginMenus);
                IPlugin plugin = service.Plugins[keyName];
                if (plugin != null)
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder(5000);
                    sb.Append(@"作者：" + plugin.PluginInfo.Developer+ System.Environment.NewLine);
                    sb.Append(@"来源：" + plugin.PluginInfo.Webpage + System.Environment.NewLine);
                    sb.Append(@"版本：" + plugin.PluginInfo.Version + System.Environment.NewLine);
                    sb.Append(@"描述：" + plugin.PluginInfo.Description + System.Environment.NewLine);
                    txtAbout.Text = sb.ToString();
 
                }
            }
        }

        private void btnAddPlugin_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "(Ice Plugin)|*.dll";
            openFileDialog.FilterIndex = 1;
            IRunnerMain mainForm = this.Owner as IRunnerMain;
            if (mainForm == null)
            {
                throw new Exception("The Owner Form:IRunnerMain Can Not Be Null!");
            }
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string fName = openFileDialog.FileName;
                PluginService service = new PluginService(PubData.AllPlugins);
                MenuService menuService = new MenuService(PubData.AllPluginMenus);

                IPlugin plugin = service.AddPlugin(fName);
                if (plugin != null)
                {
                    plugin.Enable = true;
                    IRunnerMain.AddPluginToMenu(mainForm.tsddbPluginMenu, plugin, menuService);
                    AddPluginToView(plugin);
                    string dest = PubData.GV_IcePluginsPath + plugin.FullName.Substring(plugin.FullName.LastIndexOf("\\"));
                    MoveFolderTo(plugin.FullName, dest);
                }
            }
            openFileDialog.Dispose();
            openFileDialog = null;
        }

        /// <summary>
        /// 从一个目录将其内容移动到另一目录
        /// </summary>
        /// <param name="source">源</param>
        /// <param name="dest">目标</param>
        private void MoveFolderTo(string source, string dest)
        {
            System.IO.File.Copy(source, dest, true); //复制文件,为true是覆盖同名文件
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnRemove_Click(object sender, EventArgs e)
        {
            if (lvPlugin.SelectedItems.Count > 0 && lvPlugin.SelectedItems[0] != null)
            {
                IRunnerMain mainForm = this.Owner as IRunnerMain;
                if (mainForm == null)
                {
                    throw new Exception("The Owner Form:IRunnerMain Can Not Be Null!");
                }

                if (MessageBox.Show("确定移除指定插件吗？","提示",MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    string keyName = lvPlugin.SelectedItems[0].Tag.ToString();
                    PluginService service = new PluginService(PubData.AllPlugins);
                    MenuService menuService = new MenuService(PubData.AllPluginMenus);
                    service.RemovePlugin(keyName);
                    ToolStripMenuItem menuItem = (ToolStripMenuItem)menuService.GetMenuItem(keyName);
                    mainForm.tsddbPluginMenu.DropDownItems.Remove(menuItem);
                    menuService.RemoveMenuItem(keyName);


                  //  System.IO.File.Delete(lvPlugin.SelectedItems[0].ToolTipText);

                    lvPlugin.Items.Remove(lvPlugin.SelectedItems[0]);

                    
                }

                
            }
        }

    }
}