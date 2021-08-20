#!/usr/local/bin/python3

import urllib.request
import json

# GHE personal auth token
key = "Basic Y2FsbHVtczo3NmQ0OWNkM2FkNTNkZjg5YTYxODcyZGE5YmFjZGM3YzkwODc5NWVh"

repo = "peretz/neutrino"

req = urllib.request.Request(url="https://github.ibm.com/api/v3/repos/{}/pulls".format(repo), method="GET")
req.add_header("Authorization", key)
with urllib.request.urlopen(req) as f:
    open_prs = len(json.loads(f.read().decode("utf-8")))
    print("{} open PR{}".format(open_prs, "" if open_prs == 1 else "s"))

