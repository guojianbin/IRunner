using System;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;
using System.Xml;
using System.Collections;
using System.Runtime.InteropServices;
using IcePluginLibrary;
using System.Security.Permissions;
using System.Security.Policy;
using System.Security;
namespace IRunner
{
    public partial class IRunnerMain : Form
    {
        Process p; //进程
        StreamWriter swInput; //输入数据流

        private TextSearchBox objSearchBox = null;
        private FrmRunCmd objFrmRunCmd = null;
        private FrmSearchOnline objFrmSearchOnline = null;
        private bool hasLoadUtils = false;


        private string argOnWindowsStarup = null;
        private Point mouseDownOnListview = Point.Empty;
        System.Collections.Hashtable htListGroups = new System.Collections.Hashtable();

        public IRunnerMain(string[] args)
        {
            
            InitializeComponent();
            objSearchBox = new TextSearchBox();
            objSearchBox.Owner = this;	//设置SearchForm对象的Owner为Form1
            objSearchBox.Hide();			//隐藏SearchForm窗体


            objFrmRunCmd = new FrmRunCmd();
            objFrmRunCmd.Owner = this;
            objFrmRunCmd.RunCmdTextEvent += new FrmRunCmd.RunCmdTextDelegate(RunCmdText);
            objFrmRunCmd.Hide();

            objFrmSearchOnline = new FrmSearchOnline();
            objFrmSearchOnline.Owner = this;
            objFrmSearchOnline.Hide();

            RefreshUserExeFile();
            SetAutoSwitchView();
            RefreshFastLinkMenu();
            LoadPlugins();

            if (args.Length > 1)
            {
                //MessageBox.Show("调用右键菜单" + args[0] + "=" + args[1]);
                if (args[1] == "AddToFastLink")
                {
                    AddOneToFastLink(args[0]);
                }
                else if (args[1] == "AddToDesktopMenu")
                {
                    string dest = PubData.GV_IceUtilSofewarePath + args[0].Substring(args[0].LastIndexOf("\\"));
                    MoveFolderTo(args[0], dest);
                }
                 
            }
            else if (args.Length > 0)
            {
                //获取启动时的命令行参数  
                argOnWindowsStarup = args[0];
            }


        }

        private void RunCmdText(string cmdText)
        {
            tabMain.SelectedTab = tpCommand;
            swInput.WriteLine(cmdText);//直接写入流即可
        }



        void p_OutputDataReceived(object sender, DataReceivedEventArgs e)
        {
            HandleResult(e.Data + Environment.NewLine);
        }
        /// <summary>
        /// 异步读取错误消息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void p_ErrorDataReceived(object sender, DataReceivedEventArgs e)
        {
            HandleResult(e.Data + Environment.NewLine);
        }

        delegate void HandleResultDelegate(string msg);
        void HandleResult(string msg)
        {
            if (this.InvokeRequired)
                Invoke(new HandleResultDelegate(HandleResult), new object[] { msg });
            else
            {
                txtCmdResult.AppendText(msg);
                this.txtCmdResult.SelectionStart = this.txtCmdResult.TextLength;
                this.txtCmdResult.ScrollToCaret();//滚动到光标处
            }
        }

