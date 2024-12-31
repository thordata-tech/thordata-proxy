using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

class csharp_https_region_city
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

        String username = "username";
        String password = "password";
        String country = "us";
        String city = "houston";
        String proxyUserName = $"user-{username}-region-{country}-city-{city}";

        var proxy = new WebProxy("https://t.pr.thordata.net:12233")
        {
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential(
                userName: proxyUserName,
                password: password)
        };

        var httpClientHandler = new HttpClientHandler()
        {
            Proxy = proxy,
            ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator
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
