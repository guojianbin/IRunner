using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace JavaScriptBeautify
{
    public partial class FrmJSExecutor : Form
    {
        private ScriptEngine scriptEngine;

        public FrmJSExecutor()
        {
            
            InitializeComponent();

            this.scriptEngine = new ScriptEngine();
            this.scriptEngine.UseSafeSubset = true;
            this.scriptEngine.RunError += new RunErrorHandler(scriptEngine_RunError);
            this.scriptEngine.RunTimeout += new RunTimeoutHandler(scriptEngine_RunTimeout);

        }

        //������
        private void scriptEngine_RunError()
        {
            MessageBox.Show("RunErrorִ�нű�����!");
        }
        private void scriptEngine_RunTimeout()
        {
            MessageBox.Show("RunTimeoutִ�нű���ʱ����������!");
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            this.scriptEngine.Reset();
            this.scriptEngine.Language = (ScriptLanguage)Enum.Parse(typeof(ScriptLanguage), "JavaScript");//(ScriptLanguage)Enum.Parse(typeof(ScriptLanguage), this.comboBoxScript.SelectedItem.ToString());
            //this.scriptEngine.Timeout = (int)this.numericUpDownTimeout.Value;
            this.scriptEngine.AllowUI = true;//this.checkBoxAllowUI.Checked;
            if (this.rdbEval.Checked)//ִ��Eval����
            {
                this.txtResult.Text = this.scriptEngine.Eval(this.txtFuncName.Text + "(" + this.txtParams.Text + ")", this.txtCodeBody.Text).ToString();
            }
            else//ִ��Run����
            {
                string[] parameters = (string[])this.txtParams.Text.Split(',');
                object[] paramArray = new object[parameters.Length];
                if (parameters.Length > 0)
                {
                    for (int i = 0; i < parameters.Length; i++)
                        paramArray[i] = parameters[i];
                }
                
                this.txtResult.Text = this.scriptEngine.Run(this.txtFuncName.Text, paramArray, this.txtCodeBody.Text).ToString();
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }


    }
}