using System.Drawing;
using System.Windows.Forms;
namespace DataBaseOperator
{
    public class FileDialogHelper
    {
        #region Public Fields

        private const string ConfigFilter = "�����ļ�(*.cfg)|*.cfg|All File(*.*)|*.*";

        private const string ExcelFilter = "Excel(*.xls)|*.xls|All File(*.*)|*.*";

        private const string ImageFilter =
            "Image Files(*.BMP;*.bmp;*.JPG;*.jpg;*.GIF;*.gif;*.png)|(*.BMP;*.bmp;*.JPG;*.jpg;*.GIF;*.gif;*.png)|All File(*.*)|*.*";

        private const string HtmlFilter = "HTML files (*.html;*.htm)|*.html;*.htm|All files (*.*)|*.*";

        private const string AccessFilter = "Access(*.mdb)|*.mdb|All File(*.*)|*.*";

        private const string ZipFillter = "Zip(*.zip)|*.zip|All files (*.*)|*.*";

        private const string TxtFilter = "(*.txt)|*.txt|All files (*.*)|*.*";

        #endregion

        #region Construcor

        ///<summary>
        ///Initializes a new instance of the <see cref="MyFileDialogHelper"></see>
        ///  class.
        ///</summary>
        private FileDialogHelper()
        {
        }

        #endregion

        #region Txt��ضԻ���

        /// <summary>
        /// ��Txt�Ի���
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string OpenText()
        {
            return Open("�ı��ļ�ѡ��", TxtFilter);
        }

        /// <summary>
        /// ����Excel�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string SaveText()
        {
            return SaveText(string.Empty);
        }

        /// <summary>
        /// ����Excel�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string SaveText(string filename)
        {
            return Save("�����ı��ļ�", TxtFilter, filename);
        }

        /// <summary>
        /// ����Excel�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <param name="initialDirectory">Ŀ¼</param>
        /// <returns>����ֵ</returns>
        public static string SaveText(string filename, string initialDirectory)
        {
            return Save("�����ı��ļ�", TxtFilter, filename, initialDirectory);
        }

        #endregion

        #region Excel��ضԻ���

        /// <summary>
        /// ��Excel�Ի���
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string OpenExcel()
        {
            return Open("Excelѡ��", ExcelFilter);
        }

        /// <summary>
        /// ����Excel�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string SaveExcel()
        {
            return SaveExcel(string.Empty);
        }

        /// <summary>
        /// ����Excel�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string SaveExcel(string filename)
        {
            return Save("����Excel", ExcelFilter, filename);
        }

        /// <summary>
        /// ����Excel�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <param name="initialDirectory">Ŀ¼</param>
        /// <returns>����ֵ</returns>
        public static string SaveExcel(string filename, string initialDirectory)
        {
            return Save("����Excel", ExcelFilter, filename, initialDirectory);
        }

        #endregion

        #region HTML��ضԻ���

        /// <summary>
        /// ��Html�Ի���
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string OpenHtml()
        {
            return Open("Htmlѡ��", HtmlFilter);
        }

        /// <summary>
        /// ����Html�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string SaveHtml()
        {
            return SaveHtml(string.Empty);
        }

        /// <summary>
        /// ����Html�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string SaveHtml(string filename)
        {
            return Save("����Html", HtmlFilter, filename);
        }

        /// <summary>
        /// ����Html�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <param name="initialDirectory">Ŀ¼</param>
        /// <returns>����ֵ</returns>
        public static string SaveHtml(string filename, string initialDirectory)
        {
            return Save("����Html", HtmlFilter, filename, initialDirectory);
        }

        #endregion

        #region ѹ���ļ����

        /// <summary>
        /// Opens the Zip.
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string OpenZip()
        {
            return Open("ѹ���ļ�ѡ��", ZipFillter);
        }

        /// <summary>
        /// Opens the Zip.
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string OpenZip(string filename)
        {
            return Open("ѹ���ļ�ѡ��", ZipFillter, filename);
        }

        /// <summary>
        /// Save the Zip
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string SaveZip()
        {
            return SaveZip(string.Empty);
        }

        /// <summary>
        /// Save the Zip
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string SaveZip(string filename)
        {
            return Save("ѹ���ļ�����", ZipFillter, filename);
        }

        /// <summary>
        /// Save the Zip
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <param name="initialDirectory">Ŀ¼</param>
        /// <returns>����ֵ</returns>
        public static string SaveZip(string filename, string initialDirectory)
        {
            return Save("ѹ���ļ�����", ZipFillter, filename, initialDirectory);
        }

        #endregion

        #region ͼƬ���

        /// <summary>
        /// Opens the image.
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string OpenImage()
        {
            return Open("ͼƬѡ��", ImageFilter);
        }

        /// <summary>
        /// ����ͼƬ�Ի���,�����ر���ȫ·��
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string SaveImage()
        {
            return SaveImage(string.Empty);
        }

        /// <summary>
        /// ����ͼƬ�Ի�������Ĭ���ļ���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string SaveImage(string filename)
        {
            return Save("����ͼƬ", ImageFilter, filename);
        }

        /// <summary>
        /// ����ͼƬ�Ի�������Ĭ���ļ���,�����ر���ȫ·��
        /// </summary>
        /// <param name="filename">�ļ���</param>
        /// <param name="initialDirectory">Ŀ¼</param>
        /// <returns>����ֵ</returns>
        public static string SaveImage(string filename, string initialDirectory)
        {
            return Save("����ͼƬ", ImageFilter, filename, initialDirectory);
        }

