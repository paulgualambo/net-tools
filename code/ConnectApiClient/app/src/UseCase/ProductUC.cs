using ConnectApiClient.Entities;
using ConnectApiClient.Services;

namespace ConnectApiClient.UseCase
{
    public class ProductUC
    {
        public static async Task<List<Product>> List()
        {
            try
            {
                ProductoService? service = new();
                List<Product>? lista = await service.List();

                foreach (Product item in lista)
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
