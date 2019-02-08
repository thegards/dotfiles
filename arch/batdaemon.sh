#/bin/sh

acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r state capacity
	
	if [ "$state" = Discharging -a "$capacity" -lt 5 ]; then
		logger "Critical battery threshold"
		systemctl hibernate
	fi
}