        #endregion

        #region ���ݿⱸ�ݻ�ԭ

        /// <summary>
        /// �������ݿⱸ�ݶԻ���
        /// </summary>
        /// <returns>���ݿⱸ��·��</returns>
        public static string SaveAccessDb()
        {
            return Save("���ݿⱸ��", AccessFilter);
        }

        /// <summary>
        /// �������ݿⱸ�ݶԻ���
        /// </summary>
        /// <returns>���ݿⱸ��·��</returns>
        public static string SaveBakDb()
        {
            return Save("���ݿⱸ��", "�����ļ�(*.bak)|*.bak");
        }

        /// <summary>
        /// ���ݿ⻹ԭ�Ի���
        /// </summary>
        /// <param name="file">��ԭ�ļ�·��</param>
        /// <returns>���ݿ⻹ԭ·��</returns>
        public static string OpenBakDb(string file)
        {
            return Open("���ݿ⻹ԭ", "Access(*.bak)|*.bak", file);
        }

        /// <summary>
        /// ���ݿ⻹ԭ�Ի���
        /// </summary>
        /// <returns>���ݿ⻹ԭ·��</returns>
        public static string OpenAccessDb()
        {
            return Open("���ݿ⻹ԭ", AccessFilter);
        }

        #endregion

        #region �����ļ�

        /// <summary>
        /// ���������ļ����ݶԻ���
        /// </summary>
        /// <returns>�����ļ�����·��</returns>
        public static string SaveConfig()
        {
            return Save("�����ļ�����", ConfigFilter);
        }

        /// <summary>
        /// �����ļ���ԭ�Ի���
        /// </summary>
        /// <returns>�����ļ���ԭ·��</returns>
        public static string OpenConfig()
        {
            return Open("�����ļ���ԭ", ConfigFilter);
        }

        #endregion

        #region ͨ�ú���

        /// <summary>
        /// ���ļ���
        /// </summary>
        /// <returns>����ֵ</returns>
        public static string OpenDir()
        {
            return OpenDir(string.Empty);
        }

        /// <summary>
        /// ���ļ���
        /// </summary>
        /// <param name="selectedPath">·��</param>
        /// <returns>����ֵ</returns>
        public static string OpenDir(string selectedPath)
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            dialog.Description = "��ѡ��·��";
            dialog.SelectedPath = selectedPath;

            return dialog.ShowDialog() == DialogResult.OK ? dialog.SelectedPath : string.Empty;
        }

        /// <summary>
        /// Opens the specified title.
        /// </summary>
        /// <param name="title">The title.</param>
        /// <param name="filter">The filter.</param>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string Open(string title, string filter, string filename)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Filter = filter;
            dialog.Title = title;
            dialog.FileName = filename;
            dialog.RestoreDirectory = true;
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                return dialog.FileName;
            }
            return string.Empty;
        }

        /// <summary>
        /// Opens the specified title.
        /// </summary>
        /// <param name="title">The title.</param>
        /// <param name="filter">The filter.</param>
        /// <returns>����ֵ</returns>
        public static string Open(string title, string filter)
        {
            return Open(title, filter, string.Empty);
        }

        /// <summary>
        /// Saves the specified tile.
        /// </summary>
        /// <param name="title">title</param>
        /// <param name="filter">The filter.</param>
        /// <param name="filename">�ļ���</param>
        /// <returns>����ֵ</returns>
        public static string Save(string title, string filter, string filename)
        {
            return Save(title, filter, filename, "");
        }

        /// <summary>
        /// Saves the specified tile.
        /// </summary>
        /// <param name="title">title</param>
        /// <param name="filter">The filter.</param>
        /// <param name="filename">�ļ���</param>
        /// <param name="initialDirectory">Ŀ¼</param>
        /// <returns>����ֵ</returns>
        public static string Save(string title, string filter, string filename, string initialDirectory)
        {
            SaveFileDialog dialog = new SaveFileDialog();
            dialog.Filter = filter;
            dialog.Title = title;
            dialog.FileName = filename;
            dialog.RestoreDirectory = true;
            if (!string.IsNullOrEmpty(initialDirectory))
            {
                dialog.InitialDirectory = initialDirectory;
            }

            if (dialog.ShowDialog() == DialogResult.OK)
            {
                return dialog.FileName;
            }
            return string.Empty;
        }

        /// <summary>
        /// Saves the specified tile.
        /// </summary>
        /// <param name="title">title</param>
        /// <param name="filter">The filter.</param>
        /// <returns>����ֵ</returns>
        public static string Save(string title, string filter)
        {
            return Save(title, filter, string.Empty);
        }

        #endregion

        #region ��ȡ��ɫ�Ի������ɫ

        /// <summary>
        /// ��ȡ�Ի�����ɫ
        /// </summary>
        /// <returns>����ֵ</returns>
        public static Color PickColor()
        {
            Color result = SystemColors.Control;
            ColorDialog form = new ColorDialog();
            if (DialogResult.OK == form.ShowDialog())
            {
                result = form.Color;
            }
            return result;
        }

        /// <summary>
        /// ��ȡ�Ի�����ɫ
        /// </summary>
        /// <param name="color">��ɫֵ</param>
        /// <returns>����ֵ</returns>
        public static Color PickColor(Color color)
        {
            Color result = SystemColors.Control;
            ColorDialog form = new ColorDialog();
            form.Color = color;
            if (DialogResult.OK == form.ShowDialog())
            {
                result = form.Color;
            }
            return result;
        }

        #endregion

    }
}
