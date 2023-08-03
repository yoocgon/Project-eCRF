using Npgsql;
using Dapper;
using Serilog;
using KCureDataAccess;
using System.Text.Json;

namespace eCRF.module
{
    public class CustomDapperClient
    {
        private Config config;

        public CustomDapperClient(Config config)
        {
            this.config = config;
            //
            Log.Logger = new LoggerConfiguration()
             .WriteTo.Console()
             .CreateLogger();
        }

        public List<Dictionary<string, object>> Select(string schema, string table, int offset, int limit, Dictionary<string, JsonElement> whereConditions)
        {
            using (var connection = new NpgsqlConnection(config.dapperConnStr))
            {
                connection.Open();

                string query = $"SELECT * FROM {schema}.{table} WHERE 1=1";
                var parameters = new DynamicParameters();
                foreach (var property in whereConditions)
                {
                    switch (property.Value.ValueKind)
                    {
                        //
                        case JsonValueKind.String:
                            string stringValue = property.Value.GetString();
                            if (stringValue == "-")
                            {
                                continue;
                            }
                            else if (stringValue == "Y")
                            {
                                query += $" AND {property.Key} = @{property.Key}";
                                parameters.Add(property.Key, true);
                            }
                            else if (stringValue == "N")
                            {
                                query += $" AND {property.Key} = @{property.Key}";
                                parameters.Add(property.Key, false);
                            }
                            else if (DateTime.TryParse(stringValue, out DateTime dateTimeValue))
                            {
                                query += $" AND {property.Key} = @{property.Key}";
                                parameters.Add(property.Key, dateTimeValue);
                            }
                            else
                            {
                                query += $" AND {property.Key} = @{property.Key}";
                                parameters.Add(property.Key, stringValue);
                            }
                            break;
                        //
                        case JsonValueKind.Number:
                            if (property.Value.TryGetInt32(out int intValue))
                            {
                                query += $" AND {property.Key} = @{property.Key}";
                                parameters.Add(property.Key, property.Value.GetInt32());
                            }
                            else if (property.Value.TryGetInt64(out long longValue))
                            {
                                query += $" AND {property.Key} = @{property.Key}";
                                parameters.Add(property.Key, property.Value.GetInt64());
                            }
                            else if (property.Value.TryGetDouble(out double doubleValue))
                            {
                                query += $" AND {property.Key} = @{property.Key}";
                                parameters.Add(property.Key, property.Value.GetDouble());
                            }
                            break;
                        //
                        case JsonValueKind.True:
                            query += $" AND {property.Key} = @{property.Key}";
                            parameters.Add(property.Key, property.Value.GetBoolean());
                            break;
                        //
                        case JsonValueKind.False:
                            query += $" AND {property.Key} = @{property.Key}";
                            parameters.Add(property.Key, property.Value.GetBoolean());
                            break;
                        //
                        default:
                            MessageBox.Show("Debug>>> failed to matching type");
                            break;
                    }
                }
                //
                // query += $" OFFSET @{offset} LIMIT @{limit}";
                query += $" OFFSET @offset ROWS FETCH NEXT @limit ROWS ONLY";
                parameters.Add("offset", offset);
                parameters.Add("limit", limit);
                //
                Log.Information("\nDebug>>> (Dapper query and parameters) ");
                Log.Information(query);
                foreach (var param in parameters.ParameterNames)
                    Log.Information($"{param}: {parameters.Get<dynamic>(param)}");
                //
                var result = connection.Query(query, parameters);
                //
                connection.Close();
                //
                List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
                foreach (var row in result)
                {
                    var dictionary = new Dictionary<string, object>();
                    foreach (var column in row)
                    {
                        dictionary.Add(column.Key, column.Value);
                    }
                    listResult.Add(dictionary);
                }
                //
                Console.WriteLine("\nDebug>>> (query result) ");
                foreach (var row in listResult)
                {
                    Console.WriteLine("\nDebug>>> (row) ");
                    foreach (var kvp in row)
                    {
                        Console.WriteLine($"{kvp.Key}: {kvp.Value}");
                    }
                }
                //
                return listResult;
            }
        }

        //public List<Dictionary<string, object>> Select(string schema, string table, int offset, int limit, Dictionary<string, JsonElement> whereConditions)
        //{
        //    using (var connection = new NpgsqlConnection(config.dapperConnStr))
        //    {
        //        connection.Open();

