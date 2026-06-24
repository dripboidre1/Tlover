FROM ubuntu:22.04

# Enable 32‑bit architecture (needed for many Windows apps)
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine64 wine32 wget xvfb && \
    apt clean

# Create app directory
WORKDIR /app

# Copy your Windows executable into the container
COPY audit.exe /app/audit.exe

# Optional: make a fake display for GUI apps (Wine sometimes needs it)
ENV DISPLAY=:0

# Run your Windows program
CMD ["wine", "/app/audit.exe"]
