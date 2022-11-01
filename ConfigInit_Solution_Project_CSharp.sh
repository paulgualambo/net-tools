#Create solucion
    mkdir app
    cd app    
    dotnet new globaljson --sdk-version 6
    dotnet new sln --name [name_solution] --output src/

#Create projects and test projects
    dotnet new classlib -n [name_app].Application -o src/[name_app].Application
    dotnet new classlib -n [name_app].Core -o src/[name_app].Core
    dotnet new classlib -n [name_app].Infrastructure -o src/[name_app].Infrastructure
    dotnet new webapi -n [name_app].WebApi -o src/[name_app].WebApi
    dotnet new xunit -n [name_app].Tests.XUnit -o test/[name_app].Tests.XUnit

#Add projects to sln
    ## go to directory the sln
    dotnet sln add src/[name_app].Aplication/[name_app].Aplication.csproj
    dotnet sln add src/[name_app].Core/[name_app].Core.csproj
    dotnet sln add src/[name_app].Infrastructure/[name_app].Infrastructure.csproj
    dotnet sln add src/[name_app].WebApi/[name_app].WebApi.csproj
    dotnet sln add src/[name_app].Tests.XUnit/[name_app].Tests.XUnit.csproj
    dotnet build

#Add references principal reference library
# dotnet add [<PROJECT>] reference [-f|--framework <FRAMEWORK>]
#      [--interactive] <PROJECT_REFERENCES>
# dotnet add reference -h|--help

    dotnet add src/[name_app].WebApi/[name_app].WebApi.csproj reference src/[name_app].Aplication/[name_app].Aplication.csproj
    dotnet add src/[name_app].Tests.XUnit/[name_app].Tests.XUnit.csproj reference src/[name_app].Aplication/[name_app].Aplication.csproj src/[name_app].WebApi/[name_app].WebApi.csproj

#Add packages
#nuget
Install-Package Dapper
Install-Package Microsoft.Extensions.Configuration
Install-Package Microsoft.Extensions.DependencyInjection.Abstractions
Install-Package System.Data.SqlClient
Install-Package xunit

#dotnet dentro del proyecto de infrastructure
dotnet add package Dapper
dotnet add package Microsoft.Extensions.Configuration
dotnet add package Microsoft.Extensions.DependencyInjection.Abstractions
dotnet add package System.Data.SqlClient
dotnet add package xunit

# Build solution, project
dotnet build 

# run application with cli
dotnet run

# run test with cli

# debug with vscode<>