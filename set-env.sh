RED='\033[0;31m'

if [ -z "$1" ] || [ -z "$2" ]; then
    echo -e "${RED}Must provide both project and environment - IE setenv singer 1"
    exit
fi

PROXYSTATUS=$(curl --max-time 2 -s -o /dev/null -w "%{http_code}" http://100.95.104.43:5000/status)

if [ "$PROXYSTATUS" != "200" ]; then
    echo -e "${RED}The proxy server did not send a successful response. Is it up?"
    exit
fi

curl -v curl -v http://100.95.104.43:5000/hosts/$2 | sudo tee -a /etc/hosts
curl http://100.95.104.43:5000/envs/$1/$2 -o ${PWD}/.env