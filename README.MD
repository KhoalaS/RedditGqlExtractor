# Reddit GQL Extractor

## Goal

Automated type extraction from the Reddit Android App.

![](https://raw.githubusercontent.com/KhoalaS/RedditGqlExtractor/refs/heads/main/images/frontend.png)

## Building

```bash
go build -o ./gex cmd/gex/main.go
```

## Usage

Generate the candidate files:

```bash
# inside the directory where the decompile apk is
# myapp_decompiled/
# ├── AndroidManifest.xml
# ├── assets/
# ├── lib/
# ├── res/
# ├── smali/
# └── unknown/
# ...
# or call gen_candidates.nu|sh from the scripts folder
rg -l 'method public (final )?hashCode' | rg -v 'kotlinx|androidx|okhttp|bitdrift|airbnb|google|facebook' > candidates.txt
rg -l '\.class public final enum Lcom/reddit' > enums.txt

# execute the binary
./gex
```

## Approaches

The generated Apollo types don't use reflection and will be obfuscated.

### toString

The generated types will most likely be a data class. These will auto generate a toString method. We can possibly exploit this to extract the type definitions.

Example:

The type is TaxonomyTopic.

The name in the code is TaxonomyTopic1. This is because this type is used in a list of TaxonomyTopic objects, where the values have a field of the same value. The 1 is added during generation to mitigate naming collisions.

The field access calls will reveal the type of the field:

```smali
const-string v1, ", displayName="

invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

iget-object v1, p0, LmB/hW;->b:Ljava/lang/String;

```

this tells us that the field `b` had the name `displayName` and that it is a Java String.

```smali
.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TaxonomyTopic1(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, LmB/hW;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", displayName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, LmB/hW;->b:Ljava/lang/String;

    const-string v2, ")"

    invoke-static {v0, v1, v2}, LA/a0;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
```
# TODO

```smali
    const-string v1, ", outbound=null, adblock=null, metaflair="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", metaSearch=null, banner=null, customFeed=null, topicMetadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
```

`metaflair` has an implicit default nullish value. `const/4 v1, 0x0` gets appended after the `", outbound=null, adblock=null, metaflair="` string. This leads to an inconsistent amount of fields between since fields with default values are skipped.