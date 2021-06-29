#!/bin/bash

declare -r main_url=10.10.217.122

for userAgent in {A..Z}; do

	curl -A "$userAgent" -s -L http://$main_url > http_response.txt

	if (cat http_response.txt | grep "Use your own <b>codename</b> as user-agent to access the site." &> /dev/null); then

		echo -e "[+] User-agent $userAgent no valido"

	else

		echo -e "[+] User-agent $userAgent valido"
		curl -A "$userAgent" -s -L -v http://$main_url
		exit 1
	fi
done
