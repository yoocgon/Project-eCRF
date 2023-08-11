using System.Text.Json.Nodes;
using eCRF.module;
using KCureDataAccess;

namespace eCRF.service
{
    public class Service01Login
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }

        public string Login(JsonObject objData, ref Store store)
        {
            if (objData == null)
                return "로그인 실패";
            //
            string? id = objData["id"]?.GetValue<string>();
            string? password = objData["password"]?.GetValue<string>();
            //
            Console.WriteLine("Debug>>> (id) : " + id);
            Console.WriteLine("Debug>>> (password) : " + password);
            //
            if (id == null || password == null)
                return "로그인 실패";
            //
            store = new Store();
            store.id = id;
            //
            return "로그인 성공";
        }
    }
}