        //        string query = $"SELECT * FROM {schema}.{table} WHERE 1=1";
        //        var parameters = new DynamicParameters();
        //        foreach (var condition in whereConditions)
        //        {
        //            //
        //            Type type = condition.Value.GetType();
        //            if (type == typeof(string))
        //            {
        //                string val = condition.Value.ToString();
        //                if(val == "-")
        //                {
        //                    continue;
        //                }
        //                else if (val == "Y")
        //                {
        //                    query += $" AND {condition.Key} = @{condition.Key}";
        //                    parameters.Add(condition.Key, true);
        //                }
        //                else if (val == "N")
        //                {
        //                    query += $" AND {condition.Key} = @{condition.Key}";
        //                    parameters.Add(condition.Key, false);
        //                }
        //                else
        //                {
        //                    query += $" AND {condition.Key} = @{condition.Key}";
        //                    parameters.Add(condition.Key, val);
        //                }
        //            }
        //            else if (type == typeof(int))
        //            {
        //                query += $" AND {condition.Key} = @{condition.Key}";
        //                parameters.Add(condition.Key, (int)condition.Value);
        //            }
        //            else if (type == typeof(bool))
        //            {
        //                query += $" AND {condition.Key} = @{condition.Key}";
        //                parameters.Add(condition.Key, (bool) condition.Value);
        //            }
        //            else if (type == typeof(DateTime))
        //            {
        //                query += $" AND {condition.Key} = @{condition.Key}";
        //                parameters.Add(condition.Key, (DateTime) condition.Value);
        //            }
        //            else
        //            {
        //                MessageBox.Show("query parameter not matched!");
        //            }
        //        }
        //        // query += $" OFFSET @{offset} LIMIT @{limit}";
        //        query += $" OFFSET @offset ROWS FETCH NEXT @limit ROWS ONLY";
        //        parameters.Add("offset", offset);
        //        parameters.Add("limit", limit);
        //        //
        //        Log.Information("\nDebug>>> (Dapper query and parameters) ");
        //        Log.Information(query);
        //        foreach (var param in parameters.ParameterNames)
        //            Log.Information($"{param}: {parameters.Get<dynamic>(param)}");
        //        //
        //        var result = connection.Query(query, parameters);
        //        //
        //        connection.Close();
        //        //
        //        List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
        //        foreach (var row in result)
        //        {
        //            var dictionary = new Dictionary<string, object>();
        //            foreach (var column in row)
        //            {
        //                dictionary.Add(column.Key, column.Value);
        //            }
        //            listResult.Add(dictionary);
        //        }
        //        //
        //        Console.WriteLine("\nDebug>>> (query result) ");
        //        foreach (var row in listResult)
        //        {
        //            Console.WriteLine("\nDebug>>> (row) ");
        //            foreach (var kvp in row)
        //            {
        //                Console.WriteLine($"{kvp.Key}: {kvp.Value}");
        //            }
        //        }
        //        //
        //        return listResult;
        //    }
        //}

        public List<Dictionary<string, object>> Select(string query, object parameters)
        {
            using (var connection = new NpgsqlConnection(config.dapperConnStr))
            {
                connection.Open();
                dynamic result;
                if (parameters == null)
                {
                    result = connection.Query<dynamic>(query);
                }
                else
                {
                    result = connection.Query(query, parameters).ToList();
                }
                //
                connection.Close();
                //
                List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
                foreach (var row in result)
                {
                    var dictionary = new Dictionary<string, object>();
                    foreach (var column in row)
                    {
                        dictionary.Add(column.Key, column.Value);
                    }
                    listResult.Add(dictionary);
                }
                //
                Console.WriteLine("\nDebug>>> (query result) ");
                foreach (var row in listResult)
                {
                    Console.WriteLine("\nDebug>>> (row) ");
                    foreach (var kvp in row)
                    {
                        Console.WriteLine($"{kvp.Key}: {kvp.Value}");
                    }
                }
                //
                return listResult;
            }
        }

        // 쿼리식, 값, contition 
        public List<Dictionary<string, object>> Select(string query, Dictionary<string, string> conditions)
        {
            //
            using (var connection = new NpgsqlConnection(config.dapperConnStr))
            {
                connection.Open();
                //
                foreach (var item in conditions)
                    query = query.Replace(item.Key, item.Value);
                //
                dynamic result = connection.Query(query).ToList();
                List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
                foreach (var row in result)
                {
                    Dictionary<string, object> dictionary = new Dictionary<string, object>();
                    foreach (var column in row)
                    {
                        dictionary.Add(column.Key, column.Value);
                    }
                    listResult.Add(dictionary);
                }
                //
                Console.WriteLine("\nDebug>>> (query result) ");
                foreach (var row in listResult)
                {
                    Console.WriteLine("\nDebug>>> (row) ");
                    foreach (var kvp in row)
                    {
                        Console.WriteLine($"{kvp.Key}: {kvp.Value}");
                    }
                }
                //
                connection.Close();
                //
                return listResult;
            }
        }



