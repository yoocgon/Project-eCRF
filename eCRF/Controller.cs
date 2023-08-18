
using System.Text.Json.Nodes;
using System.Text.Json;
using eCRF.service;
using eCRF.module;

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
        Service90TestDapper? service90TestDapper;
        Service91TestLiteDb? service91TestLiteDb;

        public Controller(Observer observer, Config config)
        {
            this.observer = observer;
            this.observer.Add(this);
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
    }
}
