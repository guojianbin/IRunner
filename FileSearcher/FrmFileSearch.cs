using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.IO;
using System.Diagnostics;
using IcePluginLibrary;
namespace FileSearcher
{
    public partial class FrmFileSearch : Form, IPlugin
    {

        #region Var
        private int ColIdIndex = 0;
        private int ColExtNameIndex = 1;
        private int ColPyIndex = 2;
        private int ColNameIndex = 3;
        private int ColFilePathIndex = 4;
        private DataSet dsSearchData = null;
        private ArrayList files = null;
        private ArrayList alFilters = null;
        private string sSearchText = string.Empty;
        public delegate void DelegateUpdateOperateState();
        #endregion

        #region Init Interface
        private Dictionary<string, EventHandler> _ChildNodes = new Dictionary<string, EventHandler>();

        public Dictionary<string, EventHandler> ChildNodes
        {
            get
            {
                return _ChildNodes;
            }
        }

        public void Run()
        {
            this.ShowDialog();
        }

        public PluginAttribute PluginInfo
        {
            get
            {
                AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());

                PluginAttribute objPluginInfo = new PluginAttribute();
                objPluginInfo.Name = "文件查找工具";
                objPluginInfo.Version = ass.AssemblyVersion;
                objPluginInfo.Developer = ass.AssemblyCopyright;
                objPluginInfo.Webpage = ass.AssemblyTitle;
                objPluginInfo.Description = ass.AssemblyDescription;
                objPluginInfo.LoadWhenStart = true;
                objPluginInfo.GUID = ass.AssemblyGUID.ToUpper();
                return objPluginInfo;
            }

        }

        private bool enable = true;
        public bool Enable
        {
            get { return enable; }
            set { enable = value; }

        }

        private string _FullName = "";
        public string FullName
        {
            get { return _FullName; }
            set { _FullName = value; }

        }
        private int _Index = 0;
        public int Index
        {
            get { return _Index; }
            set { _Index = value; }

        }
        #endregion

        public void ShowAbout(object sender, EventArgs e)
        {
            AssemblyHelper ass = new AssemblyHelper(System.Reflection.Assembly.GetExecutingAssembly());
            string strMessage = "名称：" + ass.AssemblyDescription + "\r\n";
            strMessage = strMessage + "版本：" + ass.AssemblyVersion + "\r\n"; ;
            strMessage = strMessage + "作者：" + ass.AssemblyCopyright + "";
            MessageBox.Show(strMessage, "关于...", MessageBoxButtons.OK);
        }

        public FrmFileSearch()
        {
            InitializeComponent();
            _ChildNodes.Add("关于...", new EventHandler(ShowAbout));
        }

