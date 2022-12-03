using ConnectApiClient.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ConnectApiClient.Services
{
    public class ProductoService
    {
        private readonly HttpClient client = new HttpClient();

        public ProductoService()
        {
        }

        public async Task<List<Product>> List()
        {
            client.DefaultRequestHeaders.Accept.Clear();
            //client.DefaultRequestHeaders.Accept.Add(
            //    new MediaTypeWithQualityHeaderValue("application/vnd.github.v3+json"));
            //client.DefaultRequestHeaders.Add("User-Agent", ".NET Foundation Repository Reporter");

            var streamTask = client.GetStreamAsync("https://fakestoreapi.com/products");
            var products = await JsonSerializer.DeserializeAsync<List<Product>>(await streamTask);

            //CS8603 Possible null reference return.
            return products ?? new List<Product>();
        }
    }
}
