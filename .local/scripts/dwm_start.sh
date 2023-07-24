#!/bin/sh

# EXECUTE WINDOW MANAGER WITHOUT
# KILLING ALL OPENED CLIENTS
while true; do
# Log stderror to a file
dwm 2> $LOGS/dwm.log
# No error logging
# dwm > /dev/null 2>&1
sleep 3s
done
