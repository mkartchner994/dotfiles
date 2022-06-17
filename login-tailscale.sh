# make sure we can use the tailscale https url for this machine
echo 100.95.104.43 web.tailnet-0b22.ts.net | sudo tee -a /etc/hosts

if [ -n "${TAILSCALE_STATE_MYPROJECT}" ]; then
    sudo -E tailscale up
else
    sudo -E tailscale up --hostname "gitpod-${GITPOD_GIT_USER_NAME// /-}-$(echo ${GITPOD_WORKSPACE_CONTEXT} | jq -r .repository.name)"
    # store the tailscale state into gitpod user
    gp env TAILSCALE_STATE_MYPROJECT="$(sudo cat /var/lib/tailscale/tailscaled.state)"
fi