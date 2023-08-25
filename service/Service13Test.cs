using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Nodes;
using System.Threading.Tasks;
using eCRF.module;
using KCureDataAccess;

namespace eCRF.service
{
    public class Service13Test
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }

        public List<Dictionary<string, object>> GetInfoTable(JsonObject objData)
        {
            if (objData == null)
                return null;
            //
            string? schema = objData["schema"]?.GetValue<string>();
            string? table = objData["table"]?.GetValue<string>();
            //
            Console.WriteLine("Debug>>> (schema) : " + schema);
            Console.WriteLine("Debug>>> (table) : " + table);
            //
            if (schema == null || table == null)
                return null;
            //
            List<Dictionary<string, object>>? listDicColumnInfo = DapperClient.GetPostgresTableColumnInfo(schema, table);
            DapperClient.SetColumnFilterValues(listDicColumnInfo, schema, table);
            return listDicColumnInfo;
        }
    }
}
