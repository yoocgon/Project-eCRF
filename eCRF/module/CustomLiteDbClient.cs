using Serilog;
using KCureDataAccess;
using LiteDB;
using System.Text.Json;
using CsvHelper.Configuration;
using CsvHelper;
using System.Globalization;
using Dapper;
using System.Security.Cryptography;
using System.Text.Json.Nodes;

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

        // 쿼리하면 JSON 문자열을 List Dictionary 형태로 반환
        public List<Dictionary<string, object>> Query(string query)
        {
            //
            List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
            string strJson;
            if (Query(out strJson, query))
            {
                listResult = GetJonDictionary(strJson);
                return listResult;
            }
            //
            return listResult;
        }

        // 쿼리의 결과로 JSON 문자열 반환
        // 결과에서 _id 제거함 
        private bool Query(out string strJson, string query)
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

        //
        private List<Dictionary<string, object>> GetJonDictionary(string strJson)
        {
            //
            List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
            //
            List<Dictionary<string, object>> listDicJsonElement = System.Text.Json.JsonSerializer.Deserialize<List<Dictionary<string, object>>>(strJson);
            foreach (var listElem in listDicJsonElement)
            {
                Dictionary<string, object> dicResult = new Dictionary<string, object>();
                foreach (var dicElem in listElem)
                {
                    string key = dicElem.Key;
                    JsonElement property = (JsonElement) dicElem.Value;
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
                        case JsonValueKind.Array:
                            //
                            string strAryJson = property.ToString();
                            List<object> listJson;
                            SetList(out listJson, strAryJson);
                            dicResult.Add(key, listJson);
                            break;
                        //
                        case JsonValueKind.Object:
                            //
                            string strSubJson = property.ToString();
                            List<Dictionary<string, object>> listDicSubJson = GetJonDictionary(strSubJson);
                            dicResult.Add(key, listDicSubJson);
                            break;
                        //
                        default:
                            //
                            MessageBox.Show("Debug>>> failed to matching type");
                            break;
                    }
                }
                listResult.Add(dicResult);
            }
            //
            return listResult;
        }

        //
        public bool SetList(out List<object> listJson, string strJson)
        {
            listJson = new List<object>();
            //
            List<object> listJsonElement = System.Text.Json.JsonSerializer.Deserialize<List<object>>(strJson);
            foreach (JsonElement jsonElement in listJsonElement)
            {
                switch (jsonElement.ValueKind)
                {
                    case JsonValueKind.String:
                        listJson.Add(jsonElement.GetString());
                        break;
                    case JsonValueKind.Number:
                        if (jsonElement.TryGetInt32(out int intValue))
                            listJson.Add(intValue);
                        else if (jsonElement.TryGetInt64(out long longValue))
                            listJson.Add(longValue);
                        else if (jsonElement.TryGetDouble(out double doubleValue))
                            listJson.Add(doubleValue);
                        break;
                    case JsonValueKind.True:
                        listJson.Add(jsonElement.GetBoolean());
                        break;
                    case JsonValueKind.False:
                        listJson.Add(jsonElement.GetBoolean());
                        break;
                    default:
                        MessageBox.Show("Debug>>> failed to matching type");
                        return false;
                }
            }
            //
            return true;
        }

        public bool InsertCsv(string strCollection, string path)
        {
            using (var database = new LiteDatabase(config.LiteDbFilePath))
            {
                var collection = database.GetCollection(strCollection);
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

        private List<Dictionary<string, object>> ReadCsv(string path)
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
                        object value = null;
                        if (int.TryParse(csv.GetField(header), out int intValue))
                        {
                            value = intValue;
                        }
                        else if (double.TryParse(csv.GetField(header), out double doubleValue))
                        {
                            value = doubleValue;
                        }
                        else
                        {
                            value = csv.GetField<string>(header);
                        }
                        //
                        record.Add(header, value);
                    }
                    //
                    records.Add(record);
                }
            }
            //
            return records;
        }

        // JSON 가장 바깥이 Array 형태 []로 감싸져여 가능
        public bool InsertJsonFile(string strCollection, string pathJson)
        {
            //.
            string query = $"SELECT $ INTO {strCollection} FROM $file('{pathJson}');";
            //
            string strJson = string.Empty;
            using (var database = new LiteDatabase(config.LiteDbFilePath))
            {
                using (var results = database.Execute(query))
                {
                    if (results == null)
                        return false;
                    //
                    while (results.Read())
                    {
                        if (results.Current != null)
                        {
                            var bsonValue = results.Current;
                            strJson = bsonValue.ToString();
                        }
                    }
                }
            }
            //
            return true;
        }

        // Deprecated
        // 파일을 직접 읽어, JSON 문자열을 사용하여 BsonDocument 캐스팅 후, INSERT
        public bool InsertJson(string strCollection, string pathJson)
        {
            //
            string strJson = string.Empty;
            using (var db = new LiteDatabase(config.LiteDbFilePath))
            {
                var collection = db.GetCollection<BsonDocument>(strCollection);
                string jsonContent = File.ReadAllText(pathJson);
                //
                System.Text.Json.Nodes.JsonNode jsonNode = System.Text.Json.Nodes.JsonNode.Parse(jsonContent);
                if (jsonNode is System.Text.Json.Nodes.JsonArray jsonArray)
                {
                    foreach (System.Text.Json.Nodes.JsonNode jNode in jsonArray)
                    {
                        //
                        string jsonSubString = jNode.ToString();
                        Dictionary<string, JsonElement> dicJsonElement
                            = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, JsonElement>>(jsonSubString);
                        //
                        BsonDocument bsonDoc = new BsonDocument();
                        foreach (var jsonPare in dicJsonElement)
                        {
                            bsonDoc[jsonPare.Key] = new BsonValue(jsonPare.Value.ToString());
                        }
                        collection.Insert(bsonDoc);
                    }
                }
                else
                {
                    //
                    Dictionary<string, JsonElement> dicJsonElement
                        = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, JsonElement>>(jsonContent);
                    //
                    BsonDocument bsonDoc = new BsonDocument();
                    foreach (var jsonPare in dicJsonElement)
                    {
                        bsonDoc[jsonPare.Key] = new BsonValue(jsonPare.Value.ToString());
                    }
                    collection.Insert(bsonDoc);
                }
            }
            //
            return true;
        }

        public void InsertTestData(string strCollection)
        {
            using (var db = new LiteDatabase(config.LiteDbFilePath))
            {
                var collection = db.GetCollection<BsonDocument>(strCollection);
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
