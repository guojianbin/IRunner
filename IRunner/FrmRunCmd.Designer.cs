namespace IRunner
{
    partial class FrmRunCmd
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
            this.btnRunCmd = new System.Windows.Forms.Button();
            this.btnCloseRun = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtRunCmd = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnRunCmd
            // 
            this.btnRunCmd.Location = new System.Drawing.Point(180, 110);
            this.btnRunCmd.Name = "btnRunCmd";
            this.btnRunCmd.Size = new System.Drawing.Size(75, 23);
            this.btnRunCmd.TabIndex = 0;
            this.btnRunCmd.Text = "确定";
            this.btnRunCmd.UseVisualStyleBackColor = true;
            this.btnRunCmd.Click += new System.EventHandler(this.btnRunCmd_Click);
            // 
            // btnCloseRun
            // 
            this.btnCloseRun.Location = new System.Drawing.Point(278, 110);
            this.btnCloseRun.Name = "btnCloseRun";
            this.btnCloseRun.Size = new System.Drawing.Size(75, 23);
            this.btnCloseRun.TabIndex = 1;
            this.btnCloseRun.Text = "取消";
            this.btnCloseRun.UseVisualStyleBackColor = true;
            this.btnCloseRun.Click += new System.EventHandler(this.btnCloseRun_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(47, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "打开(&O)";
            // 
            // txtRunCmd
            // 
            this.txtRunCmd.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.txtRunCmd.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.txtRunCmd.Location = new System.Drawing.Point(68, 22);
            this.txtRunCmd.Name = "txtRunCmd";
            this.txtRunCmd.Size = new System.Drawing.Size(285, 21);
            this.txtRunCmd.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(66, 71);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(257, 12);
            this.label2.TabIndex = 4;
            this.label2.Text = "根据输入的命令名称，打开相应的程序或文件夹";
            // 
            // FrmRunCmd
            // 
            this.AcceptButton = this.btnRunCmd;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCloseRun;
            this.ClientSize = new System.Drawing.Size(377, 145);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtRunCmd);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnCloseRun);
            this.Controls.Add(this.btnRunCmd);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmRunCmd";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "运行";
            this.Load += new System.EventHandler(this.FrmRunCmd_Load);
            this.Activated += new System.EventHandler(this.FrmRunCmd_Activated);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmRunCmd_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnRunCmd;
        private System.Windows.Forms.Button btnCloseRun;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtRunCmd;
        private System.Windows.Forms.Label label2;
    }
}