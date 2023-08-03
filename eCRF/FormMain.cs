
using eCRF.module;
using Microsoft.Web.WebView2.Core;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace KCureDataAccess
{
    public partial class MainForm : Form
    {
        public Observer observer;
        public Controller controller;
        public Config config;
        public Store? store;
        public CustomLibrary library;

        public MainForm()
        {
            InitializeComponent();
            //
            config = new Config();
            library = new CustomLibrary();
            //
            observer = new Observer();
            observer.Add(this);
            //
            controller = new Controller(observer, config);
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            webView2.Source = new Uri(config.webRoot + "01-login.html");

            //string baseDirectory = AppDomain.CurrentDomain.BaseDirectory;
            //string relativePath = @"web/01-login.html";
            //string fullPath = Path.Combine(baseDirectory, relativePath);
            //webView2.Source = new Uri(fullPath);

            webView2.WebMessageReceived += WebView2_WebMessageReceived;
        }

        private void MainForm_Resize(object sender, EventArgs e)
        {
            int width = this.Width;
            int height = this.Height;

            //int scrollbarWidth = SystemInformation.VerticalScrollBarWidth;
            //int scrollbarHeight = SystemInformation.HorizontalScrollBarHeight;
            //width -= scrollbarWidth;
            //height -= scrollbarHeight;

            webView2.Size = new Size(width, height);
        }

        private void WebView2_WebMessageReceived(object? sender, CoreWebView2WebMessageReceivedEventArgs e)
        {
            try
            {
                string strJson = e.WebMessageAsJson;
                Console.WriteLine("\nDebug>>> Read Page JSON");
                Console.WriteLine(library.PrettifyJSON(strJson));
                controller.Parse(strJson);
            }
            catch (Exception ex)
            {
                Console.WriteLine("\nDebug>>> ({0}) {1}", "error", ex.ToString());
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                Console.WriteLine("\nDebug>>> ({0}) {1}", "error", "error");
            }
        }

        public void Listener(string phase, string type, string action, string message, dynamic data)
        {
            Console.WriteLine("\nDebug>>> MainForm Listner");
            Console.WriteLine("(phase) " + phase);
            Console.WriteLine("(type) " + type);
            Console.WriteLine("(action) " + action);
            Console.WriteLine("(message) " + message);
            // Console.WriteLine("Debug>>> (data) : " + library.PrettifyJSON(data));
            //
            // page and api response
            //
            if (type == "page")
            {
                webView2.Source = new Uri(config.webRoot + action + ".html");
            }
            else if (type == "api")
            {
                if (action == "hello")
                {
                    webView2.CoreWebView2.ExecuteScriptAsync($"fetchHello('{message}');");
                }
                else if(action == "patient")
                {
                    List<Dictionary<string, object>> listDicData = (List<Dictionary<string, object>>)data;
                    string jsonData = JsonSerializer.Serialize(listDicData);
                    webView2.CoreWebView2.ExecuteScriptAsync($"fetchPatient('{jsonData}', undefined);");
                    webView2.CoreWebView2.ExecuteScriptAsync($"fetchDetail('{jsonData}', undefined);");
                }
                else if (action == "api-info-table")
                {
                    List<Dictionary<string, object>> listDicData = (List<Dictionary<string, object>>)data;
                    string jsonData = JsonSerializer.Serialize(listDicData);
                    webView2.CoreWebView2.ExecuteScriptAsync($"fetchGetTableInfo('{jsonData}', undefined);");
                }
            }
        }
    }
}
