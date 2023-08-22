
using System.Text.Json.Nodes;
using System.Text.Json;
using eCRF.service;
using eCRF.module;
using YamlDotNet;
using YamlDotNet.RepresentationModel;

namespace KCureDataAccess
{
    public class Controller
    {
        //
        Store store;
        //
        Observer observer;
        Config config;
        //
        CustomDapperClient dapperClient;
        // CustomPostgresClient postgresClient;
        CustomLiteDbClient liteDbClient;
        //
        CustomLibrary library;
        //
        Service01Login? service01Login;
        Service02Index? service02Index;
        Service03BreastCancer? service03BreastCancer;
        Service04StomachCancer? service04StomachCancer;
        Service05CsvViewer? service05CsvViewer;
        Service06Code? service06Code;
        Service07Column? service07Column;
        Service08Connection? service08Connection;
        Service90TestDapper? service90TestDapper;
        Service91TestLiteDb? service91TestLiteDb;

        public Controller(Observer observer, Config config)
        {
            this.observer = observer;
            this.observer.Add(this);
            //
            this.LoadApplicationConfig(config);
            //
            this.config = config;
            this.library = new CustomLibrary(); 
            //
            this.dapperClient = new CustomDapperClient(config);
            this.liteDbClient = new CustomLiteDbClient(config);
            //
            this.service01Login = new Service01Login();
            this.service01Login.Library = this.library;
            this.service01Login.DapperClient = this.dapperClient;
            //
            this.service02Index = new Service02Index();
            this.service02Index.Library = this.library;
            this.service02Index.DapperClient = this.dapperClient;
            //
            this.service03BreastCancer = new Service03BreastCancer();
            this.service03BreastCancer.Library = this.library;
            this.service03BreastCancer.DapperClient = this.dapperClient;
            //
            this.service04StomachCancer = new Service04StomachCancer();
            this.service04StomachCancer.Library = this.library;
            this.service04StomachCancer.DapperClient = this.dapperClient;
            //
            this.service05CsvViewer = new Service05CsvViewer();
            this.service05CsvViewer.Library = this.library;
            this.service05CsvViewer.DapperClient = this.dapperClient;
            //
            this.service06Code = new Service06Code();
            this.service06Code.Library = this.library;
            this.service06Code.DapperClient = this.dapperClient;
            //
            this.service07Column = new Service07Column();
            this.service07Column.Library = this.library;
            this.service07Column.DapperClient = this.dapperClient;
            //
            this.service08Connection = new Service08Connection();
            this.service08Connection.Library = this.library;
            this.service08Connection.LiteDbClient = this.liteDbClient;
            //
            this.service90TestDapper = new Service90TestDapper();
            this.service90TestDapper.Library = this.library;
            this.service90TestDapper.DbClient = this.dapperClient;
            //
            this.service91TestLiteDb = new Service91TestLiteDb();
            this.service91TestLiteDb.Library = this.library;
            this.service91TestLiteDb.DbClient = this.liteDbClient;
        }

