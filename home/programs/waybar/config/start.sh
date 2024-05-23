mkdir ~/power_supply_test
sudo mount -t tmpfs -o size=1M tmpfs ~/power_supply_test

mkdir -p ~/power_supply_test/BAT0
mkdir -p ~/power_supply_test/AC

# Создайте необходимые файлы для BAT0
echo "Battery" > ~/power_supply_test/BAT0/type
echo "1" > ~/power_supply_test/BAT0/present
echo "Discharging" > ~/power_supply_test/BAT0/status
echo "500000" > ~/power_supply_test/BAT0/energy_now
echo "600000" > ~/power_supply_test/BAT0/energy_full
echo "1200000" > ~/power_supply_test/BAT0/power_now

# Создайте необходимые файлы для AC
echo "Mains" > ~/power_supply_test/AC/type
echo "1" > ~/power_supply_test/AC/online
