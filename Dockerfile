FROM docker.io/library/rust:latest

WORKDIR /app

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

COPY . .

RUN cargo build --release

EXPOSE 3000

CMD ["cargo", "run", "--quiet"]



