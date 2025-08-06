# syntax = docker/dockerfile:1

# Adjust NODE_VERSION as desired
ARG NODE_VERSION=20.15.1
FROM node:${NODE_VERSION}-slim AS base

LABEL andasy_launch_runtime="Node.js"

# Node.js app lives here
WORKDIR /app

# Set production environment
ENV NODE_ENV="production"


# Throw-away build stage to reduce size of final image
FROM base AS build

# Install packages needed to build node modules
RUN apt-get update -qq

# Install node modules
COPY package-lock.json package.json ./
RUN npm install

# Copy application code
COPY . .

# Build application
RUN npm run build

# Remove development dependencies
RUN npm prune --omit=dev


# Final stage for app image
FROM pierrezemb/gostatic

COPY public/ /srv/http/

CMD ["-port","3000","-https-promote", "-enable-logging"]
