#!/bin/bash
rg -l '"[a-zA-Z0-9_]+\([a-zA-Z0-9_]+=' | rg -v 'kotlinx|androidx|okhttp|bitdrift|airbnb|google' > candidates.txt
