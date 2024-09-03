#!/bin/bash

# Install all dependencies of all modules
pnpm install

# Build all the code
pnpm build || {
    # If build fails due to memory issues, increase Node.js heap size and try again
    export NODE_OPTIONS="--max-old-space-size=4096"
    echo "Build failed. Retrying with increased heap size..."
    pnpm build
}

# Start the app
pnpm start
