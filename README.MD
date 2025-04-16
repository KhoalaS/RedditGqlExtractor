# Reddit GQL Extractor

## Goal

Automated type extraction from the Reddit Android App.

## Building

```bash
# create venv
python -m venv .venv

# install dependencies
pip install -r requirements.txt

# (optional) build the binary
pyinstaller ./src/main.py -F -n gex
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
rg -l '\.class public final enum Lcom/reddit' > enum_candidates.txt

# execute the main script or binary
./gex -o schema.json -c candidates.txt -e enum_candidates.txt
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
