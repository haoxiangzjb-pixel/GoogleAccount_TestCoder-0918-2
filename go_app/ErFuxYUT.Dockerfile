# Multi-stage Dockerfile for Go application

# --- Stage 1: Build ---
FROM golang:1.21-alpine AS builder

# Install git (sometimes needed for go mod download)
RUN apk add --no-cache git

# Set the working directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the application (the -o flag specifies the output binary name)
# The 'CGO_ENABLED=0' flag creates a static binary, and 'GOOS=linux' ensures it's built for Linux.
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# --- Stage 2: Runtime ---
# Use a minimal base image for the final stage
FROM alpine:latest

# Add CA certificates for HTTPS requests
RUN apk --no-cache add ca-certificates

# Set the working directory
WORKDIR /root/

# Copy the pre-built binary file from the previous stage
COPY --from=builder /app/main .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]