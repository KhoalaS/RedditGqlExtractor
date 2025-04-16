rg -l 'method public (final )?hashCode' | rg -v 'kotlinx|androidx|okhttp|bitdrift|airbnb|google|facebook' | save -f candidates.txt
rg -l '\.class public final enum Lcom/reddit' | save -f enum_candidates.txt
