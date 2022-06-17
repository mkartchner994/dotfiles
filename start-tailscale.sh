if [ -n "${TAILSCALE_STATE_MYPROJECT}" ]; then
    # restore the tailscale state from gitpod user's env vars
    sudo mkdir -p /var/lib/tailscale
    echo "${TAILSCALE_STATE_MYPROJECT}" | sudo tee /var/lib/tailscale/tailscaled.state > /dev/null
fi
sudo tailscaled