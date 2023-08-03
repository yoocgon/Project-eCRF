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
    public class Service01Login
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }

        public bool Login(JsonObject objData, ref Store store)
        {
            if (objData == null)
                return false;
            //
            string? id = objData["id"]?.GetValue<string>();
            string? password = objData["password"]?.GetValue<string>();
            //
            Console.WriteLine("Debug>>> (id) : " + id);
            Console.WriteLine("Debug>>> (password) : " + password);
            //
            if (id == null || password == null)
                return false;
            //
            store = new Store();
            store.id = id;
            //
            return true;
        }
    }
}
