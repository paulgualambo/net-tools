using ConnectApiClient.Services;
using ConnectApiClient.UseCase;

namespace ConnectApiClient.Tests
{
    public class ProductUCTest
    {
        [Fact]
        public async void Execute()
        {
            //Arrange
            var obj = new ProductUC();

            //Act
            var result = await obj.List();

            //Assert
            Assert.NotNull(result);
        }
    }
}