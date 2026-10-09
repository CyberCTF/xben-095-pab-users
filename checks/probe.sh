#!/bin/sh
# The user search connects to the database and answers a lookup.
curl -fsS --max-time 15 -d 'username=nobody_probe' http://web/search.php | grep -q 'You are connected successfully!'