        public void Parse(string strJson)
        {
            var objJson = JsonSerializer.Deserialize<JsonObject>(strJson);
            if (objJson == null)
                return;
            //
            string? phase = objJson["phase"]?.GetValue<string>();
            string? type = objJson["type"]?.GetValue<string>();
            string? action = objJson["action"]?.GetValue<string>();
            string? message = objJson["message"]?.GetValue<string>();
            //
            Console.WriteLine("Debug>>> FromMain Parse");
            Console.WriteLine("Debug>>> (type) : " + type);
            Console.WriteLine("Debug>>> (action) : " + action);
            Console.WriteLine("Debug>>> (message) : " + message);
            //
            if (phase != "request")
                return;
            //
            if (type == "page")
            {
                observer.Send("response", "page", action, "", null);
            }
            else if (type == "gui")
            {
                if (action == "fileBrowser")
                {
                    string path = library.ShowFileBrowser();
                    observer.Send("response", "gui", action, path, null);
                }
                else if (action == "folderBrowser")
                {
                    string path = library.ShowForderBrowser();
                    observer.Send("response", "gui", action, path, null);
                }
            }
            else if (type == "litedb")
            {
                if (action == "insert-csv")
                {
                    if(service08Connection.InsertCsvLiteDb(message))
                        observer.Send("response", "gui", action, "success", null);
                }
                else if (action == "file-csv")
                {
                    if (service91TestLiteDb.InsertCsvLiteDb(message))
                        observer.Send("response", "gui", action, "success", null);
                }
                else if (action == "file-json")
                {
                    if (service91TestLiteDb.InsertJsonLiteDb(message))
                        observer.Send("response", "gui", action, "success", null);
                }
            }
            else if (type == "api")
            {
                if (action == "login")
                {
                    service01Login.Login((JsonObject)objJson["data"], ref store);
                    observer.Send("response", "page", "02-index", "", null);
                }
                else if (action == "hello")
                {
                    // observer.Send("response", "api", "hello", store.id, null);
                }
                else if (action == "files")
                {
                    List<string> listFiles = library.GetFileList(message);
                    observer.Send("response", type, action, message, listFiles);
                }
                if (action == "matching-csv")
                {
                    List<Dictionary<string, object>>? listDicData = service08Connection.GetCsvMatchingKey();
                    observer.Send("response", type, action, message, listDicData);
                }
                else if (action == "table")
                {
                    if (message == "patient")
                    {
                        List<Dictionary<string, object>>? listDicData = service03BreastCancer.GetPatients((JsonObject)objJson["data"]);
                        observer.Send("response", "api", "table", "patient", listDicData);
                    }
                    else if (message == "detail")
                    {
                        List<Dictionary<string, object>>? listDicData = service04StomachCancer.GetPatients((JsonObject)objJson["data"]);
                        observer.Send("response", "api", "table", "detail", listDicData);
                    }
                    else if (message == "code")
                    {
                        List<Dictionary<string, object>>? listDicData = service06Code.GetCodes((JsonObject)objJson["data"]);
                        observer.Send("response", "api", "table", "code", listDicData);
                    }
                    else if (message == "column")
                    {
                        List<Dictionary<string, object>>? listDicData = service07Column.GetColumns((JsonObject)objJson["data"]);
                        observer.Send("response", "api", "table", "column", listDicData);
                    }
                }
                ////
                //else if (action == "test-11")
                //{
                //    List<Dictionary<string, object>>? listDicData = service11Test.GetUsers();
                //    observer.Send("response", "api", "test-11", "", listDicData);
                //}
                //else if (action == "test-12")
                //{
                //    List<Dictionary<string, object>>? listDicData = service12Test.GetUsers((JsonObject)objJson["data"], store);
                //    observer.Send("response", "api", "test-12", "", listDicData);
                //}
                //else if (action == "test-13")
                //{
                //    List<Dictionary<string, object>>? listDicData = service13Test.GetInfoTable((JsonObject)objJson["data"]);
                //    observer.Send("response", "api", "test-13", "", listDicData);
                //}
            }
            else if (type == "test")
            {
                List<Dictionary<string, object>>? listDicData = null;
                if (action == "dapper")
                {
                    listDicData = service90TestDapper.Query(message);
                }
                else if (action == "litedb")
                {
                    listDicData = service91TestLiteDb.Query(message);
                }
                //
                observer.Send("response", type, action, message, listDicData);
            }
        }

        public void Listener(string phase, string type, string action, string message, dynamic data)
        {
            Console.WriteLine("\nDebug>>> Controller Listener");
            Console.WriteLine("(phase) " + phase);
            Console.WriteLine("(type) " + type);
            Console.WriteLine("(action) " + action);
            Console.WriteLine("(message) " + message);
        }

        public void LoadApplicationConfig(Config config)
        {
            string yamlContents = File.ReadAllText(config.App);
            var input = new StringReader(yamlContents);
            var yamlStream = new YamlStream();
            yamlStream.Load(input);
            var rootNode = (YamlMappingNode)yamlStream.Documents[0].RootNode;
            Dictionary<string, object> yamlDict = new Dictionary<string, object>();
            foreach (var entry in rootNode.Children)
            {
                var key = ((YamlScalarNode)entry.Key).Value;
                if (entry.Value is YamlMappingNode nestedNode)
                {
                    var nestedDict = new Dictionary<string, string>();
                    foreach (var nestedEntry in nestedNode.Children)
                    {
                        var nestedKey = ((YamlScalarNode)nestedEntry.Key).Value;
                        var nestedValue = ((YamlScalarNode)nestedEntry.Value).Value;
                        nestedDict[nestedKey] = nestedValue;
                    }
                    yamlDict[key] = nestedDict;
                }
                else
                {
                    var value = ((YamlScalarNode)entry.Value).Value;
                    yamlDict[key] = value;
                }
            }

            foreach (var kvp in yamlDict)
            {
                if (kvp.Value is Dictionary<string, string> nestedDict)
                {
                    Console.WriteLine($"{kvp.Key}:");
                    foreach (var nestedKvp in nestedDict)
                    {
                        Console.WriteLine($"  {nestedKvp.Key}: {nestedKvp.Value}");
                    }
                }
                else
                {
                    Console.WriteLine($"{kvp.Key}: {kvp.Value}");
                }
            }
        }

    }
}
