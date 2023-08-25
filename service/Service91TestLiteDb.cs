using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Nodes;
using eCRF.module;

namespace eCRF.service
{
    public class Service91TestLiteDb
    {
        public CustomLiteDbClient? DbClient { get; set; }
        public CustomLibrary? Library { get; set; }
        public List<Dictionary<string, object>> Query(string query)
        {
            List<Dictionary<string, object>> listDicData = DbClient.Query(query);
            return listDicData;
        }
        public bool InsertJsonLiteDb(string path)
        {
            // DbClient.InsertJson("ecrf", path);
            DbClient.InsertJsonFile("ecrf", path);
            return true;
        }
        public bool InsertCsvLiteDb(string path)
        {
            DbClient.InsertCsv("ecrf", path);
            return true;
        }
    }
}
