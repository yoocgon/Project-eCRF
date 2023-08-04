using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Nodes;
using System.Threading.Tasks;
using eCRF.module;

namespace eCRF.service
{
    public class Service05CsvViewer
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }

        public List<Dictionary<string, object>> GetCsvFileData(String filePath)
        {
            return null;
        }
    }
}
