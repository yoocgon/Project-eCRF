
namespace KCureDataAccess
{
    public class Observer
    {
        public MainForm formMain;
        public Controller controller;

        public void Send(String phase, String type, String action, String message, dynamic data)
        {
            Console.WriteLine("\nDebug>>> Observer Sender");
            Console.WriteLine("(phase) " + phase);
            Console.WriteLine("(type) " + type);
            Console.WriteLine("(action) " + action);
            Console.WriteLine("(message) " + message);

            if (phase == "response")
                formMain.Listener(phase, type, action, message, data);
            else
                controller.Listener(phase, type, action, message, data);
        }

        public void Add(MainForm formMain)
        {
            this.formMain = formMain;
        }

        public void Add(Controller controller)
        {
            this.controller = controller;
        }
    }
}
