dist=""
if [ -r /etc/os-release ]; then
	dist="$(. /etc/os-release && echo "$ID")"
fi
echo "$dist"