namespace FileSearcher
{
    partial class FrmFileSearch
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvShowResult = new System.Windows.Forms.DataGridView();
            this.FileId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ExtName = new System.Windows.Forms.DataGridViewImageColumn();
            this.Py = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FileName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FilePath = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtSearchBox = new System.Windows.Forms.TextBox();
            this.mmsFileSearch = new System.Windows.Forms.MenuStrip();
            this.miCreateIndexToFile = new System.Windows.Forms.ToolStripMenuItem();
            this.miClose = new System.Windows.Forms.ToolStripMenuItem();
            this.bgwkCreateFileIndex = new System.ComponentModel.BackgroundWorker();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.tsslState = new System.Windows.Forms.ToolStripStatusLabel();
            this.tspbOperation = new System.Windows.Forms.ToolStripProgressBar();
            this.About = new System.Windows.Forms.ToolStripStatusLabel();
            ((System.ComponentModel.ISupportInitialize)(this.dgvShowResult)).BeginInit();
            this.mmsFileSearch.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvShowResult
            // 
            this.dgvShowResult.AllowUserToAddRows = false;
            this.dgvShowResult.AllowUserToDeleteRows = false;
            this.dgvShowResult.AllowUserToResizeColumns = false;
            this.dgvShowResult.AllowUserToResizeRows = false;
            this.dgvShowResult.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            this.dgvShowResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvShowResult.ColumnHeadersVisible = false;
            this.dgvShowResult.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.FileId,
            this.ExtName,
            this.Py,
            this.FileName,
            this.FilePath});
            this.dgvShowResult.Location = new System.Drawing.Point(12, 55);
            this.dgvShowResult.Name = "dgvShowResult";
            this.dgvShowResult.ReadOnly = true;
            this.dgvShowResult.RowHeadersVisible = false;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dgvShowResult.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvShowResult.RowTemplate.Height = 23;
            this.dgvShowResult.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.dgvShowResult.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvShowResult.Size = new System.Drawing.Size(660, 439);
            this.dgvShowResult.TabIndex = 4;
            this.dgvShowResult.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvShowResult_CellDoubleClick);
            this.dgvShowResult.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvShowResult_KeyDown);
            this.dgvShowResult.SelectionChanged += new System.EventHandler(this.dgvShowResult_SelectionChanged);
            // 
            // FileId
            // 
            this.FileId.DataPropertyName = "Id";
            this.FileId.Frozen = true;
            this.FileId.HeaderText = "序号";
            this.FileId.Name = "FileId";
            this.FileId.ReadOnly = true;
            this.FileId.Width = 30;
            // 
            // ExtName
            // 
            this.ExtName.DataPropertyName = "FilePath";
            this.ExtName.Frozen = true;
            this.ExtName.HeaderText = "图标";
            this.ExtName.ImageLayout = System.Windows.Forms.DataGridViewImageCellLayout.Zoom;
            this.ExtName.Name = "ExtName";
            this.ExtName.ReadOnly = true;
            this.ExtName.Width = 30;
            // 
            // Py
            // 
            this.Py.DataPropertyName = "Py";
            this.Py.HeaderText = "快捷键";
            this.Py.Name = "Py";
            this.Py.ReadOnly = true;
            this.Py.Width = 250;
            // 
            // FileName
            // 
            this.FileName.DataPropertyName = "Name";
            this.FileName.HeaderText = "名称";
            this.FileName.Name = "FileName";
            this.FileName.ReadOnly = true;
            this.FileName.Width = 350;
            // 
            // FilePath
            // 
            this.FilePath.DataPropertyName = "FilePath";
            this.FilePath.HeaderText = "所在路径";
            this.FilePath.Name = "FilePath";
            this.FilePath.ReadOnly = true;
            this.FilePath.Visible = false;
            this.FilePath.Width = 180;
            // 
            // txtSearchBox
            // 
            this.txtSearchBox.Location = new System.Drawing.Point(12, 28);
            this.txtSearchBox.Name = "txtSearchBox";
            this.txtSearchBox.Size = new System.Drawing.Size(660, 21);
            this.txtSearchBox.TabIndex = 3;
            this.txtSearchBox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtSearchBox_KeyDown);
            // 
            // mmsFileSearch
            // 
            this.mmsFileSearch.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.miCreateIndexToFile,
            this.miClose});
            this.mmsFileSearch.Location = new System.Drawing.Point(0, 0);
            this.mmsFileSearch.Name = "mmsFileSearch";
            this.mmsFileSearch.Size = new System.Drawing.Size(682, 25);
            this.mmsFileSearch.TabIndex = 5;
            // 
            // miCreateIndexToFile
            // 
            this.miCreateIndexToFile.Name = "miCreateIndexToFile";
            this.miCreateIndexToFile.Size = new System.Drawing.Size(68, 21);
            this.miCreateIndexToFile.Text = "重建索引";
            this.miCreateIndexToFile.Click += new System.EventHandler(this.miCreateIndexToFile_Click);
            // 
            // miClose
            // 
            this.miClose.Name = "miClose";
            this.miClose.Size = new System.Drawing.Size(44, 21);
            this.miClose.Text = "退出";
            this.miClose.Click += new System.EventHandler(this.miClose_Click);
            // 
            // bgwkCreateFileIndex
            // 
            this.bgwkCreateFileIndex.WorkerReportsProgress = true;
            this.bgwkCreateFileIndex.DoWork += new System.ComponentModel.DoWorkEventHandler(this.bgwkCreateFileIndex_DoWork);
            this.bgwkCreateFileIndex.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.bgwkCreateFileIndex_RunWorkerCompleted);
            this.bgwkCreateFileIndex.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.bgwkCreateFileIndex_ProgressChanged);
            // 
            // statusStrip1
            // 
            this.statusStrip1.AutoSize = false;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsslState,
            this.tspbOperation,
            this.About});
            this.statusStrip1.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.Flow;
            this.statusStrip1.Location = new System.Drawing.Point(0, 503);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(682, 22);
            this.statusStrip1.TabIndex = 7;
            // 
            // tsslState
            // 
            this.tsslState.Name = "tsslState";
            this.tsslState.Size = new System.Drawing.Size(0, 0);
            // 
            // tspbOperation
            // 
            this.tspbOperation.Name = "tspbOperation";
            this.tspbOperation.Size = new System.Drawing.Size(100, 16);
            this.tspbOperation.Step = 1;
            // 
            // About
            // 
            this.About.Margin = new System.Windows.Forms.Padding(10, 3, 0, 2);
            this.About.Name = "About";
            this.About.Size = new System.Drawing.Size(59, 17);
            this.About.Text = "ice.Kwok";
            // 
            // FrmFileSearch
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(682, 525);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.dgvShowResult);
            this.Controls.Add(this.txtSearchBox);
            this.Controls.Add(this.mmsFileSearch);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MainMenuStrip = this.mmsFileSearch;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmFileSearch";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "文件查找";
            this.Load += new System.EventHandler(this.FrmFileSearch_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvShowResult)).EndInit();
            this.mmsFileSearch.ResumeLayout(false);
            this.mmsFileSearch.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvShowResult;
        private System.Windows.Forms.DataGridViewTextBoxColumn FileId;
        private System.Windows.Forms.DataGridViewImageColumn ExtName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Py;
        private System.Windows.Forms.DataGridViewTextBoxColumn FileName;
        private System.Windows.Forms.DataGridViewTextBoxColumn FilePath;
        private System.Windows.Forms.TextBox txtSearchBox;
        private System.Windows.Forms.MenuStrip mmsFileSearch;
        private System.Windows.Forms.ToolStripMenuItem miCreateIndexToFile;
        private System.Windows.Forms.ToolStripMenuItem miClose;
        private System.ComponentModel.BackgroundWorker bgwkCreateFileIndex;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel tsslState;
        private System.Windows.Forms.ToolStripProgressBar tspbOperation;
        private System.Windows.Forms.ToolStripStatusLabel About;
    }
}

