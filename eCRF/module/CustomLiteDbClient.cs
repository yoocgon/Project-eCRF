using Serilog;
using KCureDataAccess;
using LiteDB;
using System.Collections.Generic;
using System.Collections;
using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Text;
using CsvHelper.Configuration;
using CsvHelper;
using System.Globalization;
using Renci.SshNet.Common;

namespace eCRF.module
{
    public class CustomLiteDbClient
    {
        private Config config;

        public CustomLiteDbClient(Config config)
        {
            this.config = config;
            //
            Log.Logger = new LoggerConfiguration()
             .WriteTo.Console()
             .CreateLogger();
        }

        public List<Dictionary<string, object>> Query(string query)
        {
            //
            string strJson;
            Query(out strJson, query);
            //
            List<Dictionary<string, object>> listDicJsonElement = System.Text.Json.JsonSerializer.Deserialize<List<Dictionary<string, object>>>(strJson);
            //
            List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
            foreach (var listElem in  listDicJsonElement)
            {
                Dictionary<string, object> dicResult = new Dictionary<string, object>();
                foreach (var dicElem in listElem)
                {
                    string key = dicElem.Key;
                    JsonElement property = (JsonElement)dicElem.Value;
                    switch (property.ValueKind)
                    {
                        //
                        case JsonValueKind.String:
                            //
                            dicResult.Add(key, property.GetString());
                            break;
                        //
                        case JsonValueKind.Number:
                            //
                            if (property.TryGetInt32(out int intValue))
                                dicResult.Add(key, property.GetInt32());
                            else if (property.TryGetInt64(out long longValue))
                                dicResult.Add(key, property.GetInt64());
                            else if (property.TryGetDouble(out double doubleValue))
                                dicResult.Add(key, property.GetDouble());
                            //
                            break;
                        //
                        case JsonValueKind.True:
                            //
                            dicResult.Add(key, property.GetBoolean());
                            break;
                        //
                        case JsonValueKind.False:
                            //
                            dicResult.Add(key, property.GetBoolean());
                            break;
                        //
                        default:
                            MessageBox.Show("Debug>>> failed to matching type");
                            break;
                    }
                }
                listResult.Add(dicResult);
            }
            //
            return listResult;
        }


        public bool Query(out string strJson, string query)
        {
            strJson = string.Empty;
            using (var database = new LiteDatabase(config.LiteDbFilePath))
            {
                using (var results = database.Execute(query))
                {
                    if (results == null)
                        return false;
                    //
                    List<string> listStr = new List<string>();
                    while (results.Read())
                    {
                        if (results.Current != null)
                        {
                            var bsonValue = results.Current;
                            strJson = bsonValue.ToString();
                            strJson = strJson.Remove(1, 42);
                            listStr.Add(strJson);
                        }
                    }
                    //
                    if (listStr.Count > 1)
                        strJson = $"[{string.Join(",", listStr.ToArray())}]";
                }
                //
                return true;
            }
        }

        public List<Dictionary<string, object>> ReadCsv(string path)
        {
            List<Dictionary<string, object>> records = new List<Dictionary<string, object>>();
            using (var reader = new StreamReader(path))
            using (var csv = new CsvReader(reader, new CsvConfiguration(CultureInfo.InvariantCulture)))
            {
                csv.Read();
                csv.ReadHeader();
                while (csv.Read())
                {
                    var record = new Dictionary<string, object>();
                    foreach (var header in csv.HeaderRecord)
                    {
                        //record[header] = csv.GetField<object>(header);
                        var data = csv.GetField<dynamic>(header);
                        record.Add(header, (object) data);
                    }
                    //
                    records.Add(record);
                }
            }
            //
            return records;
        }


        public bool InsertCsv(string path)
        {
            using (var database = new LiteDatabase(config.LiteDbFilePath))
            {
                var collection = database.GetCollection("ecrf");
                //
                List<Dictionary<string, object>> records = ReadCsv(path);
                //
                foreach (var record in records)
                {
                    var bsonDocument = new BsonDocument();
                    foreach (var kvp in record)
                        bsonDocument.Add(kvp.Key, new BsonValue(kvp.Value));
                    //
                    collection.Insert(bsonDocument);
                }
                //
                database.Dispose();
            }
            //
            return true;
        }


        public void Test()
        {
            using (var db = new LiteDatabase(config.LiteDbFilePath))
            {
                var collection = db.GetCollection<BsonDocument>("ecrf");
                var document = new BsonDocument
                {
                    { "Name", "John" },
                    { "Age", 30 },
                    { "Country", "USA" }
                };
                collection.Insert(document);
            }
        }
    }
}
