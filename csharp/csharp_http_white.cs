using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

class csharp_http
{
    static void Main(string[] args)
    {
        Task t = new Task(DownloadPageAsync);
        t.Start();
        Console.ReadLine();
    }

    static async void DownloadPageAsync()
    {
        string page = "https://ipinfo.thordata.com";

        // 设置没有账户密码的代理
        var proxy = new WebProxy("http://t.pr.thordata.net:12233")
        {
            UseDefaultCredentials = false // 不使用默认凭据
        };

        var httpClientHandler = new HttpClientHandler()
        {
            Proxy = proxy,
        };

        var client = new HttpClient(handler: httpClientHandler, disposeHandler: true);
        var response = await client.GetAsync(page);
        using (HttpContent content = response.Content)
        {
            string result = await content.ReadAsStringAsync();
            Console.WriteLine(result);
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
