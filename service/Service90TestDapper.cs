using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Nodes;
using eCRF.module;

namespace eCRF.service
{
    public class Service90TestDapper
    {
        public CustomDapperClient? DbClient { get; set; }
        public CustomLibrary? Library { get; set; }
        public List<Dictionary<string, object>> Query(string query)
        {
            return DbClient.Query(query);
        }
    }
}
