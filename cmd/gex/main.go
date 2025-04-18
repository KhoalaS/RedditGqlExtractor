package main

import (
	"fmt"

	"github.com/KhoalaS/RedditGqlExtractor/internal/utils"
)

func main() {
	testInput := `        "marketplace_impl"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I = 0x8


# instance fields
.field private final choiceMetadata:LKL/a;

.field private final claimData:LKL/b;

.field private final dropUiModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LQM/e;",
            ">;"
        }
    .end annotation
.end field

.field private final initialPosition:I


# direct methods
.method public constructor <init>(LKL/b;LKL/a;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LKL/b;",
            "LKL/a;",`
	fmt.Println(utils.GetFieldsLines(testInput))
}
