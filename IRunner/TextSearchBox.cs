using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace IRunner
{
    public partial class TextSearchBox : Form
    {
        public TextSearchBox()
        {
            InitializeComponent();
        }

        private void btnCancelSearch_Click(object sender, EventArgs e)
        {
            this.Hide();
            IRunnerMain mainForm = this.Owner as IRunnerMain;
            if (mainForm != null)
            {
                mainForm.Activate();
            }
        }

        private int indexFindPlace = 0;		//文本查找位置，缺省为文本起点
        private void btnSearchContent_Click(object sender, EventArgs e)
        {
            if (txtSearchText.Text.Length > 0)	//当查找内容不为空时，进行查找
            {
                IRunnerMain mainForm = this.Owner as IRunnerMain;
                if (mainForm == null)
                {
                    MessageBox.Show("打开查找失败!","错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                if (mainForm.txtHelp.Text.Length > 0)
                {
                    if ((indexFindPlace = mainForm.txtHelp.Text.IndexOf(txtSearchText.Text, indexFindPlace)) == -1)
                    {
                        MessageBox.Show("已经查找到最后了！");
                        indexFindPlace = 0;	//没有找到，重置查找位置为文本起点
                    }
                    else
                    {	//选中找到的文本，使其明显
                        mainForm.txtHelp.Select(indexFindPlace, txtSearchText.Text.Length);
                        mainForm.txtHelp.SelectionStart = indexFindPlace;
                        mainForm.txtHelp.ScrollToCaret();//滚动到光标处
                        //找到了，置查找位置为下一个位置
                        indexFindPlace = indexFindPlace + txtSearchText.Text.Length;
                        mainForm.Activate();
                    }
                }
            }
        }
    }
}