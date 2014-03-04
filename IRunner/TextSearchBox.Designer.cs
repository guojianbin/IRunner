namespace IRunner
{
    partial class TextSearchBox
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
            this.btnSearchContent = new System.Windows.Forms.Button();
            this.btnCancelSearch = new System.Windows.Forms.Button();
            this.txtSearchText = new System.Windows.Forms.TextBox();
            this.lblSearchText = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnSearchContent
            // 
            this.btnSearchContent.Location = new System.Drawing.Point(93, 57);
            this.btnSearchContent.Name = "btnSearchContent";
            this.btnSearchContent.Size = new System.Drawing.Size(98, 23);
            this.btnSearchContent.TabIndex = 0;
            this.btnSearchContent.Text = "查找下一个(&F)";
            this.btnSearchContent.UseVisualStyleBackColor = true;
            this.btnSearchContent.Click += new System.EventHandler(this.btnSearchContent_Click);
            // 
            // btnCancelSearch
            // 
            this.btnCancelSearch.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancelSearch.Location = new System.Drawing.Point(201, 57);
            this.btnCancelSearch.Name = "btnCancelSearch";
            this.btnCancelSearch.Size = new System.Drawing.Size(98, 23);
            this.btnCancelSearch.TabIndex = 1;
            this.btnCancelSearch.Text = "取消(Esc)";
            this.btnCancelSearch.UseVisualStyleBackColor = true;
            this.btnCancelSearch.Click += new System.EventHandler(this.btnCancelSearch_Click);
            // 
            // txtSearchText
            // 
            this.txtSearchText.Location = new System.Drawing.Point(73, 21);
            this.txtSearchText.Name = "txtSearchText";
            this.txtSearchText.Size = new System.Drawing.Size(226, 21);
            this.txtSearchText.TabIndex = 2;
            // 
            // lblSearchText
            // 
            this.lblSearchText.AutoSize = true;
            this.lblSearchText.Location = new System.Drawing.Point(14, 24);
            this.lblSearchText.Name = "lblSearchText";
            this.lblSearchText.Size = new System.Drawing.Size(53, 12);
            this.lblSearchText.TabIndex = 3;
            this.lblSearchText.Text = "查找内容";
            // 
            // TextSearchBox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.CancelButton = this.btnCancelSearch;
            this.ClientSize = new System.Drawing.Size(311, 92);
            this.ControlBox = false;
            this.Controls.Add(this.lblSearchText);
            this.Controls.Add(this.txtSearchText);
            this.Controls.Add(this.btnCancelSearch);
            this.Controls.Add(this.btnSearchContent);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "TextSearchBox";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "查找";
            this.TopMost = true;
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSearchContent;
        private System.Windows.Forms.Button btnCancelSearch;
        private System.Windows.Forms.TextBox txtSearchText;
        private System.Windows.Forms.Label lblSearchText;
    }
}