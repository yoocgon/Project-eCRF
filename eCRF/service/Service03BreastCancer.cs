using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Nodes;
using eCRF.module;

namespace eCRF.service
{
    public class Service03BreastCancer
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }
        public List<Dictionary<string, object>> GetFilterPatients(JsonObject objData)
        {
            if (objData == null)
                return null;
            //
            List<Dictionary<string, object>> listDicData = null;
            return listDicData;
        }
        public List<Dictionary<string, object>> GetPatients(JsonObject objData)
        {
            if (objData == null)
                return null;
            //
            string schema = objData["schema"].GetValue<string>();
            Console.WriteLine("Debug>>> (schema) : " + schema);
            string table = objData["table"].GetValue<string>();
            Console.WriteLine("Debug>>> (table) : " + table);
            int offset = objData["offset"].GetValue<int>();
            Console.WriteLine("Debug>>> (offset) : " + offset);
            int limit = objData["limit"].GetValue<int>();
            Console.WriteLine("Debug>>> (limit) : " + limit);
            string strFilter = objData["filter"].ToString();
            Console.WriteLine("Debug>>> (filter) : " + strFilter);
            //
            Dictionary<string, JsonElement> whereConditions = JsonSerializer.Deserialize<Dictionary<string, JsonElement>>(strFilter);
            List <Dictionary<string, object>> listDicData = DapperClient.Select(schema, table, offset, limit, whereConditions);
            // SetColumnSetting(ref listDicData);
            return listDicData;
        }
        public List<Dictionary<string, object>> GetFilterDetails(JsonObject objData)
        {
            if (objData == null)
                return null;
            //
            List<Dictionary<string, object>> listDicData = null;
            return listDicData;
        }
        public List<Dictionary<string, object>> GetDetails(JsonObject objData)
        {
            if (objData == null)
                return null;
            //
            string schema = objData["schema"].GetValue<string>();
            Console.WriteLine("Debug>>> (schema) : " + schema);
            string table = objData["table"].GetValue<string>();
            Console.WriteLine("Debug>>> (table) : " + table);
            int offset = objData["offset"].GetValue<int>();
            Console.WriteLine("Debug>>> (offset) : " + offset);
            int limit = objData["limit"].GetValue<int>();
            Console.WriteLine("Debug>>> (limit) : " + limit);
            string strFilter = objData["filter"].ToString();
            Console.WriteLine("Debug>>> (filter) : " + strFilter);
            //
            Dictionary<string, JsonElement> whereConditions = JsonSerializer.Deserialize<Dictionary<string, JsonElement>>(strFilter);
            List<Dictionary<string, object>> listDicData = DapperClient.Select(schema, table, offset, limit, whereConditions);
            // SetColumnSetting(ref listDicData);
            return listDicData;
        }
    }
}
