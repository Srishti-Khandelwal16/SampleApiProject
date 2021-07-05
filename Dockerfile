#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["DemoDockerApplication.csproj", ""]
RUN dotnet restore "./DemoDockerApplication.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "DemoDockerApplication.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DemoDockerApplication.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DemoDockerApplication.dll"]