namespace IRunner
{
    partial class FrmSearchOnline
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
            this.txtSerach = new System.Windows.Forms.TextBox();
            this.btnBaiduSearch = new System.Windows.Forms.Button();
            this.btnGoogleSearch = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtSerach
            // 
            this.txtSerach.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSerach.Font = new System.Drawing.Font("宋体", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtSerach.Location = new System.Drawing.Point(8, 12);
            this.txtSerach.Name = "txtSerach";
            this.txtSerach.Size = new System.Drawing.Size(523, 32);
            this.txtSerach.TabIndex = 0;
            // 
            // btnBaiduSearch
            // 
            this.btnBaiduSearch.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBaiduSearch.Image = global::IRunner.Properties.Resources.Baidu;
            this.btnBaiduSearch.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBaiduSearch.Location = new System.Drawing.Point(236, 67);
            this.btnBaiduSearch.Name = "btnBaiduSearch";
            this.btnBaiduSearch.Size = new System.Drawing.Size(99, 23);
            this.btnBaiduSearch.TabIndex = 1;
            this.btnBaiduSearch.Text = "百度一下(&B)";
            this.btnBaiduSearch.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBaiduSearch.UseVisualStyleBackColor = true;
            this.btnBaiduSearch.Click += new System.EventHandler(this.btnBaiduSearch_Click);
            // 
            // btnGoogleSearch
            // 
            this.btnGoogleSearch.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnGoogleSearch.Image = global::IRunner.Properties.Resources.Google;
            this.btnGoogleSearch.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnGoogleSearch.Location = new System.Drawing.Point(341, 67);
            this.btnGoogleSearch.Name = "btnGoogleSearch";
            this.btnGoogleSearch.Size = new System.Drawing.Size(99, 23);
            this.btnGoogleSearch.TabIndex = 2;
            this.btnGoogleSearch.Text = "谷歌一下(&G)";
            this.btnGoogleSearch.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnGoogleSearch.UseVisualStyleBackColor = true;
            this.btnGoogleSearch.Click += new System.EventHandler(this.btnGoogleSearch_Click);
            // 
            // btnClose
            // 
            this.btnClose.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnClose.Location = new System.Drawing.Point(446, 67);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(85, 23);
            this.btnClose.TabIndex = 3;
            this.btnClose.Text = "取消(&X)";
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // FrmSearchOnline
            // 
            this.AcceptButton = this.btnBaiduSearch;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnClose;
            this.ClientSize = new System.Drawing.Size(537, 102);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnGoogleSearch);
            this.Controls.Add(this.btnBaiduSearch);
            this.Controls.Add(this.txtSerach);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmSearchOnline";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "搜索";
            this.Activated += new System.EventHandler(this.FrmSearchOnline_Activated);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.FrmSearchOnline_MouseDown);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmSearchOnline_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtSerach;
        private System.Windows.Forms.Button btnBaiduSearch;
        private System.Windows.Forms.Button btnGoogleSearch;
        private System.Windows.Forms.Button btnClose;
    }
}