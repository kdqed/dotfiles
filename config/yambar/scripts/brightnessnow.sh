value=$(brightnessctl -m | cut -d, -f4)
echo "output|string|$value"
echo ""
