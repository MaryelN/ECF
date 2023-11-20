# Use the specified builder
FROM paketobuildpacks/builder:base

# Specify the Node.js buildpack
RUN --mount=type=bind,destination=/workspace echo "gcr.io/paketo-buildpacks/nodejs" > /workspace/buildpacks

# Copy the contents of your application to the working directory
COPY . /workspace/app

# Set the working directory
WORKDIR /workspace/app

# Build the application using the buildpacks
RUN /workspace/entrypoint build

# Specify the runtime image
FROM paketobuildpacks/run:base-cnb

# Copy the built artifacts from the previous stage
COPY --from=0 /workspace /workspace

# Set the working directory
WORKDIR /workspace/app

# Export the HTTP port that your app will run on
ENV PORT 8080

# Start your application
CMD /workspace/entrypoint run