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
            // DbClient.Test();
            List<Dictionary<string, object>> listDicData = DbClient.Query(query);
            return listDicData;
        }
    }
}
