#!/bin/bash

# install hass-cli
# https://github.com/home-assistant/home-assistant-cli 

# download the ikea firmware script that comes with deconz rest here:
# https://github.com/dresden-elektronik/deconz-rest-plugin
# edit the file:
# replace:
# otapath = '%s/otau' % os.path.expanduser('~')
# with (or something):
# otapath = '/usr/share/hassio/addons/data/69bb46cb_deconz/otau'


# add this to crontab, edit paths if needed
# 0 5 * * * /usr/bin/python2 /usr/share/hassio/addons/data/69bb46cb_deconz/otau/ikea-ota-download.py > /usr/share/hassio/addons/data/69bb46cb_deconz/otau/update_download.log 2>&1
# 2 5 * * * /usr/share/hassio/addons/data/69bb46cb_deconz/otau/fix_updates.sh     > /usr/share/hassio/addons/data/69bb46cb_deconz/otau/update_restart.log 2>&1

if [[ `grep -v 'already' /usr/share/hassio/addons/data/69bb46cb_deconz/otau/update_download.log` != "" ]]; then
	echo "updates found, restarting deconz..."
	/usr/local/bin/hass-cli service call hassio.addon_restart --arguments addon=69bb46cb_deconz
fi

