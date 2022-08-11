# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY core/*.csproj ./core/
RUN dotnet restore

# copy everything else and build app
COPY core/. ./core/
WORKDIR /source/core
RUN dotnet publish -c release -o /app --no-restore
