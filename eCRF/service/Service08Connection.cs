using eCRF.module;

namespace eCRF.service
{
    public class Service08Connection
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLiteDbClient? LiteDbClient { get; set; }
        public CustomLibrary? Library { get; set; }

        public string ShowFileBrowser()
        {
            OpenFileDialog fileBrowserDialog = new OpenFileDialog();
            if (fileBrowserDialog.ShowDialog() == DialogResult.OK)
                return fileBrowserDialog.FileName;
            //
            return "";
        }
        public string ShowForderBrowser()
        {
            FolderBrowserDialog folderBrowserDialog = new FolderBrowserDialog();
            if (folderBrowserDialog.ShowDialog() == DialogResult.OK)
                return folderBrowserDialog.SelectedPath;
            //
            return "";
        }

        public bool InsertCsvLiteDb(string path)
        {
            LiteDbClient.InsertCsv(path);
            return true;
        }

    }
}
