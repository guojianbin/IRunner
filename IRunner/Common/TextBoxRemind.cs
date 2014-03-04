using System;
using System.Data;
using System.Text;
using System.IO;
using System.Windows.Forms;

namespace IRunner
{
    public class TextBoxRemind
    {

        private string[] array = null;
        public void InitAutoCompleteCustomSource(TextBox textBox)
        {
            array = ReadTxt();
            if (array != null && array.Length > 0)
            {
                AutoCompleteStringCollection ACSC = new AutoCompleteStringCollection();

                for (int i = 0; i < array.Length; i++)
                {
                    ACSC.Add(array[i]);
                }

                textBox.AutoCompleteCustomSource = ACSC;
            }
        }

        string[] ReadTxt()
        {
            try
            {
                if (!File.Exists("Remind.txt"))
                {
                    FileStream fs =
                        File.Create("Remind.txt");
                    fs.Close();
                    fs = null;
                }

                return File.ReadAllLines("Remind.txt", Encoding.Default);
            }
            catch
            {
                return null;
            }
        }

        public void Remind(string str)
        {
            StreamWriter writer = null;
            try
            {
                if (array != null && !ContainsInArray(array, str))
                {
                    writer = new StreamWriter("Remind.txt", true, Encoding.Default);
                    writer.WriteLine(str);
                }
            }
            finally
            {
                if (writer != null)
                {
                    writer.Close();
                    writer = null;
                }
            }
        }

        private bool ContainsInArray(string[] arr, string sFinded)
        {
            if (arr != null && arr.Length > 0)
            {
                foreach (string item in arr)
                {
                    if (item == sFinded)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

    }
}
