#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
ENV ASPNETCORE_URLS http://*:44319

#ENV ASPNETCORE_ENVIRONMENT=Development
WORKDIR /app
EXPOSE 80
EXPOSE 44319

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY . /src
#COPY ["RxWebSampleApp.Api/RxWebSampleApp.Api.csproj", ""]
RUN dotnet restore "RxWebSampleApp.Api/RxWebSampleApp.Api.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "RxWebSampleApp.Api/RxWebSampleApp.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "RxWebSampleApp.Api/RxWebSampleApp.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "RxWebSampleApp.Api.dll"]
