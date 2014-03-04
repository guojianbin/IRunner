using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
namespace DataBaseOperator
{
    /// <summary>
    /// ��Ϣ�Ի��������
    /// </summary>
    public class MessageDialog
    {
        public static DialogResult ShowErrorMsgBox(string error)
        {
            return MessageBox.Show(error, "����", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
        }

        public static DialogResult ShowInformationMsgBox(string information)
        {
            return MessageBox.Show(information, "��ʾ", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        public static DialogResult ShowQuestionMsgBox(string information)
        {
            return MessageBox.Show(information, "ȷ��", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
        }

    }
}
