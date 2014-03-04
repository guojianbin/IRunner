namespace GUIDGenerator
{
    partial class FrmGUIDGen
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmGUIDGen));
            this.gbGuidResult = new System.Windows.Forms.GroupBox();
            this.lblResult = new System.Windows.Forms.Label();
            this.gbGUIDType = new System.Windows.Forms.GroupBox();
            this.rbTypeP = new System.Windows.Forms.RadioButton();
            this.rbTypeB = new System.Windows.Forms.RadioButton();
            this.rbTypeN = new System.Windows.Forms.RadioButton();
            this.rbTypeD = new System.Windows.Forms.RadioButton();
            this.btnNewGuid = new System.Windows.Forms.Button();
            this.cbUpper = new System.Windows.Forms.CheckBox();
            this.btnCopy = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.gbGuidResult.SuspendLayout();
            this.gbGUIDType.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbGuidResult
            // 
            this.gbGuidResult.Controls.Add(this.lblResult);
            this.gbGuidResult.Location = new System.Drawing.Point(12, 179);
            this.gbGuidResult.Name = "gbGuidResult";
            this.gbGuidResult.Size = new System.Drawing.Size(270, 71);
            this.gbGuidResult.TabIndex = 0;
            this.gbGuidResult.TabStop = false;
            this.gbGuidResult.Text = "结果";
            // 
            // lblResult
            // 
            this.lblResult.AutoSize = true;
            this.lblResult.Location = new System.Drawing.Point(6, 17);
            this.lblResult.Name = "lblResult";
            this.lblResult.Size = new System.Drawing.Size(0, 12);
            this.lblResult.TabIndex = 0;
            // 
            // gbGUIDType
            // 
            this.gbGUIDType.Controls.Add(this.rbTypeP);
            this.gbGUIDType.Controls.Add(this.rbTypeB);
            this.gbGUIDType.Controls.Add(this.rbTypeN);
            this.gbGUIDType.Controls.Add(this.rbTypeD);
            this.gbGUIDType.Location = new System.Drawing.Point(12, 49);
            this.gbGUIDType.Name = "gbGUIDType";
            this.gbGUIDType.Size = new System.Drawing.Size(270, 124);
            this.gbGUIDType.TabIndex = 1;
            this.gbGUIDType.TabStop = false;
            this.gbGUIDType.Text = "GUID格式";
            // 
            // rbTypeP
            // 
            this.rbTypeP.AutoSize = true;
            this.rbTypeP.Location = new System.Drawing.Point(8, 86);
            this.rbTypeP.Name = "rbTypeP";
            this.rbTypeP.Size = new System.Drawing.Size(251, 16);
            this.rbTypeP.TabIndex = 3;
            this.rbTypeP.TabStop = true;
            this.rbTypeP.Text = "(xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)";
            this.rbTypeP.UseVisualStyleBackColor = true;
            // 
            // rbTypeB
            // 
            this.rbTypeB.AutoSize = true;
            this.rbTypeB.Location = new System.Drawing.Point(8, 64);
            this.rbTypeB.Name = "rbTypeB";
            this.rbTypeB.Size = new System.Drawing.Size(251, 16);
            this.rbTypeB.TabIndex = 2;
            this.rbTypeB.TabStop = true;
            this.rbTypeB.Text = "{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}";
            this.rbTypeB.UseVisualStyleBackColor = true;
            // 
            // rbTypeN
            // 
            this.rbTypeN.AutoSize = true;
            this.rbTypeN.Location = new System.Drawing.Point(8, 42);
            this.rbTypeN.Name = "rbTypeN";
            this.rbTypeN.Size = new System.Drawing.Size(215, 16);
            this.rbTypeN.TabIndex = 1;
            this.rbTypeN.TabStop = true;
            this.rbTypeN.Text = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
            this.rbTypeN.UseVisualStyleBackColor = true;
            // 
            // rbTypeD
            // 
            this.rbTypeD.AutoSize = true;
            this.rbTypeD.Location = new System.Drawing.Point(8, 20);
            this.rbTypeD.Name = "rbTypeD";
            this.rbTypeD.Size = new System.Drawing.Size(239, 16);
            this.rbTypeD.TabIndex = 0;
            this.rbTypeD.TabStop = true;
            this.rbTypeD.Text = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";
            this.rbTypeD.UseVisualStyleBackColor = true;
            // 
            // btnNewGuid
            // 
            this.btnNewGuid.Location = new System.Drawing.Point(88, 12);
            this.btnNewGuid.Name = "btnNewGuid";
            this.btnNewGuid.Size = new System.Drawing.Size(57, 23);
            this.btnNewGuid.TabIndex = 2;
            this.btnNewGuid.Text = "新建(&N)";
            this.btnNewGuid.UseVisualStyleBackColor = true;
            this.btnNewGuid.Click += new System.EventHandler(this.btnNewGuid_Click);
            // 
            // cbUpper
            // 
            this.cbUpper.AutoSize = true;
            this.cbUpper.Checked = true;
            this.cbUpper.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cbUpper.Location = new System.Drawing.Point(12, 16);
            this.cbUpper.Name = "cbUpper";
            this.cbUpper.Size = new System.Drawing.Size(48, 16);
            this.cbUpper.TabIndex = 3;
            this.cbUpper.Text = "大写";
            this.cbUpper.UseVisualStyleBackColor = true;
            // 
            // btnCopy
            // 
            this.btnCopy.Location = new System.Drawing.Point(151, 12);
            this.btnCopy.Name = "btnCopy";
            this.btnCopy.Size = new System.Drawing.Size(57, 23);
            this.btnCopy.TabIndex = 4;
            this.btnCopy.Text = "复制(&C)";
            this.btnCopy.UseVisualStyleBackColor = true;
            this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
            // 
            // btnClose
            // 
            this.btnClose.Location = new System.Drawing.Point(214, 12);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(57, 23);
            this.btnClose.TabIndex = 5;
            this.btnClose.Text = "退出(&X)";
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // FrmGUIDGen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(291, 262);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnCopy);
            this.Controls.Add(this.cbUpper);
            this.Controls.Add(this.btnNewGuid);
            this.Controls.Add(this.gbGUIDType);
            this.Controls.Add(this.gbGuidResult);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "FrmGUIDGen";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "GUID生成器";
            this.gbGuidResult.ResumeLayout(false);
            this.gbGuidResult.PerformLayout();
            this.gbGUIDType.ResumeLayout(false);
            this.gbGUIDType.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox gbGuidResult;
        private System.Windows.Forms.Label lblResult;
        private System.Windows.Forms.GroupBox gbGUIDType;
        private System.Windows.Forms.Button btnNewGuid;
        private System.Windows.Forms.RadioButton rbTypeP;
        private System.Windows.Forms.RadioButton rbTypeB;
        private System.Windows.Forms.RadioButton rbTypeN;
        private System.Windows.Forms.RadioButton rbTypeD;
        private System.Windows.Forms.CheckBox cbUpper;
        private System.Windows.Forms.Button btnCopy;
        private System.Windows.Forms.Button btnClose;
    }
}