        // 쿼리식, 값, contition 
        public List<Dictionary<string, object>> SelectUsingFilter(
            string schema,
            string table,
            string conditionSelect,
            List<Dictionary<string, string>> conditionsWhere,
            string offset, string limit)
        {
            //
            using (var connection = new NpgsqlConnection(config.dapperConnStr))
            {
                connection.Open();
                //
                DynamicParameters dynamicParameters = new DynamicParameters();
                //
                string strWhere = "";
                foreach (Dictionary<string, string> dicCondition in conditionsWhere)
                {
                    if (dicCondition["value"] == dicCondition["exception"])
                        continue;
                    //
                    if (dicCondition["type"] == "text")
                    {
                        strWhere += dicCondition["expression"];
                        dynamicParameters.Add("@" + dicCondition["variable"], dicCondition["value"], System.Data.DbType.String);
                    }
                    else if (dicCondition["type"] == "number")
                    {
                        strWhere += dicCondition["expression"];
                        dynamicParameters.Add("@" + dicCondition["variable"], dicCondition["value"], System.Data.DbType.Int64);
                    }
                    else if (dicCondition["type"] == "bool")
                    {
                        strWhere += dicCondition["expression"];
                        object objValue = false;
                        if (dicCondition["value"] == "Y")
                            objValue = true;
                        //
                        dynamicParameters.Add("@" + dicCondition["variable"], objValue, System.Data.DbType.Boolean);
                    }
                    else if (dicCondition["type"] == "timestamp")
                    {
                        strWhere += dicCondition["expression"];
                        DateTime dateTime = DateTime.Parse(dicCondition["value"]);
                        dateTime = DateTime.SpecifyKind(dateTime, DateTimeKind.Utc);
                        dynamicParameters.Add("@" + dicCondition["variable"], dateTime, System.Data.DbType.DateTime);
                    }
                }
                //
                string query = $"SELECT {conditionSelect} FROM {schema}.{table} WHERE 1=1 {strWhere}";
                //
                if (offset != "")
                    query += " OFFSET " + offset;
                //
                if (limit != "")
                    query += " LIMIT " + limit;
                //
                Console.WriteLine("\nDebug>>> ({0}) {1}", "query", query);
                //
                dynamic result = connection.Query(query, dynamicParameters).ToList();
                List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
                foreach (var row in result)
                {
                    Dictionary<string, object> dictionary = new Dictionary<string, object>();
                    foreach (var column in row)
                    {
                        dictionary.Add(column.Key, column.Value);
                    }
                    listResult.Add(dictionary);
                }
                //
                Console.WriteLine("\nDebug>>> (query result) ");
                foreach (var row in listResult)
                {
                    Console.WriteLine("\nDebug>>> (row) ");
                    foreach (var kvp in row)
                    {
                        Console.WriteLine($"{kvp.Key}: {kvp.Value}");
                    }
                }
                //
                connection.Close();
                //
                return listResult;
            }
        }

        public List<Dictionary<string, object>> PostSelectFilter(List<Dictionary<string, object>> listDicData)
        {
            List<Dictionary<string, object>> listDicPostData = new List<Dictionary<string, object>>();
            foreach (var dic in listDicData)
            {
                var newDic = new Dictionary<string, object>();
                foreach (var item in dic)
                {
                    string newValue = "";
                    if (item.Value == null)
                        newValue = "";
                    else if (item.Value.GetType().Name == "Boolean" && (bool)item.Value)
                        newValue = "Y";
                    else if (item.Value.GetType().Name == "Boolean" && !(bool)item.Value)
                        newValue = "N";
                    else
                        newValue = item.Value.ToString();
                    //
                    newDic.Add(item.Key, newValue);
                }
                //
                listDicPostData.Add(newDic);
            }
            //
            return listDicPostData;
        }

