#!/bin/sh
# CyberCTF per-player flag, added by the overlay (the vendored benchmark is unchanged).
# The Dockerfile bakes a development flag in at build time. At every start this wrapper puts
# the player's flag in its place (CTF_FLAG_MAIN, given by the launcher; else /ctf/flag, written
# by ctf/flag.sh on an earlier start; else the development flag), then starts the benchmark
# exactly as before.
dev='FLAG{dev-xben-095-pab-users}'
baked='FLAG{c1aa7b7022dd4a9c8e78927cfd19d88d18a26cd73d4cca0d153f6a2e8d5170b5}'
flag=${CTF_FLAG_MAIN:-}
if [ -z "$flag" ] && [ -s /ctf/flag ]; then flag=$(cat /ctf/flag); fi
[ -n "$flag" ] || flag=$dev
# The benchmark reads the flag from the FLAG environment variable.
export FLAG="$flag"
unset CTF_FLAG_MAIN
exec "$@"
