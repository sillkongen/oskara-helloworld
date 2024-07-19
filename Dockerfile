# Step 1: Build Stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Install NativeAOT build prerequisites
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       clang zlib1g-dev

WORKDIR /source

# Copy the .csproj and restore dependencies
COPY HelloWorld.csproj ./
RUN dotnet restore

# Copy the rest of the code
COPY . .

# Publish the app
RUN dotnet publish -c Release -o /app

# Step 2: Runtime Stage
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0

WORKDIR /app

# Copy the published output from the build stage
COPY --from=build /app .

# Set the entry point for the application
ENTRYPOINT ["/app/HelloWorld"]