        // 쿼리식, 값, contition 
        public List<Dictionary<string, object>> GetPostgresTableColumnInfo(string schema, string table)
        {
            //
            //string query = $"""
            //    SELECT b.table_name, b.column_name, b.data_type, a.column_comment 
            //    FROM (
            //     (SELECT TABLE_NAME, column_name, data_type
            //     FROM INFORMATION_SCHEMA.COLUMNS
            //     WHERE TABLE_CATALOG = '{schema}'
            //       AND TABLE_NAME = '{table}'
            //       AND table_schema = 'public'
            //     ORDER BY ORDINAL_POSITION) as b 
            //    left JOIN
            //     (SELECT PS.RELNAME AS TABLE_NAME, PA.ATTNAME AS COLUMN_NAME, PD.DESCRIPTION AS COLUMN_COMMENT
            //      FROM PG_STAT_ALL_TABLES PS, PG_DESCRIPTION PD, PG_ATTRIBUTE PA
            //      WHERE PS.SCHEMANAME = (SELECT SCHEMANAME FROM PG_STAT_USER_TABLES WHERE RELNAME = '{table}')
            //       AND PS.RELNAME = '{table}'
            //       AND PS.RELID = PD.OBJOID
            //       AND PD.OBJSUBID <> 0
            //       AND PD.OBJOID = PA.ATTRELID
            //       AND PD.OBJSUBID = PA.ATTNUM
            //     ORDER BY PS.RELNAME, PD.OBJSUBID) as a
            //    ON a.column_name = b.column_name)""";
            //
            string query = @"
                SELECT b.table_name, b.column_name, b.data_type, a.column_comment 
                FROM (
                 (SELECT TABLE_NAME, column_name, data_type
                 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_CATALOG = '{schema}'
                   AND TABLE_NAME = '{table}'
                   AND table_schema = 'public'
                 ORDER BY ORDINAL_POSITION) as b 
                left JOIN
                 (SELECT PS.RELNAME AS TABLE_NAME, PA.ATTNAME AS COLUMN_NAME, PD.DESCRIPTION AS COLUMN_COMMENT
                  FROM PG_STAT_ALL_TABLES PS, PG_DESCRIPTION PD, PG_ATTRIBUTE PA
                  WHERE PS.SCHEMANAME = (SELECT SCHEMANAME FROM PG_STAT_USER_TABLES WHERE RELNAME = '{table}')
                   AND PS.RELNAME = '{table}'
                   AND PS.RELID = PD.OBJOID
                   AND PD.OBJSUBID <> 0
                   AND PD.OBJOID = PA.ATTRELID
                   AND PD.OBJSUBID = PA.ATTNUM
                 ORDER BY PS.RELNAME, PD.OBJSUBID) as a
                ON a.column_name = b.column_name)";
            //
            query = query.Replace("{schema}", schema);
            query = query.Replace("{table}", table);
            //
            using (var connection = new NpgsqlConnection(config.dapperConnStr))
            {
                connection.Open();
                dynamic result = connection.Query(query).ToList();
                List<Dictionary<string, object>> listResult = new List<Dictionary<string, object>>();
                foreach (var row in result)
                {
                    Dictionary<string, object> dictionary = new Dictionary<string, object>();
                    foreach (var column in row)
                    {
                        dictionary.Add(column.Key, column.Value);
                    }
                    listResult.Add(dictionary);
                }
                //
                Console.WriteLine("\nDebug>>> (query result) ");
                foreach (var row in listResult)
                {
                    Console.WriteLine("\nDebug>>> (row) ");
                    foreach (var kvp in row)
                    {
                        Console.WriteLine($"{kvp.Key}: {kvp.Value}");
                    }
                }
                //
                connection.Close();
                //
                return listResult;
            }
        }

        //
        public void SetColumnFilterValues(List<Dictionary<string, object>> columns, string schema, string table)
        {
            if (columns == null)
                return;
            //
            foreach (var column in columns)
            {
                List<object> values = SelectDistinctColumns(schema, table, (string)column["column_name"]);
                column.Add("values", values);
            }
        }

        //
        public List<object> SelectDistinctColumns(string schema, string table, string column)
        {
            //
            string query = $"SELECT distinct {column} FROM {table}";
            //
            using (var connection = new NpgsqlConnection(config.dapperConnStr))
            {
                connection.Open();
                List<dynamic> result = connection.Query(query).ToList();
                List<object> listResult = new List<object>();
                foreach (var item in result)
                    listResult.Add(item);
                //
                connection.Close();
                return listResult;
            }
        }


        //
        //string query = "" +
        //    "SELECT * " +
        //    "FROM tb_test " +
        //    "WHERE department = @department " +
        //    "AND researcher = @researcher" +
        //    "AND researcher = @applyStep" +
        //    "AND researcher = @applyStatus" +
        //    "AND researcher = @importedDataExists" +
        //    "AND researcher = @dataExportRequestExists" +
        //    "AND researcher = @dataExportApprovalExistence";
        //
        //var parameter = new
        //{
        //    department = department,
        //    researcher = researcher,
        //    applyStep = applyStep,
        //    applyStatus = applyStatus,
        //    importedDataExists = importedDataExists,
        //    dataExportRequestExists = dataExportRequestExists,
        //    dataExportApprovalExistence = dataExportApprovalExistence
        //};
        //
        // List<Dictionary<string, object>> listDicData = dapperClient.Select(query, parameter);

    }
}
