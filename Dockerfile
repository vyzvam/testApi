# Use the .net core 3.1 SDK Container image
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

#Change current working directory
WORKDIR /app

# Copy existing files from host machine
COPY . ./

# Publish application to out folder
RUN dotnet publish --configuration release --output out

# Start container by running application dll
ENTRYPOINT ["dotnet", "out/testApi.dll"]
