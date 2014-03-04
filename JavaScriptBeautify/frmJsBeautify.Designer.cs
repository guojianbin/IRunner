namespace JavaScriptBeautify
{
    partial class frmJsBeautify
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
            this.mnsJs = new System.Windows.Forms.MenuStrip();
            this.tsmiFormat = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiCompress = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiCopy = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiClear = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiClose = new System.Windows.Forms.ToolStripMenuItem();
            this.txtJsSource = new System.Windows.Forms.TextBox();
            this.tsmiRunJs = new System.Windows.Forms.ToolStripMenuItem();
            this.mnsJs.SuspendLayout();
            this.SuspendLayout();
            // 
            // mnsJs
            // 
            this.mnsJs.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiRunJs,
            this.tsmiFormat,
            this.tsmiCompress,
            this.tsmiCopy,
            this.tsmiClear,
            this.tsmiClose});
            this.mnsJs.Location = new System.Drawing.Point(0, 0);
            this.mnsJs.Name = "mnsJs";
            this.mnsJs.Size = new System.Drawing.Size(284, 25);
            this.mnsJs.TabIndex = 0;
            // 
            // tsmiFormat
            // 
            this.tsmiFormat.Name = "tsmiFormat";
            this.tsmiFormat.Size = new System.Drawing.Size(56, 21);
            this.tsmiFormat.Text = "格式化";
            this.tsmiFormat.Click += new System.EventHandler(this.tsmiFormat_Click);
            // 
            // tsmiCompress
            // 
            this.tsmiCompress.Name = "tsmiCompress";
            this.tsmiCompress.Size = new System.Drawing.Size(44, 21);
            this.tsmiCompress.Text = "压缩";
            this.tsmiCompress.Click += new System.EventHandler(this.tsmiCompress_Click);
            // 
            // tsmiCopy
            // 
            this.tsmiCopy.Name = "tsmiCopy";
            this.tsmiCopy.Size = new System.Drawing.Size(44, 21);
            this.tsmiCopy.Text = "复制";
            this.tsmiCopy.Click += new System.EventHandler(this.tsmiCopy_Click);
            // 
            // tsmiClear
            // 
            this.tsmiClear.Name = "tsmiClear";
            this.tsmiClear.Size = new System.Drawing.Size(44, 21);
            this.tsmiClear.Text = "清空";
            this.tsmiClear.Click += new System.EventHandler(this.tsmiClear_Click);
            // 
            // tsmiClose
            // 
            this.tsmiClose.Name = "tsmiClose";
            this.tsmiClose.Size = new System.Drawing.Size(44, 21);
            this.tsmiClose.Text = "退出";
            this.tsmiClose.Click += new System.EventHandler(this.tsmiClose_Click);
            // 
            // txtJsSource
            // 
            this.txtJsSource.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtJsSource.Location = new System.Drawing.Point(0, 25);
            this.txtJsSource.Multiline = true;
            this.txtJsSource.Name = "txtJsSource";
            this.txtJsSource.Size = new System.Drawing.Size(284, 237);
            this.txtJsSource.TabIndex = 1;
            // 
            // tsmiRunJs
            // 
            this.tsmiRunJs.Name = "tsmiRunJs";
            this.tsmiRunJs.Size = new System.Drawing.Size(44, 21);
            this.tsmiRunJs.Text = "运行";
            this.tsmiRunJs.Click += new System.EventHandler(this.tsmiRunJs_Click);
            // 
            // frmJsBeautify
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 262);
            this.Controls.Add(this.txtJsSource);
            this.Controls.Add(this.mnsJs);
            this.MainMenuStrip = this.mnsJs;
            this.Name = "frmJsBeautify";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Javascript美化工具";
            this.Load += new System.EventHandler(this.frmJsBeautify_Load);
            this.mnsJs.ResumeLayout(false);
            this.mnsJs.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip mnsJs;
        private System.Windows.Forms.ToolStripMenuItem tsmiFormat;
        private System.Windows.Forms.ToolStripMenuItem tsmiCompress;
        private System.Windows.Forms.ToolStripMenuItem tsmiCopy;
        private System.Windows.Forms.ToolStripMenuItem tsmiClear;
        private System.Windows.Forms.ToolStripMenuItem tsmiClose;
        private System.Windows.Forms.TextBox txtJsSource;
        private System.Windows.Forms.ToolStripMenuItem tsmiRunJs;
    }
}

