namespace DataBaseOperator
{
    partial class FrmDBOperate
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
            this.btnCheckExistMSSQL = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtDBConnectionString = new System.Windows.Forms.TextBox();
            this.btnOpenCofigFrm = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btnLDFPath = new System.Windows.Forms.Button();
            this.btnMDFPath = new System.Windows.Forms.Button();
            this.txtLDFPath = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtMDFPath = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnattachDB = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnDetachDBPath = new System.Windows.Forms.Button();
            this.txtDetachDB = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnDetachDB = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btnBackupDBToPath = new System.Windows.Forms.Button();
            this.txtBackupToPath = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btnBackupFromDB = new System.Windows.Forms.Button();
            this.txtBackupFromDB = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnBackupDB = new System.Windows.Forms.Button();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.btnRestoreDBFrombak = new System.Windows.Forms.Button();
            this.txtRestoreDBFrombak = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.btnRestoreToDB = new System.Windows.Forms.Button();
            this.txtRestoreToDB = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.btnRestoreDB = new System.Windows.Forms.Button();
            this.btnStop = new System.Windows.Forms.Button();
            this.btnStart = new System.Windows.Forms.Button();
            this.btnRestart = new System.Windows.Forms.Button();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnCheckExistMSSQL
            // 
            this.btnCheckExistMSSQL.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCheckExistMSSQL.Location = new System.Drawing.Point(328, 20);
            this.btnCheckExistMSSQL.Name = "btnCheckExistMSSQL";
            this.btnCheckExistMSSQL.Size = new System.Drawing.Size(101, 23);
            this.btnCheckExistMSSQL.TabIndex = 0;
            this.btnCheckExistMSSQL.Text = "检查MSSQL状况";
            this.btnCheckExistMSSQL.UseVisualStyleBackColor = true;
            this.btnCheckExistMSSQL.Click += new System.EventHandler(this.btnCheckExistMSSQL_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtDBConnectionString);
            this.groupBox1.Controls.Add(this.btnOpenCofigFrm);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 90);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(760, 57);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "数据库连接配置";
            // 
            // txtDBConnectionString
            // 
            this.txtDBConnectionString.Location = new System.Drawing.Point(88, 23);
            this.txtDBConnectionString.Name = "txtDBConnectionString";
            this.txtDBConnectionString.Size = new System.Drawing.Size(461, 21);
            this.txtDBConnectionString.TabIndex = 1;
            this.txtDBConnectionString.Text = "Data Source=.;Initial Catalog=master;User ID=sa;Password=123";
            // 
            // btnOpenCofigFrm
            // 
            this.btnOpenCofigFrm.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnOpenCofigFrm.Location = new System.Drawing.Point(555, 21);
            this.btnOpenCofigFrm.Name = "btnOpenCofigFrm";
            this.btnOpenCofigFrm.Size = new System.Drawing.Size(55, 23);
            this.btnOpenCofigFrm.TabIndex = 2;
            this.btnOpenCofigFrm.Text = "浏览";
            this.btnOpenCofigFrm.UseVisualStyleBackColor = true;
            this.btnOpenCofigFrm.Click += new System.EventHandler(this.btnOpenCofigFrm_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(17, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "连接字符串";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnLDFPath);
            this.groupBox2.Controls.Add(this.btnMDFPath);
            this.groupBox2.Controls.Add(this.txtLDFPath);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.txtMDFPath);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.btnattachDB);
            this.groupBox2.Location = new System.Drawing.Point(12, 170);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(760, 80);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "附加数据库";
            // 
            // btnLDFPath
            // 
            this.btnLDFPath.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnLDFPath.Location = new System.Drawing.Point(555, 45);
            this.btnLDFPath.Name = "btnLDFPath";
            this.btnLDFPath.Size = new System.Drawing.Size(55, 23);
            this.btnLDFPath.TabIndex = 8;
            this.btnLDFPath.Text = "浏览";
            this.btnLDFPath.UseVisualStyleBackColor = true;
            this.btnLDFPath.Click += new System.EventHandler(this.btnLDFPath_Click);
            // 
            // btnMDFPath
            // 
            this.btnMDFPath.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnMDFPath.Location = new System.Drawing.Point(555, 18);
            this.btnMDFPath.Name = "btnMDFPath";
            this.btnMDFPath.Size = new System.Drawing.Size(55, 23);
            this.btnMDFPath.TabIndex = 7;
            this.btnMDFPath.Text = "浏览";
            this.btnMDFPath.UseVisualStyleBackColor = true;
            this.btnMDFPath.Click += new System.EventHandler(this.btnMDFPath_Click);
            // 
            // txtLDFPath
            // 
            this.txtLDFPath.Location = new System.Drawing.Point(88, 47);
            this.txtLDFPath.Name = "txtLDFPath";
            this.txtLDFPath.Size = new System.Drawing.Size(461, 21);
            this.txtLDFPath.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(17, 53);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(47, 12);
            this.label4.TabIndex = 5;
            this.label4.Text = "LDF路径";
            // 
            // txtMDFPath
            // 
            this.txtMDFPath.Location = new System.Drawing.Point(88, 20);
            this.txtMDFPath.Name = "txtMDFPath";
            this.txtMDFPath.Size = new System.Drawing.Size(461, 21);
            this.txtMDFPath.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(17, 23);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 12);
            this.label3.TabIndex = 3;
            this.label3.Text = "MDF路径";
            // 
            // btnattachDB
            // 
            this.btnattachDB.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnattachDB.Location = new System.Drawing.Point(616, 45);
            this.btnattachDB.Name = "btnattachDB";
            this.btnattachDB.Size = new System.Drawing.Size(101, 23);
            this.btnattachDB.TabIndex = 2;
            this.btnattachDB.Text = "附加数据库";
            this.btnattachDB.UseVisualStyleBackColor = true;
            this.btnattachDB.Click += new System.EventHandler(this.btnattachDB_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btnDetachDBPath);
            this.groupBox3.Controls.Add(this.txtDetachDB);
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Controls.Add(this.btnDetachDB);
            this.groupBox3.Location = new System.Drawing.Point(12, 268);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(760, 60);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "分离数据库";
            // 
            // btnDetachDBPath
            // 
            this.btnDetachDBPath.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnDetachDBPath.Location = new System.Drawing.Point(555, 18);
            this.btnDetachDBPath.Name = "btnDetachDBPath";
            this.btnDetachDBPath.Size = new System.Drawing.Size(55, 23);
            this.btnDetachDBPath.TabIndex = 9;
            this.btnDetachDBPath.Text = "浏览";
            this.btnDetachDBPath.UseVisualStyleBackColor = true;
            this.btnDetachDBPath.Click += new System.EventHandler(this.btnDetachDBPath_Click);
            // 
            // txtDetachDB
            // 
            this.txtDetachDB.Location = new System.Drawing.Point(88, 20);
            this.txtDetachDB.Name = "txtDetachDB";
            this.txtDetachDB.Size = new System.Drawing.Size(461, 21);
            this.txtDetachDB.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 12);
            this.label2.TabIndex = 5;
            this.label2.Text = "数据库对象";
            // 
            // btnDetachDB
            // 
            this.btnDetachDB.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnDetachDB.Location = new System.Drawing.Point(616, 18);
            this.btnDetachDB.Name = "btnDetachDB";
            this.btnDetachDB.Size = new System.Drawing.Size(101, 23);
            this.btnDetachDB.TabIndex = 2;
            this.btnDetachDB.Text = "分离数据库";
            this.btnDetachDB.UseVisualStyleBackColor = true;
            this.btnDetachDB.Click += new System.EventHandler(this.btnDetachDB_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btnBackupDBToPath);
            this.groupBox4.Controls.Add(this.txtBackupToPath);
            this.groupBox4.Controls.Add(this.label6);
            this.groupBox4.Controls.Add(this.btnBackupFromDB);
            this.groupBox4.Controls.Add(this.txtBackupFromDB);
            this.groupBox4.Controls.Add(this.label5);
            this.groupBox4.Controls.Add(this.btnBackupDB);
            this.groupBox4.Location = new System.Drawing.Point(12, 345);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(760, 85);
            this.groupBox4.TabIndex = 4;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "备份数据库";
            // 
            // btnBackupDBToPath
            // 
            this.btnBackupDBToPath.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBackupDBToPath.Location = new System.Drawing.Point(555, 51);
            this.btnBackupDBToPath.Name = "btnBackupDBToPath";
            this.btnBackupDBToPath.Size = new System.Drawing.Size(55, 23);
            this.btnBackupDBToPath.TabIndex = 12;
            this.btnBackupDBToPath.Text = "浏览";
            this.btnBackupDBToPath.UseVisualStyleBackColor = true;
            this.btnBackupDBToPath.Click += new System.EventHandler(this.btnBackupDBToPath_Click);
            // 
            // txtBackupToPath
            // 
            this.txtBackupToPath.Location = new System.Drawing.Point(88, 53);
            this.txtBackupToPath.Name = "txtBackupToPath";
            this.txtBackupToPath.Size = new System.Drawing.Size(461, 21);
            this.txtBackupToPath.TabIndex = 11;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(17, 56);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 12);
            this.label6.TabIndex = 10;
            this.label6.Text = "备份路径";
            // 
            // btnBackupFromDB
            // 
            this.btnBackupFromDB.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBackupFromDB.Location = new System.Drawing.Point(555, 18);
            this.btnBackupFromDB.Name = "btnBackupFromDB";
            this.btnBackupFromDB.Size = new System.Drawing.Size(55, 23);
            this.btnBackupFromDB.TabIndex = 9;
            this.btnBackupFromDB.Text = "浏览";
            this.btnBackupFromDB.UseVisualStyleBackColor = true;
            this.btnBackupFromDB.Click += new System.EventHandler(this.btnBackupFromDB_Click);
            // 
            // txtBackupFromDB
            // 
            this.txtBackupFromDB.Location = new System.Drawing.Point(88, 20);
            this.txtBackupFromDB.Name = "txtBackupFromDB";
            this.txtBackupFromDB.Size = new System.Drawing.Size(461, 21);
            this.txtBackupFromDB.TabIndex = 6;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(17, 23);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(65, 12);
            this.label5.TabIndex = 5;
            this.label5.Text = "数据库对象";
            // 
            // btnBackupDB
            // 
            this.btnBackupDB.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBackupDB.Location = new System.Drawing.Point(616, 51);
            this.btnBackupDB.Name = "btnBackupDB";
            this.btnBackupDB.Size = new System.Drawing.Size(101, 23);
            this.btnBackupDB.TabIndex = 2;
            this.btnBackupDB.Text = "备份数据库";
            this.btnBackupDB.UseVisualStyleBackColor = true;
            this.btnBackupDB.Click += new System.EventHandler(this.btnBackupDB_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.btnRestoreDBFrombak);
            this.groupBox5.Controls.Add(this.txtRestoreDBFrombak);
            this.groupBox5.Controls.Add(this.label7);
            this.groupBox5.Controls.Add(this.btnRestoreToDB);
            this.groupBox5.Controls.Add(this.txtRestoreToDB);
            this.groupBox5.Controls.Add(this.label8);
            this.groupBox5.Controls.Add(this.btnRestoreDB);
            this.groupBox5.Location = new System.Drawing.Point(12, 450);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(760, 82);
            this.groupBox5.TabIndex = 5;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "还原数据库";
            // 
            // btnRestoreDBFrombak
            // 
            this.btnRestoreDBFrombak.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRestoreDBFrombak.Location = new System.Drawing.Point(555, 45);
            this.btnRestoreDBFrombak.Name = "btnRestoreDBFrombak";
            this.btnRestoreDBFrombak.Size = new System.Drawing.Size(55, 23);
            this.btnRestoreDBFrombak.TabIndex = 12;
            this.btnRestoreDBFrombak.Text = "浏览";
            this.btnRestoreDBFrombak.UseVisualStyleBackColor = true;
            this.btnRestoreDBFrombak.Click += new System.EventHandler(this.btnRestoreDBFrombak_Click);
            // 
            // txtRestoreDBFrombak
            // 
            this.txtRestoreDBFrombak.Location = new System.Drawing.Point(88, 47);
            this.txtRestoreDBFrombak.Name = "txtRestoreDBFrombak";
            this.txtRestoreDBFrombak.Size = new System.Drawing.Size(461, 21);
            this.txtRestoreDBFrombak.TabIndex = 11;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(5, 50);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(77, 12);
            this.label7.TabIndex = 10;
            this.label7.Text = "备份文件路径";
            // 
            // btnRestoreToDB
            // 
            this.btnRestoreToDB.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRestoreToDB.Location = new System.Drawing.Point(555, 18);
            this.btnRestoreToDB.Name = "btnRestoreToDB";
            this.btnRestoreToDB.Size = new System.Drawing.Size(55, 23);
            this.btnRestoreToDB.TabIndex = 9;
            this.btnRestoreToDB.Text = "浏览";
            this.btnRestoreToDB.UseVisualStyleBackColor = true;
            this.btnRestoreToDB.Click += new System.EventHandler(this.btnRestoreToDB_Click);
            // 
            // txtRestoreToDB
            // 
            this.txtRestoreToDB.Location = new System.Drawing.Point(88, 20);
            this.txtRestoreToDB.Name = "txtRestoreToDB";
            this.txtRestoreToDB.Size = new System.Drawing.Size(461, 21);
            this.txtRestoreToDB.TabIndex = 6;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(17, 23);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(65, 12);
            this.label8.TabIndex = 5;
            this.label8.Text = "数据库对象";
            // 
            // btnRestoreDB
            // 
            this.btnRestoreDB.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRestoreDB.Location = new System.Drawing.Point(616, 45);
            this.btnRestoreDB.Name = "btnRestoreDB";
            this.btnRestoreDB.Size = new System.Drawing.Size(101, 23);
            this.btnRestoreDB.TabIndex = 2;
            this.btnRestoreDB.Text = "还原数据库";
            this.btnRestoreDB.UseVisualStyleBackColor = true;
            this.btnRestoreDB.Click += new System.EventHandler(this.btnRestoreDB_Click);
            // 
            // btnStop
            // 
            this.btnStop.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnStop.Location = new System.Drawing.Point(7, 20);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(101, 23);
            this.btnStop.TabIndex = 3;
            this.btnStop.Text = "停止";
            this.btnStop.UseVisualStyleBackColor = true;
            this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
            // 
            // btnStart
            // 
            this.btnStart.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnStart.Location = new System.Drawing.Point(114, 20);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(101, 23);
            this.btnStart.TabIndex = 9;
            this.btnStart.Text = "启动";
            this.btnStart.UseVisualStyleBackColor = true;
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // btnRestart
            // 
            this.btnRestart.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRestart.Location = new System.Drawing.Point(221, 20);
            this.btnRestart.Name = "btnRestart";
            this.btnRestart.Size = new System.Drawing.Size(101, 23);
            this.btnRestart.TabIndex = 10;
            this.btnRestart.Text = "重新启动";
            this.btnRestart.UseVisualStyleBackColor = true;
            this.btnRestart.Click += new System.EventHandler(this.btnRestart_Click);
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.btnStop);
            this.groupBox6.Controls.Add(this.btnRestart);
            this.groupBox6.Controls.Add(this.btnCheckExistMSSQL);
            this.groupBox6.Controls.Add(this.btnStart);
            this.groupBox6.Location = new System.Drawing.Point(12, 12);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(760, 57);
            this.groupBox6.TabIndex = 11;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "MSSQL服务状态";
            // 
            // FrmDBOperate
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(784, 562);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmDBOperate";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "数据库工具";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCheckExistMSSQL;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtDBConnectionString;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnOpenCofigFrm;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnattachDB;
        private System.Windows.Forms.Button btnLDFPath;
        private System.Windows.Forms.Button btnMDFPath;
        private System.Windows.Forms.TextBox txtLDFPath;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtMDFPath;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox txtDetachDB;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnDetachDB;
        private System.Windows.Forms.Button btnDetachDBPath;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Button btnBackupDBToPath;
        private System.Windows.Forms.TextBox txtBackupToPath;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnBackupFromDB;
        private System.Windows.Forms.TextBox txtBackupFromDB;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnBackupDB;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Button btnRestoreDBFrombak;
        private System.Windows.Forms.TextBox txtRestoreDBFrombak;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnRestoreToDB;
        private System.Windows.Forms.TextBox txtRestoreToDB;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button btnRestoreDB;
        private System.Windows.Forms.Button btnRestoreDBLdf;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.Button btnRestart;
        private System.Windows.Forms.GroupBox groupBox6;
    }
}

