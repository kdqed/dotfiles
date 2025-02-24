value=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2)
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f3)
echo "output|string|$value $muted"
echo ""
