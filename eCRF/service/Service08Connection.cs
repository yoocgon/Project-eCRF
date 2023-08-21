using eCRF.module;

namespace eCRF.service
{
    public class Service08Connection
    {
        public CustomDapperClient? DapperClient { get; set; }
        public CustomLiteDbClient? LiteDbClient { get; set; }
        public CustomLibrary? Library { get; set; }
        public List<Dictionary<string, object>> GetCsvMatchingResult(string path)
        {
            // csv 파일 매핑 룰을 담은 정보를 로드한다
            // 미작성

            // 파일 디렉터리 경로로 부터 파일 정보를 로드한다.
            List<Dictionary<string, object>> listDicFils = new List<Dictionary<string, object>>();
            List<string> listPath = Library.GetFileList(path);
            foreach (string eachPath in listPath)
            {
                Dictionary<string, object> dicFIleinfo = Library.GetFileInfo(eachPath);
                // 파일 정보와 파일 매핑 룰을 사용하여 각 파일별 스키마 정보와 테이블 정보를 할당한다.
                // 미작성
                listDicFils.Add(dicFIleinfo);
            }

            //
            return listDicFils;
        }
        public bool InsertJsonLiteDb(string path)
        {
            LiteDbClient.InsertJson("ecrf", path);
            return true;
        }

        public bool InsertCsvLiteDb(string path)
        {
            LiteDbClient.InsertCsv("ecrf", path);
            return true;
        }

        //public bool Matcher(string[] aryMatchingKey, string fileName)
        //{
        //    foreach(string key in aryMatchingKey)
        //    {
        //        if (fileName.Contains(key))
        //            return true;
        //    }
        //    //
        //    return false;
        //}
    }
}
