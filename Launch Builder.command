#!/bin/bash
# Double-click this file to launch the LITG playable builder.
# Starts a local server (required so Safari allows the preview to load)
# and opens the tool in your default browser.

cd "$(dirname "$0")"

PORT=8765

# If something's already serving on this port (e.g. left over from last time), reuse it.
if ! lsof -i ":$PORT" >/dev/null 2>&1; then
  nohup python3 -m http.server "$PORT" >/dev/null 2>&1 &
  disown
  sleep 0.5
fi

open "http://localhost:$PORT/builder.html"

echo "Builder running at http://localhost:$PORT/builder.html"
echo "You can close this Terminal window; the server keeps running in the background."
echo "(To stop it later: quit Terminal, or run: lsof -ti :$PORT | xargs kill)"
