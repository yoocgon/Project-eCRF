﻿using Npgsql;
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

        /// <summary>
        /// SQL를 사용해 쿼리
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public List<Dictionary<string, object>> Query(string query)
        {
            using (var connection = new NpgsqlConnection(config.DapperConnStr))
            {
                connection.Open();
                dynamic result = connection.Query<dynamic>(query);
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

        //
        // Dapper 기본 사용 방법 예시
        // 
        // string query = "" +
        //     "SELECT * " +
        //     "FROM tb_test " +
        //     "WHERE department = @department " +
        //     "AND researcher = @researcher" +
        //     "AND researcher = @applyStep" +
        //     "AND researcher = @applyStatus" +
        //     "AND researcher = @importedDataExists" +
        //     "AND researcher = @dataExportRequestExists" +
        //     "AND researcher = @dataExportApprovalExistence";
        // 
        // var parameter = new
        // {
        //     department = department,
        //     researcher = researcher,
        //     applyStep = applyStep,
        //     applyStatus = applyStatus,
        //     importedDataExists = importedDataExists,
        //     dataExportRequestExists = dataExportRequestExists,
        //     dataExportApprovalExistence = dataExportApprovalExistence
        // };
        //
        // List<Dictionary<string, object>> listDicData = dapperClient.Select(query, parameter);
        //

        /// <summary>
        /// SQL 문에 dynamic 파라메터를 사용하는 쿼리 기능
        /// </summary>
        /// <param name="query"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public List<Dictionary<string, object>> Select(string query, object parameters)
        {
            using (var connection = new NpgsqlConnection(config.DapperConnStr))
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

        /// <summary>
        /// Deprecated
        /// 주로 GridView에 사용하기 위해, Where 절 필터 조건을 동적으로 추가하기 위한 SELECT 쿼리 기능
        /// </summary>
        /// <param name="schema"></param>
        /// <param name="table"></param>
        /// <param name="offset"></param>
        /// <param name="limit"></param>
        /// <param name="whereConditions"></param>
        /// <returns></returns>
        public List<Dictionary<string, object>> Select(string schema, string table, int offset, int limit, Dictionary<string, JsonElement> whereConditions)
        {
            using (var connection = new NpgsqlConnection(config.DapperConnStr))
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

        /// <summary>
        /// Deprecated
        /// 주로 GridView에 사용하기 위해, Where 절 필터 조건을 동적으로 추가하기 위한 SELECT 쿼리 기능 
        /// </summary>
        /// <param name="schema"></param>
        /// <param name="table"></param>
        /// <param name="conditionSelect"></param>
        /// <param name="conditionsWhere"></param>
        /// <param name="offset"></param>
        /// <param name="limit"></param>
        /// <returns></returns>
        public List<Dictionary<string, object>> SelectUsingFilter(
            string schema,
            string table,
            string conditionSelect,
            List<Dictionary<string, string>> conditionsWhere,
            string offset, string limit)
        {
            //
            using (var connection = new NpgsqlConnection(config.DapperConnStr))
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

        /// <summary>
        /// PostgreSQL에서 schema, table, column 정보를 쿼리
        /// </summary>
        /// <param name="schema"></param>
        /// <param name="table"></param>
        /// <returns></returns>
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
            using (var connection = new NpgsqlConnection(config.DapperConnStr))
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

        /// <summary>
        /// Deprecated, Subfunction
        /// 쿼리 조건 결과에서 기존 타입이 Boolean인 경우 반환시 원래 표시 형식으로 변경
        /// </summary>
        /// <param name="listDicData"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Deprecated
        /// 필터 조건이 적합한지 판단하려고 컬럼별 출력 값 갯수를 확인하기 위한 기능
        /// </summary>
        /// <param name="columns"></param>
        /// <param name="schema"></param>
        /// <param name="table"></param>
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

        /// <summary>
        /// Deprecated
        /// 필터 조건이 적합한지 판단하려고 컬럼별 출력 값 갯수를 확인하기 위한 기능
        /// </summary>
        /// <param name="schema"></param>
        /// <param name="table"></param>
        /// <param name="column"></param>
        /// <returns></returns>
        public List<object> SelectDistinctColumns(string schema, string table, string column)
        {
            //
            string query = $"SELECT distinct {column} FROM {table}";
            //
            using (var connection = new NpgsqlConnection(config.DapperConnStr))
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
    }
}
