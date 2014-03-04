using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Xml;
namespace RViewer
{
    public partial class frmRviewMain : Form
    {
        public frmRviewMain()
        {
            InitializeComponent();
        }

        private void tsbClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tsbOpen_Click(object sender, EventArgs e)
        {
            OpenFileDialog openDialog = new OpenFileDialog();
            openDialog.Filter = "文本文件(*.txt)|*.txt|所有文件(*.*)|*.*";
            openDialog.Multiselect = true;
            if (openDialog.ShowDialog() == DialogResult.OK)
            {
                string[] files = openDialog.FileNames;
                TreeNode parNode = tvMenu.Nodes["RootNode"];
                foreach (string file in files)
                {
                    AddToTree(parNode, file);

                }

                if (PubData.DefaultReadChildDir == true)
                {
                    string currFile = openDialog.FileName;
                    string currDir = DirFile.GetLastDirectory(currFile);
                    string[] dirs = DirFile.GetDirectories(currDir);
                    foreach (string dir in dirs)
                    {
                         files = DirFile.GetFileNames(dir);
                        foreach (string file in files)
                        {
                            AddToTree(parNode, file);

                        }
                    }

                }

                parNode.ExpandAll();

            }
        }

        private void AddToTree(TreeNode parNode, string fileName)
        {
            TreeNode RootNode = tvMenu.Nodes["RootNode"];
            if (parNode == null)
            {
                parNode = RootNode;
            }
            TreeNode[] exsCount = parNode.Nodes.Find("trNode" + DirFile.GetFileNameNoExtension(fileName), false);
            if (exsCount.Length > 0)
            {
                return;
            }
            TreeNode childNode = new TreeNode();
            childNode.ImageKey = "Text.ico";
            string strTmp = DirFile.GetFileName(fileName);
            childNode.Text = strTmp;
            childNode.ToolTipText = fileName;
            strTmp = DirFile.GetFileNameNoExtension(fileName);
            childNode.Tag = strTmp;
            childNode.Name = "trNode" + strTmp;
            parNode.Nodes.Add(childNode);
        }

        private void tsbSave_Click(object sender, EventArgs e)
        {
            if (tvMenu.SelectedNode != null)
            {
                SaveToFile(tvMenu.SelectedNode.ToolTipText, tvMenu.SelectedNode);
                MessageBox.Show("保存成功","提示", MessageBoxButtons.OK,MessageBoxIcon.Asterisk);
            }
        }

        private void tvMenu_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            tvMenu.SelectedNode = e.Node;
            ReadToContent(tvMenu.SelectedNode.ToolTipText);

        }

        private void ReadToContent(string fileName)
        {
            if (!File.Exists(fileName))
            {
                rtxtContent.Clear();
                return;
            }

            FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);

            StreamReader sr = new StreamReader(fs, Encoding.GetEncoding(PubData.DefaulTextEncoding));
            sr.BaseStream.Seek(0, SeekOrigin.Begin);

