# InitProject

## Setup workspace

Preparar un entorno de trabajo con vagrant e instalación de apps basicas

https://github.com/paulgualambo/env-tools/tree/main/vagrant/getstart


Instalación de net


https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2204

```sh
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0
```
## Solution, project and files

    ```sh
    mkdir deploy
    mkdir app
    cd app    
    dotnet new globaljson --sdk-version 6
    dotnet new sln --name [name-solution] --output src/

    dotnet new classlib -n [name-solution].Application -o src/[name-solution].Application
    dotnet new classlib -n [name-solution].Core -o src/[name-solution].Core
    dotnet new classlib -n [name-solution].Infrastructure -o src/[name-solution].Infrastructure
    dotnet new webapi -n [name-solution].WebApi -o src/[name-solution].WebApi
    # Fuera de src
    dotnet new xunit -n [name-solution].Tests.XUnit -o test/[name-solution].Tests.XUnit
    ## Dentro de la carpeta donde esta sln
    dotnet sln add src/[name-solution].Application/[name-solution].Application.csproj
    dotnet sln add src/[name-solution].Core/[name-solution].Core.csproj
    dotnet sln add src/[name-solution].Infrastructure/[name-solution].Infrastructure.csproj
    dotnet sln add src/[name-solution].WebApi/[name-solution].WebApi.csproj
    dotnet sln add test/[name-solution].Tests.XUnit/[name-solution].Tests.XUnit.csproj
    dotnet build

    #Add References projects to [name-solution].Application
    dotnet add [name-solution].Application/[name-solution].Application.csproj reference [name-solution].Core/[name-solution].Core.csproj
    dotnet add [name-solution].Infrastructure/[name-solution].Infrastructure.csproj reference [name-solution].Application/[name-solution].Application.csproj

    ##Source Reference
    dotnet add [name-solution].Infrastructure/[name-solution].Infrastructure.csproj reference [name-solution].Core/[name-solution].Core.csproj
    dotnet add [name-solution].WebApi/[name-solution].WebApi.csproj reference [name-solution].Infrastructure/[name-solution].Infrastructure.csproj
    dotnet add [name-solution].WebApi/[name-solution].WebApi.csproj reference [name-solution].Core/[name-solution].Core.csproj
    dotnet add [name-solution].WebApi/[name-solution].WebApi.csproj reference [name-solution].Application/[name-solution].Application.csproj

    #Reference all the project to test
    dotnet add test/[name-solution].Tests.XUnit/[name-solution].Tests.XUnit.csproj reference src/*/*.csproj
    ##
    ```