# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Get the Linux version but remove the "-1-ARCH" part
linux_version=$(uname -r | cut -d '-' -f1)

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_percentage=$(upower --show-info $(upower --enumerate |\
grep 'BAT') |\
egrep "state|percentage" |\
awk '{print $2}')

audio_str=$(amixer -M get Master |\
    awk '/^ *Front Left.+/ {left_val=$4; left_per=$5} \
    /^ *Front Right.+/ {right_val=$4; right_per=$5} \
    END {print left_val==right_val ? left_per : left_per"/"right_per}' |\
    tr -d [])

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 🔋 📁 \|
echo $uptime_formatted ↑ $linux_version 🐧 $audio_str 🔉 $battery_percentage ⚡ $date_formatted
