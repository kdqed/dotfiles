value=$(nmcli con show --active | grep wlp | cut -d' ' -f1)
echo "output|string|$value"
echo ""
