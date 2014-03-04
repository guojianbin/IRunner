namespace JavaScriptBeautify
{
    partial class FrmJSExecutor
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
            this.txtCodeBody = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtFuncName = new System.Windows.Forms.TextBox();
            this.txtParams = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtResult = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnRun = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.rdbRun = new System.Windows.Forms.RadioButton();
            this.panel1 = new System.Windows.Forms.Panel();
            this.rdbEval = new System.Windows.Forms.RadioButton();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtCodeBody
            // 
            this.txtCodeBody.Location = new System.Drawing.Point(12, 92);
            this.txtCodeBody.Multiline = true;
            this.txtCodeBody.Name = "txtCodeBody";
            this.txtCodeBody.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtCodeBody.Size = new System.Drawing.Size(460, 330);
            this.txtCodeBody.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(1, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "方法名";
            // 
            // txtFuncName
            // 
            this.txtFuncName.Location = new System.Drawing.Point(48, 6);
            this.txtFuncName.Name = "txtFuncName";
            this.txtFuncName.Size = new System.Drawing.Size(177, 21);
            this.txtFuncName.TabIndex = 3;
            // 
            // txtParams
            // 
            this.txtParams.Location = new System.Drawing.Point(281, 6);
            this.txtParams.Name = "txtParams";
            this.txtParams.Size = new System.Drawing.Size(191, 21);
            this.txtParams.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(246, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 12);
            this.label2.TabIndex = 4;
            this.label2.Text = "参数";
            // 
            // txtResult
            // 
            this.txtResult.Location = new System.Drawing.Point(47, 33);
            this.txtResult.Name = "txtResult";
            this.txtResult.ReadOnly = true;
            this.txtResult.Size = new System.Drawing.Size(425, 21);
            this.txtResult.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 36);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 6;
            this.label3.Text = "结果";
            // 
            // btnRun
            // 
            this.btnRun.Location = new System.Drawing.Point(316, 63);
            this.btnRun.Name = "btnRun";
            this.btnRun.Size = new System.Drawing.Size(75, 23);
            this.btnRun.TabIndex = 8;
            this.btnRun.Text = "运行";
            this.btnRun.UseVisualStyleBackColor = true;
            this.btnRun.Click += new System.EventHandler(this.btnRun_Click);
            // 
            // btnClose
            // 
            this.btnClose.Location = new System.Drawing.Point(397, 63);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(75, 23);
            this.btnClose.TabIndex = 9;
            this.btnClose.Text = "退出";
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 68);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 10;
            this.label4.Text = "类型";
            // 
            // rdbRun
            // 
            this.rdbRun.AutoSize = true;
            this.rdbRun.Location = new System.Drawing.Point(3, 6);
            this.rdbRun.Name = "rdbRun";
            this.rdbRun.Size = new System.Drawing.Size(41, 16);
            this.rdbRun.TabIndex = 11;
            this.rdbRun.Text = "Run";
            this.rdbRun.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.rdbEval);
            this.panel1.Controls.Add(this.rdbRun);
            this.panel1.Location = new System.Drawing.Point(47, 60);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(178, 26);
            this.panel1.TabIndex = 12;
            // 
            // rdbEval
            // 
            this.rdbEval.AutoSize = true;
            this.rdbEval.Checked = true;
            this.rdbEval.Location = new System.Drawing.Point(61, 6);
            this.rdbEval.Name = "rdbEval";
            this.rdbEval.Size = new System.Drawing.Size(47, 16);
            this.rdbEval.TabIndex = 12;
            this.rdbEval.TabStop = true;
            this.rdbEval.Text = "Eval";
            this.rdbEval.UseVisualStyleBackColor = true;
            // 
            // FrmJSExecutor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(484, 434);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnRun);
            this.Controls.Add(this.txtResult);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtParams);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtFuncName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtCodeBody);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmJSExecutor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "JS运行工具";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtCodeBody;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtFuncName;
        private System.Windows.Forms.TextBox txtParams;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtResult;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.RadioButton rdbRun;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.RadioButton rdbEval;
    }
}