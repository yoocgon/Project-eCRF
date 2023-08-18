using Serilog;
using KCureDataAccess;
using LiteDB;
using System.Collections.Generic;
using System.Collections;
using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Text;

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

        //
        //public List<Dictionary<string, object>> Query(string query)
        //{
        //    var database = new LiteDatabase(config.liteDbFilePath);
        //    var collection = database.GetCollection("ecrf");
        //    //
        //    List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
        //    var results = database.Execute(query).ToEnumerable()
        //        .SelectMany(x => ((Dictionary<string, BsonValue>)x.RawValue)
        //        .ToDictionary(y => y.Key, y => y.Value.RawValue.ToString()));
        //    //
        //    if (results == null)
        //        return null;
        //    //
        //    foreach (var result in results)
        //    {
        //        var dictionary = new Dictionary<string, object>();
        //        foreach (var item in result)
        //        {
        //            dictionary[item.Key] = item.Value;
        //        }
        //        listResult.Add(dictionary);
        //    }
        //    //
        //    return listResult;
        //}

        //public List<Dictionary<string, object>> Query(string query)
        //{
        //    using (var database = new LiteDatabase(config.liteDbFilePath))
        //    {
        //        var resultList = new List<Dictionary<string, object>>();
        //        using (var results = database.Execute(query))
        //        {
        //            if (results == null)
        //                return resultList;

        //            while (results.Read())
        //            {
        //                if (results.Current != null)
        //                {
        //                    var result = results.Current;
        //                    var dictionary = new Dictionary<string, object>();
        //                    if (result.IsDocument)
        //                    {
        //                        var document = result.AsDocument;
        //                        foreach (var item in document)
        //                        {
        //                            dictionary[item.Key] = item.Value.RawValue;
        //                        }
        //                    }
        //                    else if (result.IsArray)
        //                    {
        //                        var array = result.AsArray;
        //                        var list = new List<object>();
        //                        for (int i = 0; i < array.Count; i++)
        //                        {
        //                            list.Add(array[i].RawValue);
        //                        }

        //                        dictionary["Array"] = list;
        //                    }
        //                    else
        //                    {
        //                        dictionary["Value"] = result.RawValue;
        //                    }

        //                    resultList.Add(dictionary);
        //                }
        //            }
        //        }

        //        return resultList;
        //    }
        //}

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

        //public List<Dictionary<string, object>> Query(string query)
        //{
        //    //
        //    string strJson;
        //    Query(out strJson, query);
        //    //
        //    List<Dictionary<string, object>> listJsonElement = System.Text.Json.JsonSerializer.Deserialize<List<Dictionary<string, object>>>(strJson);
        //    return listJsonElement;
        //}

        //public bool Query(out string strJson, string query)
        //{
        //    strJson = string.Empty;
        //    using (var database = new LiteDatabase(config.liteDbFilePath))
        //    {
        //        var resultBuilder = new StringBuilder();
        //        using (var results = database.Execute(query))
        //        {
        //            if (results == null)
        //                return false;
        //            //
        //            while (results.Read())
        //            {
        //                if (results.Current != null)
        //                {
        //                    var bsonValue = results.Current;
        //                    var jsonString = bsonValue.ToString();
        //                    resultBuilder.Append(jsonString).AppendLine();
        //                }
        //            }
        //        }
        //        //
        //        strJson = resultBuilder.ToString();
        //        return true;
        //    }
        //}

        //public bool Query(out string strJson, string query)
        //{
        //    strJson = string.Empty;
        //    using (var database = new LiteDatabase(config.liteDbFilePath))
        //    {
        //        using (var results = database.Execute(query))
        //        {
        //            if (results == null)
        //                return false;
        //            //
        //            List<string> listStr = new List<string>();
        //            while (results.Read())
        //            {
        //                if (results.Current != null)
        //                {
        //                    var bsonValue = results.Current;
        //                    strJson = bsonValue.ToString();
        //                    listStr.Add(strJson);
        //                }
        //            }
        //            //
        //            if (listStr.Count > 1)
        //                strJson = $"[{string.Join(",", listStr.ToArray())}]";
        //        }
        //        //
        //        return true;
        //    }
        //}

        public bool Query(out string strJson, string query)
        {
            strJson = string.Empty;
            using (var database = new LiteDatabase(config.liteDbFilePath))
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


        public void Test()
        {
            using (var db = new LiteDatabase(config.liteDbFilePath))
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
