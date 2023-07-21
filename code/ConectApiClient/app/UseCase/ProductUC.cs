using ConnectApiClient.Entities;
using ConnectApiClient.Services;
using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace ConnectApiClient.UseCase
{
    public class ProductUC
    {
        public ProductUC()
        {
        }

        public async Task<List<Product>> List()
        {
            try
            {
                var service = new ProductoService();
                var lista = await service.List();

                foreach (var item in lista)
                {
                    item.Price = 10;
                }

                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
