.class public final enum Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0003\u0010\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "com/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean",
        "",
        "Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;",
        "<init>",
        "(Ljava/lang/String;I)V",
        "TRUE",
        "FALSE",
        "NONE",
        "mod_temporaryevents_public"
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
.field private static final synthetic $ENTRIES:LIc0/a;

.field private static final synthetic $VALUES:[Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

.field public static final enum FALSE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

.field public static final enum NONE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

.field public static final enum TRUE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;


# direct methods
.method private static final synthetic $values()[Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;
    .locals 3

    sget-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->TRUE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    sget-object v1, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->FALSE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    sget-object v2, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->NONE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    filled-new-array {v0, v1, v2}, [Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    const-string v1, "TRUE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->TRUE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    new-instance v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    const-string v1, "FALSE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->FALSE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    new-instance v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    const-string v1, "NONE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->NONE:Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    invoke-static {}, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->$values()[Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    move-result-object v0

    sput-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->$VALUES:[Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    invoke-static {v0}, Lkotlin/enums/a;->a([Ljava/lang/Enum;)LIc0/a;

    move-result-object v0

    sput-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->$ENTRIES:LIc0/a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()LIc0/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LIc0/a;"
        }
    .end annotation

    sget-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->$ENTRIES:LIc0/a;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;
    .locals 1

    const-class v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    return-object p0
.end method

.method public static values()[Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;
    .locals 1

    sget-object v0, Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;->$VALUES:[Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;

    return-object v0
.end method
