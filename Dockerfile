FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine64 wine32 wget cabextract && \
    apt clean

# Install Wine Mono (needed for .NET apps)
RUN wget https://dl.winehq.org/wine/wine-mono/9.0.0/wine-mono-9.0.0-x86.msi -O /tmp/wine-mono.msi && \
    wine64 msiexec /i /tmp/wine-mono.msi /quiet && \
    rm /tmp/wine-mono.msi

WORKDIR /app

COPY audit.exe /app/audit.exe

CMD ["wine64", "/app/audit.exe"]