            string str = "";
            StringBuilder sb = new StringBuilder();
            while ((str = sr.ReadLine()) != null)
            {
                sb.Append(str + System.Environment.NewLine);
            }
            rtxtContent.Clear();
            rtxtContent.Text = sb.ToString();
            sr.Close();
            fs.Close();


        }

        private void SaveToFile(string fileName, TreeNode currNode)
        {
            if (!File.Exists(fileName))
            {
                SaveFileDialog saveFileDialog1 = new SaveFileDialog();
                saveFileDialog1.Filter = "文本文件(*.txt)|*.txt|所有文件(*.*)|*.*";
                saveFileDialog1.Title = "保存数据...";
                saveFileDialog1.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
                saveFileDialog1.RestoreDirectory = true;
                saveFileDialog1.ShowHelp = true;

                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {

                    fileName = saveFileDialog1.FileName;//dest
                    currNode.ImageKey = "Text.ico";
                    string strTmp = DirFile.GetFileName(fileName);
                    currNode.Text = strTmp;
                    currNode.ToolTipText = fileName;
                    strTmp = DirFile.GetFileNameNoExtension(fileName);
                    currNode.Tag = strTmp;
                    currNode.Name = "trNode" + strTmp;
                }
            }

            StreamWriter sw = new StreamWriter(fileName,false,  Encoding.GetEncoding(PubData.DefaulTextEncoding));
            sw.WriteLine(rtxtContent.Text);
            sw.Close();

            
        }

        private void frmRviewMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (PubData.IsAutoSaveProject == true)
            {
                SaveItemToXML();
                return;
            }

            if (MessageBox.Show("是否确定保存项目?", "提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                SaveItemToXML();
            }
            
        }

        private void SaveItemToXML()
        {
            using (XmlHelper xml = new XmlHelper())
            {
                XmlNode parNode = xml.GetNode(@"/TextListItem");
                if (parNode == null)
                {
                    XmlNode node = xml.CreateElement("TextListItem");

                    xml.RootNode.AppendChild(node);
                    xml.Save();
                }

                foreach (TreeNode trNode in tvMenu.Nodes["RootNode"].Nodes)
                {
                    XmlNode existNode = xml.GetNode(@"/TextListItem/IceItem[@Path='" + trNode.ToolTipText + "']");
                    if (existNode == null)
                    {
                        XmlNode node = xml.CreateElement("IceItem");
                        node.InnerText = trNode.Tag.ToString();
                        Dictionary<string, string> keyValues = new Dictionary<string, string>();
                        keyValues.Add("Name", trNode.Name);
                        keyValues.Add("Path", trNode.ToolTipText);
                        keyValues.Add("NameWithE", trNode.Text);
                        keyValues.Add("Tag", trNode.Tag.ToString());
                        xml.SetAttribute(node, keyValues);

                        parNode.AppendChild(node);
                        xml.Save();

                    }
                }
            }
        }

        private void frmRviewMain_Load(object sender, EventArgs e)
        {
            //read config
            string FilePath = IniHelper.IniPath;
            if (!System.IO.File.Exists(FilePath))
            {
                return;
            }
            System.Text.StringBuilder temp = new System.Text.StringBuilder(1024);
            // section=配置节，key=键名，temp=上面，FilePath=路径
            string section = "文本编码格式";
            string key = "TextEncoding";
            PubData.DefaulTextEncoding = IniHelper.GetFromIniFile(section, key, FilePath);

            section = "循环读取目录";
            key = "AutoReadChildDir";
            PubData.DefaultReadChildDir = Convert.ToBoolean(IniHelper.GetFromIniFile(section, key, FilePath));

            section = "自动保存工程";
            key = "AutoClose";
            PubData.IsAutoSaveProject = Convert.ToBoolean(IniHelper.GetFromIniFile(section, key, FilePath));

            //read items from xml list
            using (XmlHelper xml = new XmlHelper())
            {
                XmlNode parNode = xml.GetNode(@"/TextListItem");
                if (parNode != null)
                {
                    TreeNode TParNode = tvMenu.Nodes["RootNode"];
                    foreach (XmlNode childNode in parNode.ChildNodes)
                    {
                        AddToTree(TParNode, childNode.Attributes["Path"].Value);
                    }
                    TParNode.ExpandAll();
                }
             
            }
        }

        private void tsbSetting_Click(object sender, EventArgs e)
        {
            frmSetting obfrmSet = new frmSetting();
            obfrmSet.ShowDialog();
        }

        private void tvMenu_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                String[] files = (String[])e.Data.GetData(DataFormats.FileDrop);
                TreeNode RootNode = tvMenu.Nodes["RootNode"];
                foreach (String srcFileName in files)
                {
                    if (System.IO.File.Exists(srcFileName))
                    {
                        AddToTree(RootNode, srcFileName);

                    }
                    if (System.IO.Directory.Exists(srcFileName))
                    {
                        string[] dfiles = DirFile.GetFileNames(srcFileName);
                        foreach (string file in dfiles)
                        {
                            AddToTree(RootNode, file);

                        }
                    }
                   
                  
                }
            }

        }

        private void tvMenu_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
                e.Effect = DragDropEffects.Link;
            else e.Effect = DragDropEffects.None;
        }

        private void tsmiDel_Click(object sender, EventArgs e)
        {
            if (tvMenu.SelectedNode != null && tvMenu.SelectedNode != tvMenu.Nodes["RootNode"])
            {
               
                using (XmlHelper xml = new XmlHelper())
                {
                    xml.RemoveNode(@"/TextListItem/IceItem[@Path='" + tvMenu.SelectedNode.ToolTipText + "']");
                    xml.Save();
                }
                tvMenu.Nodes.Remove(tvMenu.SelectedNode);
            }
        }

        private void tsmiExport_Click(object sender, EventArgs e)
        {
            if (tvMenu.SelectedNode != null && tvMenu.SelectedNode != tvMenu.Nodes["RootNode"])
            {
                SaveFileDialog saveFileDialog1 = new SaveFileDialog();   
                saveFileDialog1.Filter = "文本文件(*.txt)|*.txt|所有文件(*.*)|*.*";
                saveFileDialog1.Title = "导出数据...";
                saveFileDialog1.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory); 
                saveFileDialog1.RestoreDirectory = true;
                saveFileDialog1.ShowHelp = true;

                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {

                    string fileName = saveFileDialog1.FileName;//dest
                    string file = tvMenu.SelectedNode.ToolTipText;//src
                    System.IO.File.Copy(file, fileName, true);
                    MessageBox.Show("导出成功", "提示", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                }


            }
        }

        private void tsmiAdd_Click(object sender, EventArgs e)
        {
            if (tvMenu.SelectedNode != null )
            {
                TreeNode childNode = new TreeNode();
                childNode.ImageKey = tvMenu.SelectedNode.ImageKey;

                childNode.Text = "新建节点" + PubData.AutoInc;
                childNode.ToolTipText = "";
                childNode.Tag = "";
                childNode.Name = "新建节点" + PubData.AutoInc;

                tvMenu.SelectedNode.Nodes.Add(childNode);
                tvMenu.SelectedNode.ExpandAll();

                PubData.AutoInc = PubData.AutoInc + 1;
            }
        }

        private void tsmiRename_Click(object sender, EventArgs e)
        {
            if (tvMenu.SelectedNode != null && tvMenu.SelectedNode != tvMenu.Nodes["RootNode"])
            {
                tvMenu.SelectedNode.BeginEdit();
            }
        }


        /*
        private void treeView1_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Right)
            {

                this.treeView1.LabelEdit = true;//<span style="color: #FF0000;">此处需加上</span>
                e.Node.BeginEdit();
            }
        }
        string nodeTag = "";
        bool nodeChanged = false;

        private void treeView1_AfterLabelEdit(object sender, NodeLabelEditEventArgs e)
        {
            nodeTag = e.Node.Name.ToString();
            nodeChanged = true;
            e.Node.EndEdit(true);
            this.treeView1.LabelEdit = false;//<span style="color: #FF0000;">此处需加上</span>
        }

        private void treeView1_NodeMouseHover(object sender, TreeNodeMouseHoverEventArgs e)
        {
            if (nodeChanged == true)
            {
                //在这里保存数据到数据库

                MessageBox.Show(nodeTag);
                nodeChanged = false;
            }

        }


        // 2


        int nodeIndex = 0;
        bool nodeChanged = false;

        //右键点击，就进入修改状态
        private void treeView1_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                e.Node.BeginEdit();
            }
        }

        private void treeView1_AfterLabelEdit(object sender, NodeLabelEditEventArgs e)
        {
            nodeIndex = e.Node.Index;
            nodeChanged = true;

            e.Node.EndEdit(true);
        }

        private void treeView1_NodeMouseHover(object sender, TreeNodeMouseHoverEventArgs e)
        {
            if (nodeChanged == true)
            {
                //在这里保存数据到数据库
                MessageBox.Show(treeView1.Nodes[nodeIndex].Text);

                nodeChanged = false;
            }
        }
*/


    }
}