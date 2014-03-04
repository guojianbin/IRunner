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

        private int indexFindPlace = 0;		//�ı�����λ�ã�ȱʡΪ�ı����
        private void btnSearchContent_Click(object sender, EventArgs e)
        {
            if (txtSearchText.Text.Length > 0)	//���������ݲ�Ϊ��ʱ�����в���
            {
                IRunnerMain mainForm = this.Owner as IRunnerMain;
                if (mainForm == null)
                {
                    MessageBox.Show("�򿪲���ʧ��!","����", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                if (mainForm.txtHelp.Text.Length > 0)
                {
                    if ((indexFindPlace = mainForm.txtHelp.Text.IndexOf(txtSearchText.Text, indexFindPlace)) == -1)
                    {
                        MessageBox.Show("�Ѿ����ҵ�����ˣ�");
                        indexFindPlace = 0;	//û���ҵ������ò���λ��Ϊ�ı����
                    }
                    else
                    {	//ѡ���ҵ����ı���ʹ������
                        mainForm.txtHelp.Select(indexFindPlace, txtSearchText.Text.Length);
                        mainForm.txtHelp.SelectionStart = indexFindPlace;
                        mainForm.txtHelp.ScrollToCaret();//��������괦
                        //�ҵ��ˣ��ò���λ��Ϊ��һ��λ��
                        indexFindPlace = indexFindPlace + txtSearchText.Text.Length;
                        mainForm.Activate();
                    }
                }
            }
        }
    }
}