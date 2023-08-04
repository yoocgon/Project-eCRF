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
    public class Service11Test
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLibrary? Library { get; set; }
        public List<Dictionary<string, object>> GetUsers()
        {
            //
            List<Dictionary<string, object>> listDicData = new List<Dictionary<string, object>>();
            //
            Dictionary<string, object> dicData1 = new Dictionary<string, object>();
            dicData1.Add("id", "1");
            dicData1.Add("researchSubject", "개발 테스트 연구");
            dicData1.Add("department", "데이터스트림즈");
            dicData1.Add("researcher", "유창곤");
            dicData1.Add("applyStep", "1단계?");
            dicData1.Add("applyStatus", "심사중");
            dicData1.Add("importedDataExists", "Y");
            dicData1.Add("dataExportRequestExists", "Y");
            dicData1.Add("dataExportApprovalExistence", "Y");
            dicData1.Add("dataUtilizationStartDate", "2023-06-01 00:00:00");
            dicData1.Add("dataUtilizationEndDate", "2023-06-01 00:00:00");
            listDicData.Add(dicData1);
            //
            Dictionary<string, object> dicData2 = new Dictionary<string, object>();
            dicData2.Add("id", "2");
            dicData2.Add("researchSubject", "개발 테스트 연구");
            dicData2.Add("department", "데이터스트림즈");
            dicData2.Add("researcher", "유창곤");
            dicData2.Add("applyStep", "1단계?");
            dicData2.Add("applyStatus", "심사중");
            dicData2.Add("importedDataExists", "Y");
            dicData2.Add("dataExportRequestExists", "Y");
            dicData2.Add("dataExportApprovalExistence", "Y");
            dicData2.Add("dataUtilizationStartDate", "2023-06-01 00:00:00");
            dicData2.Add("dataUtilizationEndDate", "2023-06-01 00:00:00");
            listDicData.Add(dicData2);
            //
            return listDicData;
        }
    }
}
