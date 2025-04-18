#!/bin/bash
rg -l 'method public (final )?hashCode' | rg -v 'kotlinx|androidx|okhttp|bitdrift|airbnb|google|facebook' > candidates.txt
rg -l '\.class public final enum Lcom/reddit' > enums.txt
