FROM quay.io/redhat-user-workloads/rust-sig-tenant/rust-builder:c53edfd5aa61d7aeb3447ae5b088061300d9b61d

WORKDIR /app

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

COPY . .

RUN cargo build --release

EXPOSE 3000

CMD ["cargo", "run", "--quiet"]



