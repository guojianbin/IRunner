namespace RViewer
{
    partial class frmSetting
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSetting));
            this.btnSaveSetting = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtTextEncoding = new System.Windows.Forms.TextBox();
            this.chbReadChildDir = new System.Windows.Forms.CheckBox();
            this.chbAutoSave = new System.Windows.Forms.CheckBox();
            this.SuspendLayout();
            // 
            // btnSaveSetting
            // 
            this.btnSaveSetting.Location = new System.Drawing.Point(191, 121);
            this.btnSaveSetting.Name = "btnSaveSetting";
            this.btnSaveSetting.Size = new System.Drawing.Size(75, 23);
            this.btnSaveSetting.TabIndex = 0;
            this.btnSaveSetting.Text = "保存";
            this.btnSaveSetting.UseVisualStyleBackColor = true;
            this.btnSaveSetting.Click += new System.EventHandler(this.btnSaveSetting_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(11, 50);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(77, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "循环读取目录";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(11, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(77, 12);
            this.label2.TabIndex = 2;
            this.label2.Text = "文本编码格式";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(11, 90);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 12);
            this.label3.TabIndex = 3;
            this.label3.Text = "自动保存工程";
            // 
            // txtTextEncoding
            // 
            this.txtTextEncoding.Location = new System.Drawing.Point(94, 12);
            this.txtTextEncoding.Name = "txtTextEncoding";
            this.txtTextEncoding.Size = new System.Drawing.Size(172, 21);
            this.txtTextEncoding.TabIndex = 5;
            // 
            // chbReadChildDir
            // 
            this.chbReadChildDir.AutoSize = true;
            this.chbReadChildDir.Location = new System.Drawing.Point(94, 49);
            this.chbReadChildDir.Name = "chbReadChildDir";
            this.chbReadChildDir.Size = new System.Drawing.Size(48, 16);
            this.chbReadChildDir.TabIndex = 7;
            this.chbReadChildDir.Text = "启用";
            this.chbReadChildDir.UseVisualStyleBackColor = true;
            // 
            // chbAutoSave
            // 
            this.chbAutoSave.AutoSize = true;
            this.chbAutoSave.Location = new System.Drawing.Point(94, 90);
            this.chbAutoSave.Name = "chbAutoSave";
            this.chbAutoSave.Size = new System.Drawing.Size(48, 16);
            this.chbAutoSave.TabIndex = 8;
            this.chbAutoSave.Text = "启用";
            this.chbAutoSave.UseVisualStyleBackColor = true;
            // 
            // frmSetting
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(284, 156);
            this.Controls.Add(this.chbAutoSave);
            this.Controls.Add(this.chbReadChildDir);
            this.Controls.Add(this.txtTextEncoding);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnSaveSetting);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmSetting";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "设置";
            this.Load += new System.EventHandler(this.frmSetting_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSaveSetting;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtTextEncoding;
        private System.Windows.Forms.CheckBox chbReadChildDir;
        private System.Windows.Forms.CheckBox chbAutoSave;
    }
}