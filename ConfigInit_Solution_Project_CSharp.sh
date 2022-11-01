#Create solucion
    dotnet new globaljson --sdk-version 6
    dotnet new sln --name [name_solution]

#Create projects and test projects
    dotnet new classlib -n [name_app].Application -o app/src/[name_app].Application
    dotnet new classlib -n [name_app].Core -o app/src/[name_app].Core
    dotnet new classlib -n [name_app].Infrastructure -o app/src/[name_app].Infrastructure
    dotnet new webapi -n [name_app].WebApi -o app/src/[name_app].WebApi
    dotnet new xunit -n [name_app].Tests.XUnit -o app/test/[name_app].Tests.XUnit


    ## Dentro de la carpeta donde esta sln
#Add projects to sln
    ## go to directory the sln
    dotnet sln add app/src/[name_app].Aplication/[name_app].Application.csproj
    dotnet sln add app/src/[name_app].Core/[name_app].Core.csproj
    dotnet sln add src/[name_app].Infrastructure/[name_app].Infrastructure.csproj
    dotnet sln add app/src/[name_app].WebApi/[name_app].WebApi.csproj
    dotnet sln add app/src/[name_app].Tests.XUnit/[name_app].Tests.XUnit.csproj
    dotnet sln add 

#Add references principal reference library
# dotnet add [<PROJECT>] reference [-f|--framework <FRAMEWORK>]
#      [--interactive] <PROJECT_REFERENCES>
# dotnet add reference -h|--help

##Source Reference
    dotnet add app/src/[name_app].WebApi/[name_app].WebApi.csproj reference app/src/[name_app].Aplication/[name_app].Application.csproj
    dotnet add app/src/[name_app].Tests.XUnit/[name_app].Tests.XUnit.csproj reference app/src/[name_app].Aplication/[name_app].Application.csproj app/src/[name_app].WebApi/[name_app].WebApi.csproj

    #Reference all the project to test
    dotnet add app/test/[name_app].Tests.XUnit/[name_app].Tests.XUnit.csproj reference app/src/*/*.csproj    
 #dotnet run --project src/consoleapp
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