namespace IRunner
{
    partial class IRunnerMain
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.ListViewGroup listViewGroup1 = new System.Windows.Forms.ListViewGroup("快捷程序", System.Windows.Forms.HorizontalAlignment.Left);
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(IRunnerMain));
            this.txtCmdResult = new System.Windows.Forms.TextBox();
            this.tabMain = new System.Windows.Forms.TabControl();
            this.tpStartMenu = new System.Windows.Forms.TabPage();
            this.lvStartMenu = new System.Windows.Forms.ListView();
            this.ctmsExePath = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.tsmiOpenExePath = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiDelExePath = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiCreateShortCut = new System.Windows.Forms.ToolStripMenuItem();
            this.imglMenu = new System.Windows.Forms.ImageList(this.components);
            this.tpUtilSofeware = new System.Windows.Forms.TabPage();
            this.lvUtilSofeware = new System.Windows.Forms.ListView();
            this.ctmsUtilSofeware = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.tsmiOpenUtilPath = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiCreateShortCutOnUtil = new System.Windows.Forms.ToolStripMenuItem();
            this.tpCommand = new System.Windows.Forms.TabPage();
            this.tpHelp = new System.Windows.Forms.TabPage();
            this.txtHelp = new System.Windows.Forms.TextBox();
            this.tsMenu = new System.Windows.Forms.ToolStrip();
            this.tsddbPluginMenu = new System.Windows.Forms.ToolStripDropDownButton();
            this.tsmiPluginManage = new System.Windows.Forms.ToolStripMenuItem();
            this.tssPluginMenuSplit = new System.Windows.Forms.ToolStripSeparator();
            this.tsddbFastLink = new System.Windows.Forms.ToolStripDropDownButton();
            this.tsmiAddFastLink = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.tsddbMenuView = new System.Windows.Forms.ToolStripDropDownButton();
            this.tsmiViewLargeIcon = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiViewTile = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiViewList = new System.Windows.Forms.ToolStripMenuItem();
            this.tsbAutoCleanUpDesktop = new System.Windows.Forms.ToolStripButton();
            this.tsbShowDesktop = new System.Windows.Forms.ToolStripButton();
            this.tsbSetting = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.tsbClose = new System.Windows.Forms.ToolStripButton();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.tsslState = new System.Windows.Forms.ToolStripStatusLabel();
            this.tspbOperation = new System.Windows.Forms.ToolStripProgressBar();
            this.About = new System.Windows.Forms.ToolStripStatusLabel();
            this.bgwkCleanupDesktop = new System.ComponentModel.BackgroundWorker();
            this.noticIRunner = new System.Windows.Forms.NotifyIcon(this.components);
            this.ctmsNotic = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.tsmiSetTopMost = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiShow = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.tsmiCloseIRunner = new System.Windows.Forms.ToolStripMenuItem();
            this.tabMain.SuspendLayout();
            this.tpStartMenu.SuspendLayout();
            this.ctmsExePath.SuspendLayout();
            this.tpUtilSofeware.SuspendLayout();
            this.ctmsUtilSofeware.SuspendLayout();
            this.tpCommand.SuspendLayout();
            this.tpHelp.SuspendLayout();
            this.tsMenu.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.ctmsNotic.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtCmdResult
            // 
            this.txtCmdResult.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCmdResult.Location = new System.Drawing.Point(3, 3);
            this.txtCmdResult.Multiline = true;
            this.txtCmdResult.Name = "txtCmdResult";
            this.txtCmdResult.ReadOnly = true;
            this.txtCmdResult.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtCmdResult.Size = new System.Drawing.Size(780, 533);
            this.txtCmdResult.TabIndex = 2;
            // 
            // tabMain
            // 
            this.tabMain.Controls.Add(this.tpStartMenu);
            this.tabMain.Controls.Add(this.tpUtilSofeware);
            this.tabMain.Controls.Add(this.tpCommand);
            this.tabMain.Controls.Add(this.tpHelp);
            this.tabMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabMain.Location = new System.Drawing.Point(0, 27);
            this.tabMain.Name = "tabMain";
            this.tabMain.SelectedIndex = 0;
            this.tabMain.Size = new System.Drawing.Size(794, 565);
            this.tabMain.TabIndex = 4;
            this.tabMain.SelectedIndexChanged += new System.EventHandler(this.tabMain_SelectedIndexChanged);
            // 
            // tpStartMenu
            // 
            this.tpStartMenu.Controls.Add(this.lvStartMenu);
            this.tpStartMenu.Location = new System.Drawing.Point(4, 22);
            this.tpStartMenu.Name = "tpStartMenu";
            this.tpStartMenu.Size = new System.Drawing.Size(786, 539);
            this.tpStartMenu.TabIndex = 3;
            this.tpStartMenu.Text = "菜单";
            this.tpStartMenu.UseVisualStyleBackColor = true;
            // 
            // lvStartMenu
            // 
            this.lvStartMenu.AllowDrop = true;
            this.lvStartMenu.ContextMenuStrip = this.ctmsExePath;
            this.lvStartMenu.Dock = System.Windows.Forms.DockStyle.Fill;
            listViewGroup1.Header = "快捷程序";
            listViewGroup1.Name = "lvgFastShortCut";
            listViewGroup1.Tag = "lvgFastShortCut";
            this.lvStartMenu.Groups.AddRange(new System.Windows.Forms.ListViewGroup[] {
            listViewGroup1});
            this.lvStartMenu.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.None;
            this.lvStartMenu.LargeImageList = this.imglMenu;
            this.lvStartMenu.Location = new System.Drawing.Point(0, 0);
            this.lvStartMenu.Name = "lvStartMenu";
            this.lvStartMenu.Size = new System.Drawing.Size(786, 539);
            this.lvStartMenu.TabIndex = 0;
            this.lvStartMenu.UseCompatibleStateImageBehavior = false;
            this.lvStartMenu.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.lvStartMenu_MouseDoubleClick);
            this.lvStartMenu.DragDrop += new System.Windows.Forms.DragEventHandler(this.lvStartMenu_DragDrop);
            this.lvStartMenu.MouseDown += new System.Windows.Forms.MouseEventHandler(this.lvStartMenu_MouseDown);
            this.lvStartMenu.DragEnter += new System.Windows.Forms.DragEventHandler(this.lvStartMenu_DragEnter);
            this.lvStartMenu.ItemDrag += new System.Windows.Forms.ItemDragEventHandler(this.lvStartMenu_ItemDrag);
            // 
            // ctmsExePath
            // 
            this.ctmsExePath.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiOpenExePath,
            this.tsmiDelExePath,
            this.tsmiCreateShortCut});
            this.ctmsExePath.Name = "ctmsExePath";
            this.ctmsExePath.Size = new System.Drawing.Size(149, 70);
            // 
            // tsmiOpenExePath
            // 
            this.tsmiOpenExePath.Name = "tsmiOpenExePath";
            this.tsmiOpenExePath.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.O)));
            this.tsmiOpenExePath.ShowShortcutKeys = false;
            this.tsmiOpenExePath.Size = new System.Drawing.Size(148, 22);
            this.tsmiOpenExePath.Text = "打开目录(&O)";
            this.tsmiOpenExePath.Click += new System.EventHandler(this.tsmiOpenExePath_Click);
            // 
            // tsmiDelExePath
            // 
            this.tsmiDelExePath.Name = "tsmiDelExePath";
            this.tsmiDelExePath.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.D)));
            this.tsmiDelExePath.ShowShortcutKeys = false;
            this.tsmiDelExePath.Size = new System.Drawing.Size(148, 22);
            this.tsmiDelExePath.Text = "删除(&D)";
            this.tsmiDelExePath.Click += new System.EventHandler(this.tsmiDelExePath_Click);
            // 
            // tsmiCreateShortCut
            // 
            this.tsmiCreateShortCut.Name = "tsmiCreateShortCut";
            this.tsmiCreateShortCut.Size = new System.Drawing.Size(148, 22);
            this.tsmiCreateShortCut.Text = "桌面快捷方式";
            this.tsmiCreateShortCut.Click += new System.EventHandler(this.tsmiCreateShortCut_Click);
            // 
            // imglMenu
            // 
            this.imglMenu.ColorDepth = System.Windows.Forms.ColorDepth.Depth32Bit;
            this.imglMenu.ImageSize = new System.Drawing.Size(32, 32);
            this.imglMenu.TransparentColor = System.Drawing.Color.Transparent;
            // 
            // tpUtilSofeware
            // 
            this.tpUtilSofeware.Controls.Add(this.lvUtilSofeware);
            this.tpUtilSofeware.Location = new System.Drawing.Point(4, 22);
            this.tpUtilSofeware.Name = "tpUtilSofeware";
            this.tpUtilSofeware.Padding = new System.Windows.Forms.Padding(3);
            this.tpUtilSofeware.Size = new System.Drawing.Size(786, 539);
            this.tpUtilSofeware.TabIndex = 0;
            this.tpUtilSofeware.Text = "实用";
            this.tpUtilSofeware.UseVisualStyleBackColor = true;
            // 
            // lvUtilSofeware
            // 
            this.lvUtilSofeware.ContextMenuStrip = this.ctmsUtilSofeware;
            this.lvUtilSofeware.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvUtilSofeware.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.None;
            this.lvUtilSofeware.Location = new System.Drawing.Point(3, 3);
            this.lvUtilSofeware.Name = "lvUtilSofeware";
            this.lvUtilSofeware.Size = new System.Drawing.Size(780, 533);
            this.lvUtilSofeware.TabIndex = 1;
            this.lvUtilSofeware.UseCompatibleStateImageBehavior = false;
            this.lvUtilSofeware.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.lvUtilSofeware_MouseDoubleClick);
            // 
            // ctmsUtilSofeware
            // 
            this.ctmsUtilSofeware.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiOpenUtilPath,
            this.tsmiCreateShortCutOnUtil});
            this.ctmsUtilSofeware.Name = "ctmsExePath";
            this.ctmsUtilSofeware.Size = new System.Drawing.Size(149, 48);
            // 
            // tsmiOpenUtilPath
            // 
            this.tsmiOpenUtilPath.Name = "tsmiOpenUtilPath";
            this.tsmiOpenUtilPath.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.O)));
            this.tsmiOpenUtilPath.ShowShortcutKeys = false;
            this.tsmiOpenUtilPath.Size = new System.Drawing.Size(148, 22);
            this.tsmiOpenUtilPath.Text = "打开目录(&O)";
            this.tsmiOpenUtilPath.Click += new System.EventHandler(this.tsmiOpenUtilPath_Click);
            // 
            // tsmiCreateShortCutOnUtil
            // 
            this.tsmiCreateShortCutOnUtil.Name = "tsmiCreateShortCutOnUtil";
            this.tsmiCreateShortCutOnUtil.Size = new System.Drawing.Size(148, 22);
            this.tsmiCreateShortCutOnUtil.Text = "桌面快捷方式";
            this.tsmiCreateShortCutOnUtil.Click += new System.EventHandler(this.tsmiCreateShortCutOnUtil_Click);
            // 
            // tpCommand
            // 
            this.tpCommand.Controls.Add(this.txtCmdResult);
            this.tpCommand.Location = new System.Drawing.Point(4, 22);
            this.tpCommand.Name = "tpCommand";
            this.tpCommand.Padding = new System.Windows.Forms.Padding(3);
            this.tpCommand.Size = new System.Drawing.Size(786, 539);
            this.tpCommand.TabIndex = 1;
            this.tpCommand.Text = "命令行(Cmd)";
            this.tpCommand.UseVisualStyleBackColor = true;
            // 
            // tpHelp
            // 
            this.tpHelp.Controls.Add(this.txtHelp);
            this.tpHelp.Location = new System.Drawing.Point(4, 22);
            this.tpHelp.Name = "tpHelp";
            this.tpHelp.Size = new System.Drawing.Size(786, 539);
            this.tpHelp.TabIndex = 2;
            this.tpHelp.Text = "帮助(Help)";
            this.tpHelp.UseVisualStyleBackColor = true;
            // 
            // txtHelp
            // 
            this.txtHelp.BackColor = System.Drawing.Color.Gainsboro;
            this.txtHelp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtHelp.Location = new System.Drawing.Point(0, 0);
            this.txtHelp.Multiline = true;
            this.txtHelp.Name = "txtHelp";
            this.txtHelp.ReadOnly = true;
            this.txtHelp.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtHelp.Size = new System.Drawing.Size(786, 539);
            this.txtHelp.TabIndex = 0;
            this.txtHelp.Text = resources.GetString("txtHelp.Text");
            // 
            // tsMenu
            // 
            this.tsMenu.BackColor = System.Drawing.Color.White;
            this.tsMenu.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.tsMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsddbPluginMenu,
            this.tsddbFastLink,
            this.tsddbMenuView,
            this.tsbAutoCleanUpDesktop,
            this.tsbShowDesktop,
            this.tsbSetting,
            this.toolStripSeparator1,
            this.tsbClose});
            this.tsMenu.Location = new System.Drawing.Point(0, 0);
            this.tsMenu.Name = "tsMenu";
            this.tsMenu.Size = new System.Drawing.Size(794, 27);
            this.tsMenu.TabIndex = 5;
            // 
            // tsddbPluginMenu
            // 
            this.tsddbPluginMenu.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiPluginManage,
            this.tssPluginMenuSplit});
            this.tsddbPluginMenu.Image = global::IRunner.Properties.Resources.PluginMenu;
            this.tsddbPluginMenu.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsddbPluginMenu.Name = "tsddbPluginMenu";
            this.tsddbPluginMenu.Size = new System.Drawing.Size(89, 24);
            this.tsddbPluginMenu.Text = "插件工具";
            // 
            // tsmiPluginManage
            // 
            this.tsmiPluginManage.Name = "tsmiPluginManage";
            this.tsmiPluginManage.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.P)));
            this.tsmiPluginManage.ShowShortcutKeys = false;
            this.tsmiPluginManage.Size = new System.Drawing.Size(152, 22);
            this.tsmiPluginManage.Text = "插件管理(&P)";
            this.tsmiPluginManage.Click += new System.EventHandler(this.tsmiPluginManage_Click);
            // 
            // tssPluginMenuSplit
            // 
            this.tssPluginMenuSplit.Name = "tssPluginMenuSplit";
            this.tssPluginMenuSplit.Size = new System.Drawing.Size(149, 6);
            // 
            // tsddbFastLink
            // 
            this.tsddbFastLink.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiAddFastLink,
            this.toolStripSeparator3});
            this.tsddbFastLink.Image = global::IRunner.Properties.Resources.FastLinkMenu;
            this.tsddbFastLink.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsddbFastLink.Name = "tsddbFastLink";
            this.tsddbFastLink.Size = new System.Drawing.Size(89, 24);
            this.tsddbFastLink.Text = "快速链接";
            // 
            // tsmiAddFastLink
            // 
            this.tsmiAddFastLink.Name = "tsmiAddFastLink";
            this.tsmiAddFastLink.Size = new System.Drawing.Size(140, 22);
            this.tsmiAddFastLink.Text = "增加链接(&A)";
            this.tsmiAddFastLink.Click += new System.EventHandler(this.tsmiAddFastLink_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(137, 6);
            // 
            // tsddbMenuView
            // 
            this.tsddbMenuView.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiViewLargeIcon,
            this.tsmiViewTile,
            this.tsmiViewList});
            this.tsddbMenuView.Image = global::IRunner.Properties.Resources.ViewToMenu;
            this.tsddbMenuView.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsddbMenuView.Name = "tsddbMenuView";
            this.tsddbMenuView.Size = new System.Drawing.Size(89, 24);
            this.tsddbMenuView.Text = "菜单视图";
            // 
            // tsmiViewLargeIcon
            // 
            this.tsmiViewLargeIcon.Checked = true;
            this.tsmiViewLargeIcon.CheckOnClick = true;
            this.tsmiViewLargeIcon.CheckState = System.Windows.Forms.CheckState.Checked;
            this.tsmiViewLargeIcon.Name = "tsmiViewLargeIcon";
            this.tsmiViewLargeIcon.Size = new System.Drawing.Size(100, 22);
            this.tsmiViewLargeIcon.Text = "图标";
            // 
            // tsmiViewTile
            // 
            this.tsmiViewTile.CheckOnClick = true;
            this.tsmiViewTile.Name = "tsmiViewTile";
            this.tsmiViewTile.Size = new System.Drawing.Size(100, 22);
            this.tsmiViewTile.Text = "平铺";
            // 
            // tsmiViewList
            // 
            this.tsmiViewList.CheckOnClick = true;
            this.tsmiViewList.Name = "tsmiViewList";
            this.tsmiViewList.Size = new System.Drawing.Size(100, 22);
            this.tsmiViewList.Text = "列表";
            // 
            // tsbAutoCleanUpDesktop
            // 
            this.tsbAutoCleanUpDesktop.Image = global::IRunner.Properties.Resources.AutoCleanUpDesktop;
            this.tsbAutoCleanUpDesktop.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAutoCleanUpDesktop.Name = "tsbAutoCleanUpDesktop";
            this.tsbAutoCleanUpDesktop.Size = new System.Drawing.Size(80, 24);
            this.tsbAutoCleanUpDesktop.Text = "整理桌面";
            this.tsbAutoCleanUpDesktop.Click += new System.EventHandler(this.tsbAutoCleanUpDesktop_Click);
            // 
            // tsbShowDesktop
            // 
            this.tsbShowDesktop.Image = global::IRunner.Properties.Resources.BackToDesktop;
            this.tsbShowDesktop.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbShowDesktop.Name = "tsbShowDesktop";
            this.tsbShowDesktop.Size = new System.Drawing.Size(97, 24);
            this.tsbShowDesktop.Text = "显示桌面(&D)";
            this.tsbShowDesktop.Click += new System.EventHandler(this.tsbShowDesktop_Click);
            // 
            // tsbSetting
            // 
            this.tsbSetting.Image = global::IRunner.Properties.Resources.gif_46_006;
            this.tsbSetting.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbSetting.Name = "tsbSetting";
            this.tsbSetting.Size = new System.Drawing.Size(56, 24);
            this.tsbSetting.Text = "设置";
            this.tsbSetting.Click += new System.EventHandler(this.tsbSetting_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 27);
            // 
            // tsbClose
            // 
            this.tsbClose.Image = global::IRunner.Properties.Resources.gif_46_088;
            this.tsbClose.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbClose.Name = "tsbClose";
            this.tsbClose.Size = new System.Drawing.Size(56, 24);
            this.tsbClose.Text = "关闭";
            this.tsbClose.Click += new System.EventHandler(this.tsbClose_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.AutoSize = false;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsslState,
            this.tspbOperation,
            this.About});
            this.statusStrip1.Location = new System.Drawing.Point(0, 570);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(794, 22);
            this.statusStrip1.TabIndex = 6;
            // 
            // tsslState
            // 
            this.tsslState.Name = "tsslState";
            this.tsslState.Size = new System.Drawing.Size(0, 17);
            // 
            // tspbOperation
            // 
            this.tspbOperation.Name = "tspbOperation";
            this.tspbOperation.Size = new System.Drawing.Size(200, 16);
            this.tspbOperation.Step = 1;
            // 
            // About
            // 
            this.About.Enabled = false;
            this.About.Margin = new System.Windows.Forms.Padding(10, 3, 0, 2);
            this.About.Name = "About";
            this.About.Size = new System.Drawing.Size(567, 17);
            this.About.Spring = true;
            this.About.Text = "ice.Kwok";
            this.About.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // bgwkCleanupDesktop
            // 
            this.bgwkCleanupDesktop.WorkerReportsProgress = true;
            this.bgwkCleanupDesktop.DoWork += new System.ComponentModel.DoWorkEventHandler(this.bgwkCleanupDesktop_DoWork);
            this.bgwkCleanupDesktop.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.bgwkCleanupDesktop_RunWorkerCompleted);
            this.bgwkCleanupDesktop.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.bgwkCleanupDesktop_ProgressChanged);
            // 
            // noticIRunner
            // 
            this.noticIRunner.ContextMenuStrip = this.ctmsNotic;
            this.noticIRunner.Icon = ((System.Drawing.Icon)(resources.GetObject("noticIRunner.Icon")));
            this.noticIRunner.Text = "IRunner";
            this.noticIRunner.Visible = true;
            this.noticIRunner.MouseClick += new System.Windows.Forms.MouseEventHandler(this.noticIRunner_MouseClick);
            this.noticIRunner.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.noticIRunner_MouseDoubleClick);
            // 
            // ctmsNotic
            // 
            this.ctmsNotic.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiSetTopMost,
            this.tsmiShow,
            this.toolStripSeparator2,
            this.tsmiCloseIRunner});
            this.ctmsNotic.Name = "ctmsNotic";
            this.ctmsNotic.Size = new System.Drawing.Size(125, 76);
            // 
            // tsmiSetTopMost
            // 
            this.tsmiSetTopMost.CheckOnClick = true;
            this.tsmiSetTopMost.Name = "tsmiSetTopMost";
            this.tsmiSetTopMost.Size = new System.Drawing.Size(124, 22);
            this.tsmiSetTopMost.Text = "置顶显示";
            this.tsmiSetTopMost.CheckedChanged += new System.EventHandler(this.tsmiStartWithSystemOn_CheckedChanged);
            // 
            // tsmiShow
            // 
            this.tsmiShow.Name = "tsmiShow";
            this.tsmiShow.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
            this.tsmiShow.ShowShortcutKeys = false;
            this.tsmiShow.Size = new System.Drawing.Size(124, 22);
            this.tsmiShow.Text = "打开(&O)";
            this.tsmiShow.Click += new System.EventHandler(this.tsmiShow_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(121, 6);
            // 
            // tsmiCloseIRunner
            // 
            this.tsmiCloseIRunner.Name = "tsmiCloseIRunner";
            this.tsmiCloseIRunner.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.X)));
            this.tsmiCloseIRunner.ShowShortcutKeys = false;
            this.tsmiCloseIRunner.Size = new System.Drawing.Size(124, 22);
            this.tsmiCloseIRunner.Text = "退出(&X)";
            this.tsmiCloseIRunner.Click += new System.EventHandler(this.tsmiCloseIRunner_Click);
            // 
            // IRunnerMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(794, 592);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.tabMain);
            this.Controls.Add(this.tsMenu);
            this.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.Name = "IRunnerMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "IRunner.爱运行";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.IRunnerMain_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.IRunnerMain_FormClosing);
            this.Resize += new System.EventHandler(this.IRunnerMain_Resize);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.IRunnerMain_KeyDown);
            this.tabMain.ResumeLayout(false);
            this.tpStartMenu.ResumeLayout(false);
            this.ctmsExePath.ResumeLayout(false);
            this.tpUtilSofeware.ResumeLayout(false);
            this.ctmsUtilSofeware.ResumeLayout(false);
            this.tpCommand.ResumeLayout(false);
            this.tpCommand.PerformLayout();
            this.tpHelp.ResumeLayout(false);
            this.tpHelp.PerformLayout();
            this.tsMenu.ResumeLayout(false);
            this.tsMenu.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ctmsNotic.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtCmdResult;
        private System.Windows.Forms.TabControl tabMain;
        private System.Windows.Forms.TabPage tpUtilSofeware;
        private System.Windows.Forms.TabPage tpCommand;
        private System.Windows.Forms.TabPage tpHelp;
        public System.Windows.Forms.TextBox txtHelp;
        private System.Windows.Forms.ImageList imglMenu;
        private System.Windows.Forms.ToolStrip tsMenu;
        private System.Windows.Forms.ToolStripButton tsbSetting;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton tsbClose;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel tsslState;
        private System.Windows.Forms.ToolStripStatusLabel About;
        private System.ComponentModel.BackgroundWorker bgwkCleanupDesktop;
        private System.Windows.Forms.ToolStripProgressBar tspbOperation;

        private System.Windows.Forms.NotifyIcon noticIRunner;
        private System.Windows.Forms.ContextMenuStrip ctmsNotic;
        private System.Windows.Forms.ToolStripMenuItem tsmiShow;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripMenuItem tsmiCloseIRunner;
        private System.Windows.Forms.TabPage tpStartMenu;
        private System.Windows.Forms.ListView lvStartMenu;
        private System.Windows.Forms.ToolStripButton tsbShowDesktop;
        private System.Windows.Forms.ContextMenuStrip ctmsExePath;
        private System.Windows.Forms.ToolStripMenuItem tsmiOpenExePath;
        private System.Windows.Forms.ToolStripMenuItem tsmiDelExePath;
        private System.Windows.Forms.ToolStripMenuItem tsmiCreateShortCut;
        private System.Windows.Forms.ToolStripButton tsbAutoCleanUpDesktop;
        private System.Windows.Forms.ToolStripMenuItem tsmiSetTopMost;
        private System.Windows.Forms.ToolStripDropDownButton tsddbMenuView;
        private System.Windows.Forms.ToolStripMenuItem tsmiViewLargeIcon;
        private System.Windows.Forms.ToolStripMenuItem tsmiViewTile;
        private System.Windows.Forms.ToolStripMenuItem tsmiViewList;
        private System.Windows.Forms.ToolStripDropDownButton tsddbFastLink;
        private System.Windows.Forms.ToolStripMenuItem tsmiAddFastLink;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        public System.Windows.Forms.ToolStripDropDownButton tsddbPluginMenu;
        private System.Windows.Forms.ToolStripMenuItem tsmiPluginManage;
        private System.Windows.Forms.ToolStripSeparator tssPluginMenuSplit;
        private System.Windows.Forms.ListView lvUtilSofeware;
        private System.Windows.Forms.ContextMenuStrip ctmsUtilSofeware;
        private System.Windows.Forms.ToolStripMenuItem tsmiOpenUtilPath;
        private System.Windows.Forms.ToolStripMenuItem tsmiCreateShortCutOnUtil;
    }
}

