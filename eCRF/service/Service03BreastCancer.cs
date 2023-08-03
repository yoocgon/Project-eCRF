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
    public class Service03BreastCancer
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }
        public List<Dictionary<string, object>> GetPatients(JsonObject objData)
        {
            //schema: "public",
            //table: "tb_test",
            //offset: "0",
            //limit: "20",
            //filter: filter

            if (objData == null)
                return null;
            //
            string? schema = objData["schema"]?.GetValue<string>();
            string? table = objData["table"]?.GetValue<string>();
            string? strOffset = objData["offset"]?.GetValue<string>();
            string? strLimit = objData["limit"]?.GetValue<string>();
            //
            Console.WriteLine("Debug>>> (schema) : " + schema);
            Console.WriteLine("Debug>>> (table) : " + table);
            Console.WriteLine("Debug>>> (offset) : " + strOffset);
            Console.WriteLine("Debug>>> (limit) : " + strLimit);
            //
            int offset = 0;
            int.TryParse(strOffset, out offset);
            int limit = 0;
            int.TryParse(strLimit, out limit);
            //
            string strFilter = objData["filter"].ToString();
            Dictionary<string, JsonElement> whereConditions = JsonSerializer.Deserialize<Dictionary<string, JsonElement>>(strFilter);
            List <Dictionary<string, object>> listDicData = DapperClient.Select(schema, table, offset, limit, whereConditions);
            return listDicData;
        }
    }
}
