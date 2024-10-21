docker buildx build \
    --builder cloud-tkazi-builder \
    --platform 'linux/amd64,linux/arm64' \
    -t tkazi/jupyter:2024-goto-chg \
    --push \
    .
