FROM docker.io/library/rust:latest

WORKDIR /app

COPY . .

RUN cargo build --release

EXPOSE 3000

CMD ["cargo", "run", "--quiet"]



