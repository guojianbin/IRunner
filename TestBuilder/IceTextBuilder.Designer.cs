namespace TestBuilder
{
    partial class IceTextBuilder
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
            this.mnsTextBuilder = new System.Windows.Forms.MenuStrip();
            this.tsmiGenCSharp = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiGenVB = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiCopy = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiClear = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiClose = new System.Windows.Forms.ToolStripMenuItem();
            this.splitContainerTextBuilder = new System.Windows.Forms.SplitContainer();
            this.rtxtSource = new System.Windows.Forms.RichTextBox();
            this.rtxtResult = new System.Windows.Forms.RichTextBox();
            this.mnsTextBuilder.SuspendLayout();
            this.splitContainerTextBuilder.Panel1.SuspendLayout();
            this.splitContainerTextBuilder.Panel2.SuspendLayout();
            this.splitContainerTextBuilder.SuspendLayout();
            this.SuspendLayout();
            // 
            // mnsTextBuilder
            // 
            this.mnsTextBuilder.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiGenCSharp,
            this.tsmiGenVB,
            this.tsmiCopy,
            this.tsmiClear,
            this.tsmiClose});
            this.mnsTextBuilder.Location = new System.Drawing.Point(0, 0);
            this.mnsTextBuilder.Name = "mnsTextBuilder";
            this.mnsTextBuilder.Size = new System.Drawing.Size(784, 25);
            this.mnsTextBuilder.TabIndex = 0;
            // 
            // tsmiGenCSharp
            // 
            this.tsmiGenCSharp.Name = "tsmiGenCSharp";
            this.tsmiGenCSharp.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.H)));
            this.tsmiGenCSharp.ShowShortcutKeys = false;
            this.tsmiGenCSharp.Size = new System.Drawing.Size(77, 21);
            this.tsmiGenCSharp.Text = "生成C#(&H)";
            this.tsmiGenCSharp.Click += new System.EventHandler(this.tsmiGenCSharp_Click);
            // 
            // tsmiGenVB
            // 
            this.tsmiGenVB.Name = "tsmiGenVB";
            this.tsmiGenVB.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.B)));
            this.tsmiGenVB.ShowShortcutKeys = false;
            this.tsmiGenVB.Size = new System.Drawing.Size(76, 21);
            this.tsmiGenVB.Text = "生成VB(&B)";
            this.tsmiGenVB.Click += new System.EventHandler(this.tsmiGenVB_Click);
            // 
            // tsmiCopy
            // 
            this.tsmiCopy.Name = "tsmiCopy";
            this.tsmiCopy.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.C)));
            this.tsmiCopy.ShowShortcutKeys = false;
            this.tsmiCopy.Size = new System.Drawing.Size(60, 21);
            this.tsmiCopy.Text = "复制(&C)";
            this.tsmiCopy.Click += new System.EventHandler(this.tsmiCopy_Click);
            // 
            // tsmiClear
            // 
            this.tsmiClear.Name = "tsmiClear";
            this.tsmiClear.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.N)));
            this.tsmiClear.ShowShortcutKeys = false;
            this.tsmiClear.Size = new System.Drawing.Size(62, 21);
            this.tsmiClear.Text = "清空(&N)";
            this.tsmiClear.Click += new System.EventHandler(this.tsmiClear_Click);
            // 
            // tsmiClose
            // 
            this.tsmiClose.Name = "tsmiClose";
            this.tsmiClose.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.E)));
            this.tsmiClose.ShowShortcutKeys = false;
            this.tsmiClose.Size = new System.Drawing.Size(59, 21);
            this.tsmiClose.Text = "退出(&E)";
            this.tsmiClose.Click += new System.EventHandler(this.tsmiClose_Click);
            // 
            // splitContainerTextBuilder
            // 
            this.splitContainerTextBuilder.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerTextBuilder.Location = new System.Drawing.Point(0, 25);
            this.splitContainerTextBuilder.Name = "splitContainerTextBuilder";
            // 
            // splitContainerTextBuilder.Panel1
            // 
            this.splitContainerTextBuilder.Panel1.Controls.Add(this.rtxtSource);
            // 
            // splitContainerTextBuilder.Panel2
            // 
            this.splitContainerTextBuilder.Panel2.Controls.Add(this.rtxtResult);
            this.splitContainerTextBuilder.Size = new System.Drawing.Size(784, 537);
            this.splitContainerTextBuilder.SplitterDistance = 367;
            this.splitContainerTextBuilder.TabIndex = 1;
            // 
            // rtxtSource
            // 
            this.rtxtSource.Dock = System.Windows.Forms.DockStyle.Fill;
            this.rtxtSource.Location = new System.Drawing.Point(0, 0);
            this.rtxtSource.Name = "rtxtSource";
            this.rtxtSource.Size = new System.Drawing.Size(367, 537);
            this.rtxtSource.TabIndex = 0;
            this.rtxtSource.Text = "";
            // 
            // rtxtResult
            // 
            this.rtxtResult.Dock = System.Windows.Forms.DockStyle.Fill;
            this.rtxtResult.Location = new System.Drawing.Point(0, 0);
            this.rtxtResult.Name = "rtxtResult";
            this.rtxtResult.Size = new System.Drawing.Size(413, 537);
            this.rtxtResult.TabIndex = 1;
            this.rtxtResult.Text = "";
            // 
            // IceTextBuilder
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(784, 562);
            this.Controls.Add(this.splitContainerTextBuilder);
            this.Controls.Add(this.mnsTextBuilder);
            this.MainMenuStrip = this.mnsTextBuilder;
            this.Name = "IceTextBuilder";
            this.ShowIcon = false;
            this.Text = "IceTextBuilder";
            this.mnsTextBuilder.ResumeLayout(false);
            this.mnsTextBuilder.PerformLayout();
            this.splitContainerTextBuilder.Panel1.ResumeLayout(false);
            this.splitContainerTextBuilder.Panel2.ResumeLayout(false);
            this.splitContainerTextBuilder.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip mnsTextBuilder;
        private System.Windows.Forms.ToolStripMenuItem tsmiGenCSharp;
        private System.Windows.Forms.ToolStripMenuItem tsmiGenVB;
        private System.Windows.Forms.ToolStripMenuItem tsmiCopy;
        private System.Windows.Forms.ToolStripMenuItem tsmiClear;
        private System.Windows.Forms.ToolStripMenuItem tsmiClose;
        private System.Windows.Forms.SplitContainer splitContainerTextBuilder;
        private System.Windows.Forms.RichTextBox rtxtSource;
        private System.Windows.Forms.RichTextBox rtxtResult;

    }
}