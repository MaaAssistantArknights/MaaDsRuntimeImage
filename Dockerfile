FROM mcr.microsoft.com/dotnet/aspnet:6.0

RUN apt update
RUN apt upgrade -y
RUN apt install -y python3 python3-pip
RUN python3 -m pip install virtualenv
