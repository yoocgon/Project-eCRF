using Microsoft.VisualBasic.ApplicationServices;
using Microsoft.VisualBasic.Devices;
using Microsoft.VisualBasic.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KCureDataAccess
{
    public class Config
    {
        public string App { get; set; }
        public string WebRoot { get; set; }
        public string DapperConnStr { get; set; }
        public string LiteDbFilePath { get; set; }
        public Config()
        {
            // VBox
            // webRoot = @"C:/Users/gony/Desktop/ECRF/ProjectDataAccess/KCureDataAccess/web/";
            // dapperConnStr = "Server=127.0.0.1;Port=5432;User Id=kcure;Password=kcure;Database=kcure;";

            // MSI
            // webRoot = @"D:/workspaces/vs/Project-eCRF/eCRF/web/";
            // dapperConnStr = "Server=127.0.0.1;Port=5432;User Id=gony;Password=asdf;Database=kcure;";

            // Gram
            // webRoot = @"C:/Users/User/Workspaces/visualStudio/ProjectDataAccess/KCureDataAccess/web/";
            // dapperConnStr = "Server=127.0.0.1;Port=5433;User Id=gony;Password=asdf;Database=kcure;";

            // Office
            App = @"C:/Users/kcure/Desktop/gony/workspace/visual-studio/Project-eCRF/eCRF/application.yml";
            WebRoot = @"C:/Users/kcure/Desktop/gony/workspace/visual-studio/Project-eCRF/eCRF/web/";
            DapperConnStr = "Server=127.0.0.1;Port=5432;User Id=postgres;Password=asdf;Database=kcure;";
            LiteDbFilePath = @"C:/Users/kcure/Desktop/gony/workspace/visual-studio/Project-eCRF/eCRF/lite.db";
        }
    }
}
