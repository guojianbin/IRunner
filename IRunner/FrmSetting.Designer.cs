namespace IRunner
{
    partial class FrmSetting
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmSetting));
            this.btnSaveSetting = new System.Windows.Forms.Button();
            this.tbcSetting = new System.Windows.Forms.TabControl();
            this.tbSystemConfig = new System.Windows.Forms.TabPage();
            this.txtDefaultBrowser = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cbAutoDelWhenFileNotExists = new System.Windows.Forms.CheckBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cbCreateShowcutWithDel = new System.Windows.Forms.CheckBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbShowOnTopMost = new System.Windows.Forms.CheckBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cbAutoRunWithWindowsOn = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.tpSerachBoxConfig = new System.Windows.Forms.TabPage();
            this.txtMinShowTip = new System.Windows.Forms.TextBox();
            this.lblMinShowTip = new System.Windows.Forms.Label();
            this.txtSearchIndexPath = new System.Windows.Forms.TextBox();
            this.lblSearchIndexPath = new System.Windows.Forms.Label();
            this.txtShowMaxRow = new System.Windows.Forms.TextBox();
            this.lblShowMaxRow = new System.Windows.Forms.Label();
            this.txtFilterExt = new System.Windows.Forms.TextBox();
            this.lblFilterExt = new System.Windows.Forms.Label();
            this.btnCloseSetting = new System.Windows.Forms.Button();
            this.tpShortcut = new System.Windows.Forms.TabPage();
            this.txtHideShortCut = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtShowShortCut = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtSearchOnlineShortCut = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtDesktopShortCut = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtCaptureScreenShortCut = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txtRunCMDShortCut = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.tbcSetting.SuspendLayout();
            this.tbSystemConfig.SuspendLayout();
            this.tpSerachBoxConfig.SuspendLayout();
            this.tpShortcut.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnSaveSetting
            // 
            this.btnSaveSetting.Location = new System.Drawing.Point(375, 288);
            this.btnSaveSetting.Name = "btnSaveSetting";
            this.btnSaveSetting.Size = new System.Drawing.Size(75, 23);
            this.btnSaveSetting.TabIndex = 0;
            this.btnSaveSetting.Text = "保存(&S)";
            this.btnSaveSetting.UseVisualStyleBackColor = true;
            this.btnSaveSetting.Click += new System.EventHandler(this.btnSaveSetting_Click);
            // 
            // tbcSetting
            // 
            this.tbcSetting.Controls.Add(this.tbSystemConfig);
            this.tbcSetting.Controls.Add(this.tpSerachBoxConfig);
            this.tbcSetting.Controls.Add(this.tpShortcut);
            this.tbcSetting.Location = new System.Drawing.Point(12, 12);
            this.tbcSetting.Name = "tbcSetting";
            this.tbcSetting.SelectedIndex = 0;
            this.tbcSetting.Size = new System.Drawing.Size(546, 270);
            this.tbcSetting.TabIndex = 3;
            // 
            // tbSystemConfig
            // 
            this.tbSystemConfig.Controls.Add(this.label9);
            this.tbSystemConfig.Controls.Add(this.label8);
            this.tbSystemConfig.Controls.Add(this.txtDefaultBrowser);
            this.tbSystemConfig.Controls.Add(this.label7);
            this.tbSystemConfig.Controls.Add(this.cbAutoDelWhenFileNotExists);
            this.tbSystemConfig.Controls.Add(this.label1);
            this.tbSystemConfig.Controls.Add(this.cbCreateShowcutWithDel);
            this.tbSystemConfig.Controls.Add(this.label2);
            this.tbSystemConfig.Controls.Add(this.cbShowOnTopMost);
            this.tbSystemConfig.Controls.Add(this.label6);
            this.tbSystemConfig.Controls.Add(this.cbAutoRunWithWindowsOn);
            this.tbSystemConfig.Controls.Add(this.label5);
            this.tbSystemConfig.Location = new System.Drawing.Point(4, 22);
            this.tbSystemConfig.Name = "tbSystemConfig";
            this.tbSystemConfig.Padding = new System.Windows.Forms.Padding(3);
            this.tbSystemConfig.Size = new System.Drawing.Size(538, 244);
            this.tbSystemConfig.TabIndex = 0;
            this.tbSystemConfig.Text = "选项";
            this.tbSystemConfig.UseVisualStyleBackColor = true;
            // 
            // txtDefaultBrowser
            // 
            this.txtDefaultBrowser.Location = new System.Drawing.Point(102, 15);
            this.txtDefaultBrowser.Name = "txtDefaultBrowser";
            this.txtDefaultBrowser.Size = new System.Drawing.Size(194, 21);
            this.txtDefaultBrowser.TabIndex = 22;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(21, 18);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(65, 12);
            this.label7.TabIndex = 21;
            this.label7.Text = "默认浏览器";
            // 
            // cbAutoDelWhenFileNotExists
            // 
            this.cbAutoDelWhenFileNotExists.AutoSize = true;
            this.cbAutoDelWhenFileNotExists.Location = new System.Drawing.Point(102, 161);
            this.cbAutoDelWhenFileNotExists.Name = "cbAutoDelWhenFileNotExists";
            this.cbAutoDelWhenFileNotExists.Size = new System.Drawing.Size(48, 16);
            this.cbAutoDelWhenFileNotExists.TabIndex = 20;
            this.cbAutoDelWhenFileNotExists.Text = "启用";
            this.cbAutoDelWhenFileNotExists.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(148, 163);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(185, 12);
            this.label1.TabIndex = 19;
            this.label1.Text = "(若文件不存在自动删除文件路径)";
            // 
            // cbCreateShowcutWithDel
            // 
            this.cbCreateShowcutWithDel.AutoSize = true;
            this.cbCreateShowcutWithDel.Location = new System.Drawing.Point(102, 130);
            this.cbCreateShowcutWithDel.Name = "cbCreateShowcutWithDel";
            this.cbCreateShowcutWithDel.Size = new System.Drawing.Size(48, 16);
            this.cbCreateShowcutWithDel.TabIndex = 18;
            this.cbCreateShowcutWithDel.Text = "启用";
            this.cbCreateShowcutWithDel.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(33, 131);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 17;
            this.label2.Text = "自动删除";
            // 
            // cbShowOnTopMost
            // 
            this.cbShowOnTopMost.AutoSize = true;
            this.cbShowOnTopMost.Location = new System.Drawing.Point(102, 94);
            this.cbShowOnTopMost.Name = "cbShowOnTopMost";
            this.cbShowOnTopMost.Size = new System.Drawing.Size(48, 16);
            this.cbShowOnTopMost.TabIndex = 16;
            this.cbShowOnTopMost.Text = "启用";
            this.cbShowOnTopMost.UseVisualStyleBackColor = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(33, 98);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 12);
            this.label6.TabIndex = 15;
            this.label6.Text = "置顶显示";
            // 
            // cbAutoRunWithWindowsOn
            // 
            this.cbAutoRunWithWindowsOn.AutoSize = true;
            this.cbAutoRunWithWindowsOn.Location = new System.Drawing.Point(102, 60);
            this.cbAutoRunWithWindowsOn.Name = "cbAutoRunWithWindowsOn";
            this.cbAutoRunWithWindowsOn.Size = new System.Drawing.Size(48, 16);
            this.cbAutoRunWithWindowsOn.TabIndex = 14;
            this.cbAutoRunWithWindowsOn.Text = "启用";
            this.cbAutoRunWithWindowsOn.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(33, 60);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 12);
            this.label5.TabIndex = 13;
            this.label5.Text = "开机启动";
            // 
            // tpSerachBoxConfig
            // 
            this.tpSerachBoxConfig.Controls.Add(this.txtMinShowTip);
            this.tpSerachBoxConfig.Controls.Add(this.lblMinShowTip);
            this.tpSerachBoxConfig.Controls.Add(this.txtSearchIndexPath);
            this.tpSerachBoxConfig.Controls.Add(this.lblSearchIndexPath);
            this.tpSerachBoxConfig.Controls.Add(this.txtShowMaxRow);
            this.tpSerachBoxConfig.Controls.Add(this.lblShowMaxRow);
            this.tpSerachBoxConfig.Controls.Add(this.txtFilterExt);
            this.tpSerachBoxConfig.Controls.Add(this.lblFilterExt);
            this.tpSerachBoxConfig.Location = new System.Drawing.Point(4, 22);
            this.tpSerachBoxConfig.Name = "tpSerachBoxConfig";
            this.tpSerachBoxConfig.Padding = new System.Windows.Forms.Padding(3);
            this.tpSerachBoxConfig.Size = new System.Drawing.Size(538, 244);
            this.tpSerachBoxConfig.TabIndex = 1;
            this.tpSerachBoxConfig.Text = "搜索盒";
            this.tpSerachBoxConfig.UseVisualStyleBackColor = true;
            // 
            // txtMinShowTip
            // 
            this.txtMinShowTip.Location = new System.Drawing.Point(90, 213);
            this.txtMinShowTip.Name = "txtMinShowTip";
            this.txtMinShowTip.Size = new System.Drawing.Size(55, 21);
            this.txtMinShowTip.TabIndex = 12;
            this.txtMinShowTip.Text = "50";
            // 
            // lblMinShowTip
            // 
            this.lblMinShowTip.AutoSize = true;
            this.lblMinShowTip.Location = new System.Drawing.Point(7, 213);
            this.lblMinShowTip.Name = "lblMinShowTip";
            this.lblMinShowTip.Size = new System.Drawing.Size(77, 12);
            this.lblMinShowTip.TabIndex = 11;
            this.lblMinShowTip.Text = "输入最小提示";
            // 
            // txtSearchIndexPath
            // 
            this.txtSearchIndexPath.Location = new System.Drawing.Point(90, 113);
            this.txtSearchIndexPath.Multiline = true;
            this.txtSearchIndexPath.Name = "txtSearchIndexPath";
            this.txtSearchIndexPath.Size = new System.Drawing.Size(429, 62);
            this.txtSearchIndexPath.TabIndex = 10;
            this.txtSearchIndexPath.Text = "%System%\r\n%Desktop%";
            // 
            // lblSearchIndexPath
            // 
            this.lblSearchIndexPath.AutoSize = true;
            this.lblSearchIndexPath.Location = new System.Drawing.Point(31, 116);
            this.lblSearchIndexPath.Name = "lblSearchIndexPath";
            this.lblSearchIndexPath.Size = new System.Drawing.Size(53, 12);
            this.lblSearchIndexPath.TabIndex = 9;
            this.lblSearchIndexPath.Text = "搜索路径";
            // 
            // txtShowMaxRow
            // 
            this.txtShowMaxRow.Location = new System.Drawing.Point(90, 181);
            this.txtShowMaxRow.Name = "txtShowMaxRow";
            this.txtShowMaxRow.Size = new System.Drawing.Size(55, 21);
            this.txtShowMaxRow.TabIndex = 8;
            this.txtShowMaxRow.Text = "50";
            // 
            // lblShowMaxRow
            // 
            this.lblShowMaxRow.AutoSize = true;
            this.lblShowMaxRow.Location = new System.Drawing.Point(31, 184);
            this.lblShowMaxRow.Name = "lblShowMaxRow";
            this.lblShowMaxRow.Size = new System.Drawing.Size(53, 12);
            this.lblShowMaxRow.TabIndex = 7;
            this.lblShowMaxRow.Text = "可显示行";
            // 
            // txtFilterExt
            // 
            this.txtFilterExt.Location = new System.Drawing.Point(90, 11);
            this.txtFilterExt.Multiline = true;
            this.txtFilterExt.Name = "txtFilterExt";
            this.txtFilterExt.Size = new System.Drawing.Size(429, 96);
            this.txtFilterExt.TabIndex = 6;
            this.txtFilterExt.Text = ".exe;.lnk;.txt;.rtf;.ini;.htm;.html;.pdf;.rar;.zip;.7z;.gz;.bmp;.gif;.jpg;.jpeg;." +
                "ico;.pic;.png;.tif;.mp3;.wav;.aif;.avi;.mpg;.bat;.cmd;.xls;.xlsx;.doc;.docx;.ppt" +
                ";.pptx;.sql;";
            // 
            // lblFilterExt
            // 
            this.lblFilterExt.AutoSize = true;
            this.lblFilterExt.Location = new System.Drawing.Point(31, 14);
            this.lblFilterExt.Name = "lblFilterExt";
            this.lblFilterExt.Size = new System.Drawing.Size(53, 12);
            this.lblFilterExt.TabIndex = 5;
            this.lblFilterExt.Text = "过滤后缀";
            // 
            // btnCloseSetting
            // 
            this.btnCloseSetting.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCloseSetting.Location = new System.Drawing.Point(479, 288);
            this.btnCloseSetting.Name = "btnCloseSetting";
            this.btnCloseSetting.Size = new System.Drawing.Size(75, 23);
            this.btnCloseSetting.TabIndex = 4;
            this.btnCloseSetting.Text = "取消(&E)";
            this.btnCloseSetting.UseVisualStyleBackColor = true;
            // 
            // tpShortcut
            // 
            this.tpShortcut.Controls.Add(this.txtCaptureScreenShortCut);
            this.tpShortcut.Controls.Add(this.label12);
            this.tpShortcut.Controls.Add(this.txtRunCMDShortCut);
            this.tpShortcut.Controls.Add(this.label13);
            this.tpShortcut.Controls.Add(this.txtSearchOnlineShortCut);
            this.tpShortcut.Controls.Add(this.label10);
            this.tpShortcut.Controls.Add(this.txtDesktopShortCut);
            this.tpShortcut.Controls.Add(this.label11);
            this.tpShortcut.Controls.Add(this.txtHideShortCut);
            this.tpShortcut.Controls.Add(this.label4);
            this.tpShortcut.Controls.Add(this.txtShowShortCut);
            this.tpShortcut.Controls.Add(this.label3);
            this.tpShortcut.Location = new System.Drawing.Point(4, 22);
            this.tpShortcut.Name = "tpShortcut";
            this.tpShortcut.Size = new System.Drawing.Size(538, 244);
            this.tpShortcut.TabIndex = 2;
            this.tpShortcut.Text = "快捷键";
            this.tpShortcut.UseVisualStyleBackColor = true;
            // 
            // txtHideShortCut
            // 
            this.txtHideShortCut.Location = new System.Drawing.Point(84, 49);
            this.txtHideShortCut.Name = "txtHideShortCut";
            this.txtHideShortCut.Size = new System.Drawing.Size(194, 21);
            this.txtHideShortCut.TabIndex = 16;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 53);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 15;
            this.label4.Text = "隐藏";
            // 
            // txtShowShortCut
            // 
            this.txtShowShortCut.Location = new System.Drawing.Point(84, 10);
            this.txtShowShortCut.Name = "txtShowShortCut";
            this.txtShowShortCut.Size = new System.Drawing.Size(194, 21);
            this.txtShowShortCut.TabIndex = 14;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 14);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 13;
            this.label3.Text = "启动";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(148, 132);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(221, 12);
            this.label8.TabIndex = 23;
            this.label8.Text = "(创建快捷方式时候删除原文件快捷方式)";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(33, 161);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(53, 12);
            this.label9.TabIndex = 24;
            this.label9.Text = "自动删除";
            // 
            // txtSearchOnlineShortCut
            // 
            this.txtSearchOnlineShortCut.Location = new System.Drawing.Point(84, 123);
            this.txtSearchOnlineShortCut.Name = "txtSearchOnlineShortCut";
            this.txtSearchOnlineShortCut.Size = new System.Drawing.Size(194, 21);
            this.txtSearchOnlineShortCut.TabIndex = 20;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(13, 127);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(53, 12);
            this.label10.TabIndex = 19;
            this.label10.Text = "网上搜索";
            // 
            // txtDesktopShortCut
            // 
            this.txtDesktopShortCut.Location = new System.Drawing.Point(84, 84);
            this.txtDesktopShortCut.Name = "txtDesktopShortCut";
            this.txtDesktopShortCut.Size = new System.Drawing.Size(194, 21);
            this.txtDesktopShortCut.TabIndex = 18;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(13, 88);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(53, 12);
            this.label11.TabIndex = 17;
            this.label11.Text = "显示桌面";
            // 
            // txtCaptureScreenShortCut
            // 
            this.txtCaptureScreenShortCut.Location = new System.Drawing.Point(84, 201);
            this.txtCaptureScreenShortCut.Name = "txtCaptureScreenShortCut";
            this.txtCaptureScreenShortCut.Size = new System.Drawing.Size(194, 21);
            this.txtCaptureScreenShortCut.TabIndex = 24;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(13, 205);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(29, 12);
            this.label12.TabIndex = 23;
            this.label12.Text = "截屏";
            // 
            // txtRunCMDShortCut
            // 
            this.txtRunCMDShortCut.Location = new System.Drawing.Point(84, 162);
            this.txtRunCMDShortCut.Name = "txtRunCMDShortCut";
            this.txtRunCMDShortCut.Size = new System.Drawing.Size(194, 21);
            this.txtRunCMDShortCut.TabIndex = 22;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(13, 166);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(53, 12);
            this.label13.TabIndex = 21;
            this.label13.Text = "运行命令";
            // 
            // FrmSetting
            // 
            this.AcceptButton = this.btnSaveSetting;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.CancelButton = this.btnCloseSetting;
            this.ClientSize = new System.Drawing.Size(570, 327);
            this.Controls.Add(this.btnCloseSetting);
            this.Controls.Add(this.tbcSetting);
            this.Controls.Add(this.btnSaveSetting);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmSetting";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "设置";
            this.Load += new System.EventHandler(this.FrmSetting_Load);
            this.tbcSetting.ResumeLayout(false);
            this.tbSystemConfig.ResumeLayout(false);
            this.tbSystemConfig.PerformLayout();
            this.tpSerachBoxConfig.ResumeLayout(false);
            this.tpSerachBoxConfig.PerformLayout();
            this.tpShortcut.ResumeLayout(false);
            this.tpShortcut.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnSaveSetting;
        private System.Windows.Forms.TabControl tbcSetting;
        private System.Windows.Forms.TabPage tbSystemConfig;
        private System.Windows.Forms.TabPage tpSerachBoxConfig;
        private System.Windows.Forms.CheckBox cbShowOnTopMost;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.CheckBox cbAutoRunWithWindowsOn;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtFilterExt;
        private System.Windows.Forms.Label lblFilterExt;
        private System.Windows.Forms.TextBox txtSearchIndexPath;
        private System.Windows.Forms.Label lblSearchIndexPath;
        private System.Windows.Forms.TextBox txtShowMaxRow;
        private System.Windows.Forms.Label lblShowMaxRow;
        private System.Windows.Forms.TextBox txtMinShowTip;
        private System.Windows.Forms.Label lblMinShowTip;
        private System.Windows.Forms.Button btnCloseSetting;
        private System.Windows.Forms.CheckBox cbAutoDelWhenFileNotExists;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox cbCreateShowcutWithDel;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtDefaultBrowser;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TabPage tpShortcut;
        private System.Windows.Forms.TextBox txtHideShortCut;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtShowShortCut;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtCaptureScreenShortCut;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtRunCMDShortCut;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox txtSearchOnlineShortCut;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtDesktopShortCut;
        private System.Windows.Forms.Label label11;
    }
}