        private void IRunnerMain_Load(object sender, EventArgs e)
        {

            if (argOnWindowsStarup != null)
            {
                //arg不为空,说明有启动参数,是从注册表启动的,则直接最小化到托盘  
                this.Visible = false;
                this.ShowInTaskbar = false;
            }

            string sShortcut = GetFromConfig("ShowShortCut", string.Empty);
            PubData.GV_ShowShortCut = sShortcut;
            if (sShortcut.Length > 0)
            {
                HotKeyHelper.RegShortcutToHandle(this.Handle, PubData.GV_ShowShortCut, 101);
            }
            sShortcut = GetFromConfig("HideShortCut", string.Empty);
            PubData.GV_HideShortCut = sShortcut;
            if (sShortcut.Length > 0)
            {
                HotKeyHelper.RegShortcutToHandle(this.Handle, PubData.GV_HideShortCut, 100);
            }
            sShortcut = GetFromConfig("RunCMDShortCut", string.Empty);
            PubData.GV_RunCMDShortCut = sShortcut;
            if (sShortcut.Length > 0)
            {
                HotKeyHelper.RegShortcutToHandle(this.Handle, PubData.GV_RunCMDShortCut, 102);
            }
            sShortcut = GetFromConfig("SearchOnlineShortCut", string.Empty);
            PubData.GV_SearchOnlineShortCut = sShortcut;
            if (sShortcut.Length > 0)
            {
                HotKeyHelper.RegShortcutToHandle(this.Handle, PubData.GV_SearchOnlineShortCut, 103);
            }
            sShortcut = GetFromConfig("DesktopShortCut", string.Empty);
            PubData.GV_DesktopShortCut = sShortcut;
            if (sShortcut.Length > 0)
            {
                HotKeyHelper.RegShortcutToHandle(this.Handle, PubData.GV_DesktopShortCut, 104);
            }
            sShortcut = GetFromConfig("CaptureScreenShortCut", string.Empty);
            PubData.GV_CaptureScreenShortCut = sShortcut;
            if (sShortcut.Length > 0)
            {
                HotKeyHelper.RegShortcutToHandle(this.Handle, PubData.GV_CaptureScreenShortCut, 105);
            }

            PubData.GV_RunOnWindowsStartup = Convert.ToBoolean(GetFromConfig("RunOnWindowsStartup", string.Empty));
            PubData.GV_ShowOnTopMost = Convert.ToBoolean(GetFromConfig("ShowOnTopMost", string.Empty));
            PubData.GV_MinInput = Convert.ToInt32(GetFromConfig("MinInput", string.Empty));
            PubData.GV_ShowMaxRow = Convert.ToInt32(GetFromConfig("ShowMaxRow", string.Empty));
            PubData.GV_SearchPath = GetFromConfig("SearchPath", "|");
            PubData.GV_FilterString = GetFromConfig("FilterString", string.Empty);
            PubData.GV_DefaultBrowser = GetFromConfig("DefaultBrowser", string.Empty);
            PubData.GV_AutoDelWhenFileNotExists = Convert.ToBoolean(GetFromConfig("AutoDelWhenFileNotExists", string.Empty));
            PubData.GV_CreateShowcutWithDel = Convert.ToBoolean(GetFromConfig("CreateShowcutWithDel", string.Empty));
        }

        /// <summary>
        /// 执行对于快捷键操作
        /// </summary>
        /// <param name="m"></param>
        protected override void WndProc(ref Message m)
        {
            const int WM_HOTKEY = 0x0312;//生成该消息的热键ID
            //按快捷键   
            switch (m.Msg)
            {
                case WM_HOTKEY:
                    switch (m.WParam.ToInt32())
                    {
                        case 100:
                            this.Hide();
                            break;
                        case 101:
                            this.Show();
                            if (this.WindowState == FormWindowState.Minimized)
                            {
                                this.WindowState = FormWindowState.Maximized;
                            }
                            break;
                        case 102:
                            objFrmRunCmd.Show();
                            objFrmRunCmd.Activate();
                            break;
                        case 103:
                            if (objFrmSearchOnline.Visible == false)
                            {
                                objFrmSearchOnline.Show();
                                objFrmSearchOnline.Activate();
                            }
                            else
                            {
                                objFrmSearchOnline.Hide();
                                this.Activate();
                            }

                            break;
                        case 104:
                            if (this.WindowState == FormWindowState.Minimized)
                            {
                                this.Show();
                                this.WindowState = FormWindowState.Maximized;
                            }
                            else
                                tsbShowDesktop.PerformClick();
                            break;
                        case 105:
                            string exePath = PubData.GV_IceUtilSofewarePath + "\\SNAPSHOT.EXE";
                            if (System.IO.File.Exists(exePath) || System.IO.Directory.Exists(exePath))
                            {
                                Process.Start(exePath);
                            }
                            break;


                    }
                    break;
            }
            base.WndProc(ref m);
        }

