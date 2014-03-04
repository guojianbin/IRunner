namespace DataBaseOperator
{
    partial class FrmShowAllDbName
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
            this.lbDBNames = new System.Windows.Forms.ListBox();
            this.btnSelectAndClose = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lbDBNames
            // 
            this.lbDBNames.FormattingEnabled = true;
            this.lbDBNames.ItemHeight = 12;
            this.lbDBNames.Location = new System.Drawing.Point(12, 12);
            this.lbDBNames.Name = "lbDBNames";
            this.lbDBNames.Size = new System.Drawing.Size(260, 208);
            this.lbDBNames.TabIndex = 0;
            this.lbDBNames.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.lbDBNames_MouseDoubleClick);
            // 
            // btnSelectAndClose
            // 
            this.btnSelectAndClose.Location = new System.Drawing.Point(197, 227);
            this.btnSelectAndClose.Name = "btnSelectAndClose";
            this.btnSelectAndClose.Size = new System.Drawing.Size(75, 23);
            this.btnSelectAndClose.TabIndex = 1;
            this.btnSelectAndClose.Text = "确定";
            this.btnSelectAndClose.UseVisualStyleBackColor = true;
            this.btnSelectAndClose.Click += new System.EventHandler(this.btnSelectAndClose_Click);
            // 
            // FrmShowAllDbName
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 262);
            this.Controls.Add(this.btnSelectAndClose);
            this.Controls.Add(this.lbDBNames);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "FrmShowAllDbName";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "浏览数据库";
            this.Load += new System.EventHandler(this.FrmShowAllDbName_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox lbDBNames;
        private System.Windows.Forms.Button btnSelectAndClose;
    }
}