        private void txtSearchBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                //
                SearchData();
            }
            else if (e.KeyCode == Keys.Down)
            {
                dgvShowResult.Focus();
            }
            else
            {
                ShortCutRun(e);
            }
        }

        private void SearchData()
        {
            try
            {
                sSearchText = txtSearchBox.Text.Trim();
                if (sSearchText.Length >= PubData.GV_MinInput)
                {
                    //dgvShowResult.DataSource = null;
                    dgvShowResult.Rows.Clear();
                    int i = 1;
                    DataTable dtSearchResult = TopSearch(dsSearchData.Tables[0], PubData.GV_ShowMaxRow, "Py like '%" + sSearchText + "%' or Name like '%" + sSearchText + "%'", "");//dsSearchData.Tables[0].Select("Py like '%" + txtSearchBox.Text.Trim() + "%' or Name like '%" + txtSearchBox.Text.Trim() + "%'");
                    Bitmap bm = null;
                    foreach (DataRow row in dtSearchResult.Rows)
                    {
                        if (row["Name"].ToString().Length > 0)
                        {
                            bm = FileIcon.ExtractAssociatedIcon(row["FilePath"].ToString()).ToBitmap();
                            dgvShowResult.Rows.Add(i++, bm, row["Py"].ToString(), row["Name"].ToString(), row["FilePath"].ToString());
                        }

                    }


                    //dgvShowResult.DataSource = dtSearchResult.DefaultView;
                    //dgvShowResult.Rows.Add(i++, global::IRunner.Properties.Resources.Baidu, "", "百度一下", "http://www.baidu.com/s?wd=" + sSearchText);
                    //dgvShowResult.Rows.Add(i++, global::IRunner.Properties.Resources.Google, "", "Google一下", "http://www.google.com.hk/search?q=" + sSearchText);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable TopSearch(DataTable dt, int top, string filterExpression, string sort)
        {
            if (dt == null)
            {
                throw new ArgumentNullException("dt数据源不能为null");
            }
            DataRow[] drArray = dt.Select(filterExpression, sort);
            top = Math.Min(top, drArray.Length);
            DataTable result = dt.Clone();
            result.BeginLoadData();
            for (int i = 0; i < top; i++)
            {
                result.ImportRow(drArray[i]);
            }
            result.EndLoadData();

            return result;
        }



        private void ShortCutRun(KeyEventArgs e)
        {
            if (e.Alt)
            {
                switch (e.KeyCode)
                {
                    case Keys.D1:
                    case Keys.NumPad1: ExecuteByNum(1);
                        break;
                    case Keys.D2:
                    case Keys.NumPad2: ExecuteByNum(2);
                        break;
                    case Keys.D3:
                    case Keys.NumPad3: ExecuteByNum(3);
                        break;
                    case Keys.D4:
                    case Keys.NumPad4: ExecuteByNum(4);
                        break;
                    case Keys.D5:
                    case Keys.NumPad5: ExecuteByNum(5);
                        break;
                    case Keys.D6:
                    case Keys.NumPad6: ExecuteByNum(6);
                        break;
                    case Keys.D7:
                    case Keys.NumPad7: ExecuteByNum(7);
                        break;
                    case Keys.D8:
                    case Keys.NumPad8: ExecuteByNum(8);
                        break;
                    case Keys.D9:
                    case Keys.NumPad9: ExecuteByNum(9);
                        break;
                    case Keys.B: Process ProcBaidu = new Process();
                        ProcBaidu.StartInfo.FileName = PubData.GV_DefaultBrowser;
                        ProcBaidu.StartInfo.Arguments = "http://www.baidu.com/s?wd=" + txtSearchBox.Text.Trim().Replace(" ", "");
                        ProcBaidu.Start();
                        break;
                    case Keys.G:
                        Process ProcGoogle = new Process();
                        ProcGoogle.StartInfo.FileName = PubData.GV_DefaultBrowser;
                        ProcGoogle.StartInfo.Arguments = "http://www.google.com.hk/search?q=" + txtSearchBox.Text.Trim().Replace(" ", "");
                        ProcGoogle.Start();
                        break;
                    case Keys.O: OpenFileDir();
                        break;
                    default:
                        break;
                }
            }
        }




        private void OpenFileDir()
        {

            if (dgvShowResult.CurrentRow != null)
            {
                string exePath = dgvShowResult.CurrentRow.Cells[ColFilePathIndex].Value.ToString();
                if (System.IO.File.Exists(exePath))
                {
                    FileInfo fi = new FileInfo(exePath);
                    System.Diagnostics.Process.Start(fi.DirectoryName);
                }
            }

        }

        /// <summary>
        /// 执行数字快捷键执行
        /// </summary>
        /// <param name="num"></param>
        private void ExecuteByNum(int num)
        {
            int index = num - 1;
            if (dgvShowResult.Rows.Count > index)
            {
                if (dgvShowResult.Rows[index] != null)
                {
                    string exePath = dgvShowResult.Rows[index].Cells[ColFilePathIndex].Value.ToString();
                    string exe = dgvShowResult.Rows[index].Cells[ColNameIndex].Value.ToString();
                    if (exe == "百度一下" || exe == "Google一下")
                    {
                        Process ProcGoogle = new Process();
                        ProcGoogle.StartInfo.FileName = PubData.GV_DefaultBrowser;
                        ProcGoogle.StartInfo.Arguments = exePath.Trim().Replace(" ", "");
                        ProcGoogle.Start();
                    }
                    else
                    {
                        System.Diagnostics.Process.Start(exePath);
                    }
                }
            }
        }

        private void dgvShowResult_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                dgvShowResult_CellDoubleClick(null, null);
            }
            else
            {
                ShortCutRun(e);
            }
        }

        private void dgvShowResult_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (!dgvShowResult.CurrentRow.IsNewRow)
            {
                string exePath = dgvShowResult.CurrentRow.Cells[ColFilePathIndex].Value.ToString();
                System.Diagnostics.Process.Start(exePath);
            }
        }

        private void miCreateIndexToFile_Click(object sender, EventArgs e)
        {
            if (alFilters == null)
            {
                alFilters = new ArrayList();
                alFilters.AddRange(PubData.GV_FilterString.Split(';'));
            }
            dsSearchData = null;
            tsslState.Text = "正在搜索文件......";

            bgwkCreateFileIndex.RunWorkerAsync();

        }

        private void bgwkCreateFileIndex_DoWork(object sender, System.ComponentModel.DoWorkEventArgs e)
        {
            System.ComponentModel.BackgroundWorker worker = sender as System.ComponentModel.BackgroundWorker;
            //2.在DoWork中调用自定义函数，并将引发DoWork事件的sender传递出去
            string path = string.Empty; //Environment.GetFolderPath(Environment.SpecialFolder.System);
            string DestDirInSearch = PubData.GV_SearchPath;
            string[] searchPaths = DestDirInSearch.Split('|');
            files = new ArrayList();
            foreach (string searchPath in searchPaths)
            {
                switch (searchPath)
                {
                    case "%System%": path = Environment.GetFolderPath(Environment.SpecialFolder.System);
                        break;
                    case "%Desktop%": path = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
                        break;
                    case "%StartMenu%": path = Environment.GetFolderPath(Environment.SpecialFolder.StartMenu);
                        break;
                    default: path = searchPath;
                        break;
                }
                if (path.Length > 0)
                {
                    files.AddRange(FileDirSearcher.TraversingAllFiles(path));
                }

                path = string.Empty;
            }
            //files = TraversingAllFiles(path);

            UpdateOperateState();

            insertData(worker, (FileInfo[])files.ToArray(typeof(FileInfo)));
            files = null;
        }

        private void bgwkCreateFileIndex_RunWorkerCompleted(object sender, System.ComponentModel.RunWorkerCompletedEventArgs e)
        {
            if (e.Error != null)
            {
                MessageBox.Show(e.Error.Message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (e.Cancelled)
            {
                MessageBox.Show("取消操作！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            else
            {
                //MessageBox.Show("操作成功！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tsslState.Text = "成功建立文件索引";
                GC.Collect();
            }

            tspbOperation.Value = 0;
            LoadSearchData();
        }

        private void bgwkCreateFileIndex_ProgressChanged(object sender, System.ComponentModel.ProgressChangedEventArgs e)
        {
            tspbOperation.Value = e.ProgressPercentage;
        }


        private void UpdateOperateState()
        {
            if (this.InvokeRequired)
            {
                this.BeginInvoke(new DelegateUpdateOperateState(UpdateOperateState));
            }
            else
            {
                tspbOperation.Maximum = files.Count;
                tsslState.Text = "搜索文件完成，准备建立索引......";
            }
        }

        private void LoadSearchData()
        {
            if (SQLiteHelper.ExistsDB() && SQLiteHelper.ExistsTable("IRunnerTable"))
            {
                dsSearchData = GetFileIndexData();
            }
        }



        private DataSet GetFileIndexData()
        {
            string sql = "SELECT DISTINCT Name, Py, FilePath FROM IRunnerTable";
            return SQLiteHelper.ExecuteDataset(sql, null);
        }

        private void FrmFileSearch_Load(object sender, EventArgs e)
        {
            if (dsSearchData == null)
            {
                LoadSearchData();
            }
            txtSearchBox.Focus();
        }


        //自定义函数 insertData()
        private void insertData(System.ComponentModel.BackgroundWorker worker, FileInfo[] files)
        {

            SQLiteHelper.DropTable("IRunnerTable");
            SQLiteHelper.CreateTable();
            string sql = "INSERT INTO IRunnerTable(Name,Py,FilePath) values('{0}','{1}','{2}')";
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            string fileName = string.Empty;
            int i = 0;
            foreach (FileInfo fi in files)
            {
                if (fi.Extension.Length > 0 && alFilters.Contains(fi.Extension.ToLower()))
                {
                    //SaveItemToXML(fi);
                    fileName = ConvertHelper.GetSafeSqlString(fi.Name.Split('.')[0], true);
                    al.Add(string.Format(sql, fileName, ConvertHelper.ToChineseFirstSpell(fileName), ConvertHelper.GetSafeSqlString(fi.FullName, true)));
                }

                //3.调用worker的ReportProgress函数，用来引发事件ProgressChanged
                worker.ReportProgress(i++, worker);
            }

            alFilters = null;

            SQLiteHelper.ExecuteSqlTran(al);
        }



        private void dgvShowResult_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            //e.CellStyle.WrapMode = DataGridViewTriState.True;
            //if (this.dgvShowResult.Columns[e.ColumnIndex].Name == "ExtName")
            //{

            //    if (e.Value != null)
            //    {
            //        e.Value = FileIcon.ExtractAssociatedIcon(e.Value.ToString()).ToBitmap(); ;
            //    }
            //}
        }

        private void dgvShowResult_SelectionChanged(object sender, EventArgs e)
        {
            tsslState.Text = dgvShowResult.CurrentRow.Cells[ColFilePathIndex].Value.ToString();
        }

        private void miClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }




    }
}