        private string GetFromConfig(string key, string cSplit)
        {
            const string sql = "SELECT VALUE FROM t_Ice_Config WHERE Name = '{0}' ";
            DataTable dt = SQLiteHelper.ExecuteDataset(string.Format(sql, key), null).Tables[0];
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    if (cSplit.Length == 0)
                    {
                        return dt.Rows[0]["Value"].ToString().Trim();
                    }
                    else
                    {
                        StringBuilder sbTmp = new StringBuilder();
                        foreach (DataRow row in dt.Rows)
                        {
                            sbTmp.Append(row["Value"].ToString() + cSplit);
                        }
                        return sbTmp.ToString().TrimEnd(cSplit.ToCharArray()[0]);
                    }

                }

            }
            return "";
        }

        private void tabMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabMain.SelectedTab == tpCommand)
            {
                if (p != null)
                {
                    p.Close();
                    p = null;
                }
                p = new Process();
                p.StartInfo.FileName = "cmd.exe";
                p.StartInfo.UseShellExecute = false;//自定义shell
                p.StartInfo.CreateNoWindow = true;//避免显示原始窗口
                p.StartInfo.RedirectStandardInput = true;//重定向标准输入（原来是ON）
                p.StartInfo.RedirectStandardOutput = true;//重定向标准输出
                p.StartInfo.RedirectStandardError = true;
                p.ErrorDataReceived += new DataReceivedEventHandler(p_ErrorDataReceived);
                p.OutputDataReceived += new DataReceivedEventHandler(p_OutputDataReceived);
                p.Start();
                swInput = p.StandardInput;//重定向输入
                p.BeginOutputReadLine();//开始监控输出（异步读取）
                p.BeginErrorReadLine();

                //txtSearch.Focus();
            }
            else
            {
                if (tabMain.SelectedTab == tpUtilSofeware)
                {
                    if (hasLoadUtils == false)
                    {
                        LoadUtilSofewares();
                    }

                }

                if (swInput != null)
                {
                    swInput.Close();
                    swInput = null;
                }
                if (p != null && !p.HasExited)
                {
                    Processor.FindAndKillProcess(p.Id);
                }
            }
        }

        private void btnShowSearchBox_Click(object sender, EventArgs e)
        {
            objSearchBox.Show();		//显示SearchForm窗体
            objSearchBox.Activate();	//激活SearchForm窗体，给予焦点
        }


        private void IRunnerMain_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F && e.Control)
            {
                objSearchBox.Show();		//显示SearchForm窗体
                objSearchBox.Activate();	//激活SearchForm窗体，给予焦点
            }
            else if (e.Control && e.KeyCode == Keys.R)
            {
                objFrmRunCmd.Show();
                objFrmRunCmd.Activate();
            }
            else if (e.KeyCode == Keys.Tab && e.Control)
            {
                if (tabMain.SelectedIndex == tabMain.TabCount - 1)
                {
                    tabMain.SelectedIndex = 0;
                }
                else
                {
                    tabMain.SelectedIndex = tabMain.SelectedIndex + 1;
                }

            }
        }

        private void tsbClose_Click(object sender, EventArgs e)
        {
            ExitAndDispose();

        }

        private void dgvShowResult_SelectionChanged(object sender, EventArgs e)
        {

        }

        private void tsbSetting_Click(object sender, EventArgs e)
        {
            FrmSetting obfrmSet = new FrmSetting();
            obfrmSet.TopMost = true;
            obfrmSet.ShowDialog();
        }






        private void IRunnerMain_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
            {
                this.Hide();
            }
        }

        private void noticIRunner_MouseClick(object sender, MouseEventArgs e)
        {
            switch (e.Button)
            {
                case MouseButtons.Left:
                    noticIRunner.ContextMenuStrip = ctmsNotic;
                    Type t = typeof(NotifyIcon);
                    System.Reflection.MethodInfo mi = t.GetMethod("ShowContextMenu", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
                    mi.Invoke(this.noticIRunner, null);
                    noticIRunner.ContextMenuStrip = ctmsNotic;
                    break;
                case MouseButtons.Right:
                    noticIRunner.ContextMenuStrip = ctmsNotic;
                    break;
                case MouseButtons.Middle:
                    if (this.WindowState == FormWindowState.Minimized)
                    {
                        this.WindowState = FormWindowState.Normal;
                    }
                    break;
                case MouseButtons.None:
                default:
                    break;
            }

        }

        private void noticIRunner_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (this.Visible == false)
            {
                ShowForm();
            }
            else
            {
                this.Visible = false;
            }

        }

        private void ShowForm()
        {
            this.Visible = true;
            this.WindowState = FormWindowState.Maximized;
            this.Activate();
        }

        private void tsmiCloseIRunner_Click(object sender, EventArgs e)
        {
            ExitAndDispose();
        }

        private void ExitAndDispose()
        {
            if (swInput != null)
            {
                swInput.Close();
                swInput = null;
            }
            if (p != null && !p.HasExited)
            {
                Processor.FindAndKillProcess(p.Id);
            }
            //foreach (Form form in this.OwnedForms) { if (!form.IsDisposed) { form.Dispose(); } }
            Processor.FindAndKillProcess(System.Diagnostics.Process.GetCurrentProcess().Id);//System.Threading.Thread.CurrentThread.ManagedThreadId
            //FormCollection m_formList = Application.OpenForms;
            //foreach (Form form in m_formList)
            //{
            //    if (!form.IsDisposed) { form.Dispose(); }
            //}
            Application.Exit();
        }

        private void tsmiShow_Click(object sender, EventArgs e)
        {
            ShowForm();
        }

        private void lvStartMenu_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            ListViewItem item = lvStartMenu.GetItemAt(e.X, e.Y);
            if (item != null && item.Tag != null)
            {
                RunApplication(item);
            }

        }

        /// <summary>
        /// 运行程序
        /// </summary>
        /// <param name="sItemName"></param>
        /// <param name="sToolType"></param>
        private void RunApplication(ListViewItem item)
        {

            string exePath = item.Tag.ToString();
            if (System.IO.File.Exists(exePath) || System.IO.Directory.Exists(exePath))
            {
                Process.Start(exePath);
            }

        }

        private void lvStartMenu_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
                e.Effect = DragDropEffects.Link;
            else e.Effect = DragDropEffects.None;
        }

        private void lvStartMenu_DragDrop(object sender, DragEventArgs e)
        {
            //SQLiteHelper.CreateExePathTable();
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
            {

                String[] files = (String[])e.Data.GetData(DataFormats.FileDrop);
                System.Collections.ArrayList al = new System.Collections.ArrayList();

                AddToView(files, al);
                SQLiteHelper.ExecuteSqlTran(al);
            }
        }


        private void AddToView(string[] files, System.Collections.ArrayList al)
        {
            FileInfo fi = null;
            string ParentPath = string.Empty;
            string ExePath = string.Empty;
            Icon icon = null;
            int index = imglMenu.Images.Count;
            ListViewItem item = null;
            int j = 0;
            string groupKeyName = string.Empty;
            foreach (String srcFileName in files)
            {

                fi = new FileInfo(srcFileName);
                if (fi.Extension.ToLower() == ".lnk")
                {
                    ParentPath = ShortCutHelper.GetParentPathOfShortcut(srcFileName);
                    if (PubData.GV_CreateShowcutWithDel == true)
                    {
                        System.IO.File.Delete(srcFileName);
                    }
                }
                else
                {
                    ParentPath = srcFileName;
                }
                //if (ExistExePath(ParentPath) == false)
                //{
                SaveExePathToDB(al, ParentPath);

                ExePath = ParentPath;
                fi = new FileInfo(ExePath);
                groupKeyName = fi.Extension;
                if (!htListGroups.Contains(groupKeyName))
                {
                    ListViewGroup group = new ListViewGroup();
                    group.Header = groupKeyName;
                    group.Name = groupKeyName;
                    lvStartMenu.Groups.Add(group);
                    htListGroups.Add(groupKeyName, group);
                }

                icon = FileIcon.ExtractAssociatedIcon(ExePath);

                imglMenu.Images.Add(icon);
                imglMenu.Images.SetKeyName(index + j, fi.Name);


                item = new ListViewItem();

                item.Text = fi.Name;
                item.Group = (ListViewGroup)htListGroups[groupKeyName];
                item.Tag = fi.FullName;
                item.ImageIndex = index + j;
                lvStartMenu.Items.Add(item);
                j++;
                //}

            }
        }

        private void SaveExePathToDB(System.Collections.ArrayList al, string exePath)
        {
            string sql = "INSERT INTO t_Ice_ExePath(ExePath) values('{0}')";
            string path = ConvertHelper.GetSafeSqlString(exePath, true);
            al.Add(string.Format(sql, path));
        }

        private bool ExistExePath(string exePath)
        {
            string sqlExist = "SELECT 1 FROM t_Ice_ExePath WHERE ExePath = '{0}'";
            string path = ConvertHelper.GetSafeSqlString(exePath, true);
            DataSet ds = SQLiteHelper.ExecuteDataset(string.Format(sqlExist, path), null);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string value = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                    int count = Convert.ToInt32(value);
                    if (count == 1)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        private void RefreshUserExeFile()
        {
            const string sql = "SELECT DISTINCT ExePath from t_Ice_ExePath";
            DataSet ds = SQLiteHelper.ExecuteDataset(sql, null);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Image[] imgls = new Image[ds.Tables[0].Rows.Count];
                    int j = 0;
                    Icon icon;
                    string ExePath = string.Empty;
                    ListViewItem[] items = new ListViewItem[ds.Tables[0].Rows.Count];
                    string[] imglsKeys = new string[ds.Tables[0].Rows.Count];
                    ListViewItem item = null;
                    FileInfo fi = null;
                    int index = imglMenu.Images.Count;

                    string groupKeyName = string.Empty;
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        ExePath = row["ExePath"].ToString();
                        fi = new FileInfo(ExePath);
                        groupKeyName = fi.Extension;
                        if (!htListGroups.Contains(groupKeyName))
                        {
                            ListViewGroup group = new ListViewGroup();
                            group.Header = groupKeyName;
                            group.Name = groupKeyName;
                            lvStartMenu.Groups.Add(group);
                            htListGroups.Add(groupKeyName, group);
                        }
                        if (fi.Exists == true)
                        {
                            icon = FileIcon.ExtractAssociatedIcon(ExePath);

                            imglMenu.Images.Add(icon);
                            imglMenu.Images.SetKeyName(index + j, fi.Name);
                            //imgls[j] = icon.ToBitmap();
                            //imgls[j].Tag = fi.Name + ".ico";
                            //imglsKeys[j] = fi.Name+".ico";

                            item = new ListViewItem();

                            item.Text = fi.Name;
                            item.Group = (ListViewGroup)htListGroups[groupKeyName];
                            item.Tag = fi.FullName;
                            item.ImageKey = fi.Name;
                            items[j] = item;
                            lvStartMenu.Items.Add(item);
                            j++;
                        }
                        else
                        {
                            if (PubData.GV_AutoDelWhenFileNotExists == true)
                            {
                                DelExePath(ExePath);
                            }
                            else
                            {
                                if (MessageBox.Show("不存在指定文件路径[" + ExePath + "]，是否删除？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Error) == DialogResult.Yes)
                                {
                                    DelExePath(ExePath);
                                }
                            }

                        }

                    }

                }
            }
        }



        private void tsbShowDesktop_Click(object sender, EventArgs e)
        {
            Type shellType = Type.GetTypeFromProgID("Shell.Application");
            object shellObject = System.Activator.CreateInstance(shellType);
            shellType.InvokeMember("ToggleDesktop", System.Reflection.BindingFlags.InvokeMethod, null, shellObject, null);
        }

        private void lvStartMenu_ItemDrag(object sender, ItemDragEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                if (lvStartMenu.SelectedItems.Count <= 0)
                {
                    return;
                }

                //put selected files into a string array

                string[] files = new String[lvStartMenu.SelectedItems.Count];

                int i = 0;
                foreach (ListViewItem item in lvStartMenu.SelectedItems)
                {
                    files[i++] = item.Tag.ToString();
                }

                //create a dataobject holding this array as a filedrop

                DataObject data = new DataObject(DataFormats.FileDrop, files);

                //also add the selection as textdata

                data.SetData(DataFormats.StringFormat, files[0]);

                //Do DragDrop
                DoDragDrop(data, DragDropEffects.Copy);
            }
        }

        private void lvStartMenu_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                mouseDownOnListview = lvStartMenu.PointToClient(Control.MousePosition);   //菜单在当前鼠标位置显示        
            }
        }

        private void tsmiOpenExePath_Click(object sender, EventArgs e)
        {
            if (mouseDownOnListview != Point.Empty)
            {
                ListViewHitTestInfo info = lvStartMenu.HitTest(mouseDownOnListview.X, mouseDownOnListview.Y);
                if (info.Item != null && info.Item.Group != null)
                {
                    string exePath = info.Item.Tag.ToString();
                    DirFile.OpenAndSelectFile(exePath);
                }

            }
        }

        private void tsmiDelExePath_Click(object sender, EventArgs e)
        {

            if (lvStartMenu.SelectedItems.Count > 0)
            {
                if (MessageBox.Show("是否删除快捷项？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    string exePath = string.Empty;
                    foreach (ListViewItem item in lvStartMenu.SelectedItems)
                    {

                        exePath = item.Tag.ToString();

                        lvStartMenu.Items.Remove(item);
                        DelExePath(exePath);
                    }
                }
            }
        }

        private int DelExePath(string exePath)
        {
            const string sql = "DELETE FROM t_Ice_ExePath WHERE ExePath = '{0}'";
            string path = ConvertHelper.GetSafeSqlString(exePath, true);
            return SQLiteHelper.ExecuteNonQuery(string.Format(sql, path), null);
        }

        private void tsmiCreateShortCut_Click(object sender, EventArgs e)
        {
            if (mouseDownOnListview != Point.Empty)
            {
                ListViewHitTestInfo info = lvStartMenu.HitTest(mouseDownOnListview.X, mouseDownOnListview.Y);
                if (info.Item != null && info.Item.Group != null)
                {
                    string sFilename = info.Item.Tag.ToString();
                    string sFile = DirFile.GetFileNameNoExtension(sFilename);
                    string sShortcutPath = ShortCutHelper.GetDeskDir() + "\\" + sFile + ".lnk";
                    if (!System.IO.File.Exists(sShortcutPath))
                    {
                        string sWorkPath = DirFile.GetLastDirectory(sFilename);
                        //创建快捷键
                        ShortCutHelper.CreateShortcut(sShortcutPath, sFilename, sWorkPath, "Make In IRunner", "");

                    }

                }

            }
        }

        private void tsbAutoCleanUpDesktop_Click(object sender, EventArgs e)
        {
            tsslState.Text = "正在整理桌面文件......";

            bgwkCleanupDesktop.RunWorkerAsync();


        }

        /// <summary>
        /// 从一个目录将其内容移动到另一目录
        /// </summary>
        /// <param name="source">源</param>
        /// <param name="dest">目标</param>
        public void MoveFolderTo(string source, string dest)
        {
            File.Copy(source, dest, true); //复制文件,为true是覆盖同名文件
        }

        private void tsmiStartWithSystemOn_CheckedChanged(object sender, EventArgs e)
        {
            this.TopMost = tsmiSetTopMost.Checked;
        }

        private void IRunnerMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
                this.Visible = false;
            }
        }

        private void SetAutoSwitchView()
        {
            tsmiViewLargeIcon.Click += tsmiViewToMenu_Click;
            tsmiViewList.Click += tsmiViewToMenu_Click;
            tsmiViewTile.Click += tsmiViewToMenu_Click;
        }

        private void tsmiViewToMenu_Click(object sender, EventArgs e)
        {
            ToolStripMenuItem mItem = sender as ToolStripMenuItem;
            if (mItem == tsmiViewLargeIcon)
            {
                mItem.Checked = true;
                tsmiViewList.Checked = false;
                tsmiViewTile.Checked = false;
                lvStartMenu.View = View.LargeIcon;
                lvUtilSofeware.View = View.LargeIcon;
            }
            else if (mItem == tsmiViewList)
            {
                mItem.Checked = true;
                tsmiViewLargeIcon.Checked = false;
                tsmiViewTile.Checked = false;
                lvStartMenu.View = View.List;
                lvUtilSofeware.View = View.List;
            }
            else if (mItem == tsmiViewTile)
            {
                mItem.Checked = true;
                tsmiViewLargeIcon.Checked = false;
                tsmiViewList.Checked = false;
                lvStartMenu.View = View.Tile;
                lvUtilSofeware.View = View.Tile;
            }
        }

        private void tsmiAddFastLink_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog folderBrowserDialog = new FolderBrowserDialog();
            folderBrowserDialog.Description = "选择链接目标...";
            if (folderBrowserDialog.ShowDialog(this) == DialogResult.OK)
            {
                string linkPath = folderBrowserDialog.SelectedPath;
                AddOneToFastLink(linkPath);
            }
        }

        public void AddOneToFastLink(string linkPath)
        {
            AddToFastLink(tsddbFastLink, linkPath);
            string sql = "INSERT INTO t_Ice_FastLink(FastLinkPath) values('{0}')";
            sql = string.Format(sql, ConvertHelper.GetSafeSqlString(linkPath, true));
            SQLiteHelper.ExecuteNonQuery(sql, null);
        }

        private void AddToFastLink(ToolStripDropDownButton tsddbFastLink, string linkPath)
        {
            ToolStripMenuItem item = new ToolStripMenuItem();
            item.Text = linkPath.Substring(linkPath.LastIndexOf("\\")).Replace("\\", "");
            item.Tag = linkPath;
            item.Click += tsmiFastLink_Click;
            item.MouseDown += tsmiFastLink_MouseDown;
            tsddbFastLink.DropDownItems.Add(item);
        }

        private void tsmiFastLink_Click(object sender, EventArgs e)
        {
            ToolStripMenuItem mItem = sender as ToolStripMenuItem;
            if (mItem != null)
            {
                string linkPath = mItem.Tag.ToString();
                if (System.IO.Directory.Exists(linkPath))
                {
                    System.Diagnostics.Process.Start(linkPath);
                }
            }
        }

        private void tsmiFastLink_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                ToolStripMenuItem mItem = sender as ToolStripMenuItem;
                if (mItem != null)
                {
                    if (MessageBox.Show("是否删除当前快速链接[" + mItem.Text + "]？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        String linkPath = mItem.Tag.ToString();
                        string sql = "DELETE FROM t_Ice_FastLink WHERE FastLinkPath = '{0}'";
                        sql = string.Format(sql, ConvertHelper.GetSafeSqlString(linkPath, true));
                        SQLiteHelper.ExecuteNonQuery(sql, null);

                        tsddbFastLink.DropDownItems.Remove(mItem);
                    }
                }

            }
        }

        private void RefreshFastLinkMenu()
        {
            const string sql = "SELECT DISTINCT FastLinkPath from t_Ice_FastLink";
            DataSet ds = SQLiteHelper.ExecuteDataset(sql, null);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        AddToFastLink(tsddbFastLink, row["FastLinkPath"].ToString());
                    }

                }
            }
        }


        private void LoadPlugins()
        {
            if (System.IO.Directory.Exists(PubData.GV_IcePluginsPath))
            {
                PluginService services = new PluginService();
                MenuService menuService = new MenuService();
                services.LoadAllPlugin(PubData.GV_IcePluginsPath);

                PubData.AllPlugins = services.Plugins;
                IPlugin plugin = null;
                foreach (System.Collections.Generic.KeyValuePair<string, IPlugin> kvPlugin in services.Plugins)
                {
                    plugin = kvPlugin.Value;
                    AddPluginToMenu(tsddbPluginMenu, plugin, menuService);

                }

                PubData.AllPluginMenus = menuService.MenuItems;
            }
            else
            {
                System.IO.Directory.CreateDirectory(PubData.GV_IcePluginsPath);
            }
        }
        /// <summary>
        /// 添加插件到菜单项
        /// </summary>
        /// <param name="tsbParent"></param>
        /// <param name="plugin"></param>
        /// <param name="menuService"></param>
        public static void AddPluginToMenu(ToolStripDropDownButton tsbParent, IPlugin plugin, MenuService menuService)
        {
            if (plugin != null)
            {
                ToolStripMenuItem mi = new ToolStripMenuItem();
                ToolStripMenuItem miChild = null;
                mi.Text = plugin.PluginInfo.Name;
                mi.Tag = plugin.PluginInfo.GUID;
                mi.Click += RunPlugin;

                if (plugin.ChildNodes.Count > 0)
                {
                    foreach (System.Collections.Generic.KeyValuePair<string, EventHandler> menuItem in plugin.ChildNodes)
                    {
                        if (menuItem.Key == "%Split%")
                        {
                            ToolStripSeparator miSplit = new ToolStripSeparator();
                            mi.DropDownItems.Add(miSplit);
                        }
                        else
                        {
                            miChild = new ToolStripMenuItem();
                            miChild.Text = menuItem.Key;
                            miChild.Click += menuItem.Value;
                            mi.DropDownItems.Add(miChild);
                        }
                    }
                }

                tsbParent.DropDownItems.Add(mi);
                menuService.AddMenuItem(plugin.PluginInfo.GUID, mi);
            }
        }

        public static void RunPlugin(object sender, EventArgs e)
        {
            ToolStripMenuItem temp = (ToolStripMenuItem)sender;
            PubData.AllPlugins[temp.Tag.ToString()].Run();

        }

        private void tsmiPluginManage_Click(object sender, EventArgs e)
        {
            FrmPluginManage obFrmPluginManage = new FrmPluginManage();
            obFrmPluginManage.Owner = this;
            obFrmPluginManage.ShowDialog();
        }

        private void LoadUtilSofewares()
        {
            lvUtilSofeware.Items.Clear();
            if (System.IO.Directory.Exists(PubData.GV_IceUtilSofewarePath))
            {
                FileInfo[] files = FileDirSearcher.GetAllFilePath(PubData.GV_IceUtilSofewarePath);
                Icon icon = null;
                ListViewItem item = null;
                ImageList imglUtils = new ImageList();

                int index = imglUtils.Images.Count;
                int i = imglUtils.Images.Count;
                foreach (FileInfo fi in files)
                {
                    icon = FileIcon.ExtractAssociatedIcon(fi.FullName);
                    imglUtils.Images.Add(icon);
                    imglUtils.Images.SetKeyName(index, fi.Name);
                    item = new ListViewItem();
                    item.Text = fi.Name;
                    item.Tag = fi.FullName;
                    lvUtilSofeware.Items.Add(item);
                    index++;
                }

                imglUtils.ColorDepth = ColorDepth.Depth32Bit;
                imglUtils.ImageSize = new Size(32, 32);
                lvUtilSofeware.LargeImageList = imglUtils;
                foreach (FileInfo fi in files)
                {
                    lvUtilSofeware.Items[i].ImageIndex = i;
                    i++;
                }
                hasLoadUtils = true;

            }
            else
            {
                System.IO.Directory.CreateDirectory(PubData.GV_IceUtilSofewarePath);
            }
        }

        private void tsmiOpenUtilPath_Click(object sender, EventArgs e)
        {
            if (lvUtilSofeware.SelectedItems.Count > 0)
            {
                string exePath = lvUtilSofeware.SelectedItems[0].Tag.ToString();
                DirFile.OpenAndSelectFile(exePath);
            }
        }

        private void tsmiCreateShortCutOnUtil_Click(object sender, EventArgs e)
        {
            if (lvUtilSofeware.SelectedItems.Count > 0)
            {
                string exePath = lvUtilSofeware.SelectedItems[0].Tag.ToString();
                string sFilename = exePath;
                string sFile = DirFile.GetFileNameNoExtension(sFilename);
                string sShortcutPath = ShortCutHelper.GetDeskDir() + "\\" + sFile + ".lnk";
                if (!System.IO.File.Exists(sShortcutPath))
                {
                    string sWorkPath = DirFile.GetLastDirectory(sFilename);
                    //创建快捷键
                    ShortCutHelper.CreateShortcut(sShortcutPath, sFilename, sWorkPath, "Make In IRunner", "");

                }
            }

        }

        private void lvUtilSofeware_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            ListViewHitTestInfo info = lvUtilSofeware.HitTest(e.X, e.Y);
            if (info.Item != null && info.Item.Tag != null)
            {
                RunApplication(info.Item);
            }
        }
        FileInfo[] fis = null;
        ArrayList arrDestFiles;

        public delegate void DelegateUpdateOperateState();
        private void bgwkCleanupDesktop_DoWork(object sender, System.ComponentModel.DoWorkEventArgs e)
        {

            if (!System.IO.Directory.Exists(PubData.GV_ShortCutSavePath))
            {
                System.IO.Directory.CreateDirectory(PubData.GV_ShortCutSavePath);
            }
            string desktopPath = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
            fis = FileDirSearcher.GetAllFilePath(desktopPath);
            UpdateOperateState();
            string dest = string.Empty;
            arrDestFiles = new ArrayList();
            foreach (FileInfo fi in fis)
            {
                dest = PubData.GV_ShortCutSavePath + fi.FullName.Substring(fi.FullName.LastIndexOf("\\"));
                MoveFolderTo(fi.FullName, dest);

                System.IO.File.Delete(fi.FullName);
                arrDestFiles.Add(dest);
            }

        }

        private void bgwkCleanupDesktop_ProgressChanged(object sender, System.ComponentModel.ProgressChangedEventArgs e)
        {
            tspbOperation.Value = e.ProgressPercentage;
            MessageBox.Show(" tspbOperation.Value=" + tspbOperation.Value, "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void UpdateOperateState()
        {
            if (this.InvokeRequired)
            {
                this.BeginInvoke(new DelegateUpdateOperateState(UpdateOperateState));
            }
            else
            {
                tspbOperation.Maximum = fis.Length;
                tsslState.Text = "搜索文件完成，开始整理......";
            }
        }

        private void bgwkCleanupDesktop_RunWorkerCompleted(object sender, System.ComponentModel.RunWorkerCompletedEventArgs e)
        {
            if (e.Error != null)
            {
                MessageBox.Show(e.Error.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (e.Cancelled)
            {
                MessageBox.Show("取消操作！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            else
            {
                System.Collections.ArrayList alSQL = new System.Collections.ArrayList();
                AddToView((string[])arrDestFiles.ToArray(typeof(string)), alSQL);

                SQLiteHelper.ExecuteSqlTran(alSQL);
                tsslState.Text = "已经完成桌面文件整理.";
                MessageBox.Show("已经完成桌面整理。", "提示", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                fis = null;
                arrDestFiles = null;
                alSQL = null;
                GC.Collect(0);
            }

            tspbOperation.Value = 0;
        }

        //private void toolStripButton1_Click(object sender, EventArgs e)
        //{
        //    SystemMenuHelper menu = new SystemMenuHelper();
        //    menu.DelDirectoryContextMenuItem("IRunner");
        //    menu.DelFileContextMenuItem("IRunner");
        //    menu.AddDirectoryContextMenuItem("IRunner", Application.ExecutablePath + " \"%1\" \"AddToFastLink\"", "添加快速链接至IRunner");
        //    menu.AddFileContextMenuItem("IRunner", Application.ExecutablePath + " \"%1\" \"AddToDesktopMenu\"", "添加程序至IRunner");

        //    MessageBox.Show("成功注册");
        //}



    }
}