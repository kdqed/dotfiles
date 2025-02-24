value=$(nmcli con show --active | grep wlp6s0 | cut -d' ' -f1)
echo "output|string|$value"
echo ""
