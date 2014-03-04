using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace IRunner
{
    public partial class FrmRunCmd : Form
    {
        private TextBoxRemind remind = null;
        public delegate void RunCmdTextDelegate(string cmdText);
        public event RunCmdTextDelegate RunCmdTextEvent;

        void InitTextBoxRemind()
        {
            remind.InitAutoCompleteCustomSource(txtRunCmd);
        }

        public FrmRunCmd()
        {
            InitializeComponent();
        }

        private void btnRunCmd_Click(object sender, EventArgs e)
        {
            if (remind != null)
            {
                remind.Remind(txtRunCmd.Text.Trim());
                InitTextBoxRemind();
                if (RunCmdTextEvent != null)
                {
                    RunCmdTextEvent(txtRunCmd.Text.Trim());
                }
                this.Close();
            }
        }

        private void FrmRunCmd_Load(object sender, EventArgs e)
        {
            remind = new TextBoxRemind();
            InitTextBoxRemind();
        }

        private void FrmRunCmd_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            IRunnerMain mainForm = this.Owner as IRunnerMain;
            if (mainForm != null)
            {
                mainForm.Activate();
                e.Cancel = true;
            }
        }

        private void btnCloseRun_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void FrmRunCmd_Activated(object sender, EventArgs e)
        {
            int x;
            int y;
            IRunnerMain parForm = (IRunnerMain)this.Owner;
            x = parForm.Left + 20;
            y = parForm.Top + parForm.Height - this.Height - 35;
            this.Location = new Point(x, y);

            txtRunCmd.Focus();
            txtRunCmd.SelectAll();

        }
    }
}