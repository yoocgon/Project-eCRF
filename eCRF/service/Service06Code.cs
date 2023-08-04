using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Threading.Tasks;
using eCRF.module;

namespace eCRF.service
{
    public class Service06Code
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }
        public List<Dictionary<string, object>> GetCodes(JsonObject objData)
        {
            if (objData == null)
                return null;
            //
            string schema = objData["schema"].GetValue<string>();
            Console.WriteLine("Debug>>> (schema) : " + schema);
            string table = objData["table"].GetValue<string>();
            Console.WriteLine("Debug>>> (table) : " + table);
            //
            string query = $"SELECT * FROM {schema}.{table}";
            List<Dictionary<string, object>> listDicData = DapperClient.Query(query);
            return listDicData;
        }
    }
}
