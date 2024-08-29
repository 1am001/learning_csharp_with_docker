FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

ARG PROGRAM_FILE

RUN test -n "$PROGRAM_FILE" || (echo "Error: PROGRAM_FILE argument is required" && exit 1)

WORKDIR /app

RUN dotnet new console -o myapp

COPY ${PROGRAM_FILE} /app/myapp/Program.cs

WORKDIR /app/myapp

RUN dotnet build -c Release -o out

FROM mcr.microsoft.com/dotnet/runtime:8.0

WORKDIR /app

COPY --from=build /app/myapp/out .

ENTRYPOINT ["dotnet", "myapp.dll"]
