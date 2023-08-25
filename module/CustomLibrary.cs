using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eCRF.module
{
    public class CustomLibrary
    {
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

        public Dictionary<string, object> GetFileInfo(string path)
        {
            Dictionary<string, object> dicFileInfo = new Dictionary<string, object>();
            FileInfo fileInfo = new FileInfo(path);
            //
            if (fileInfo.Exists)
            {
                dicFileInfo.Add("name", fileInfo.Name);
                dicFileInfo.Add("path", fileInfo.FullName);
                dicFileInfo.Add("exetension", fileInfo.Extension);
                dicFileInfo.Add("size", fileInfo.Length);
                dicFileInfo.Add("create", fileInfo.CreationTime);
                dicFileInfo.Add("modify", fileInfo.LastWriteTime);
            }
            //
            return dicFileInfo;
        }

        public List<string> GetFileList(string path)
        {
            List<string> csvFiles = new List<string>();
            string[] files = Directory.GetFiles(path);
            foreach (string file in files)
                if (Path.GetExtension(file).Equals(".csv", StringComparison.OrdinalIgnoreCase))
                    csvFiles.Add(file);
            //
            return csvFiles;
        }

        public string CamelToSnake(string camelCase)
        {
            return string.Concat(camelCase.Select((x, i) => i > 0 && char.IsUpper(x) ? "_" + x.ToString() : x.ToString())).ToLower();
        }

        public List<Dictionary<string, object>> SnakeKeyToCamelKey(List<Dictionary<string, object>> listDicData)
        {
            List<Dictionary<string, object>> listDicCamelKey = new List<Dictionary<string, object>>();
            //
            if (listDicData != null)
            {
                foreach (var dic in listDicData)
                {
                    var newDic = new Dictionary<string, object>();
                    foreach (var key in dic.Keys)
                    {
                        var newKey = string.Concat(key.Split('_').Select((x, i) => i > 0 ? char.ToUpper(x[0]) + x.Substring(1) : x));
                        newDic.Add(newKey, dic[key]);
                    }
                    // listDicData[listDicData.IndexOf(dic)] = newDic;
                    listDicCamelKey.Add(newDic);
                }
            }
            //
            return listDicCamelKey;
        }

        public string PrettifyJSON(string json)
        {
            string beautifiedJson = Newtonsoft.Json.JsonConvert.SerializeObject(
            Newtonsoft.Json.JsonConvert.DeserializeObject(json),
            Newtonsoft.Json.Formatting.Indented);

            return beautifiedJson;
        }
    }
}
