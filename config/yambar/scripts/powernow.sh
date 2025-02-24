watts=$(cat /sys/class/power_supply/BAT0/current_now /sys/class/power_supply/BAT0/voltage_now | xargs | awk '{printf "%dW",$1*$2/1e12}')
echo "watts|string|$watts"
echo ""
