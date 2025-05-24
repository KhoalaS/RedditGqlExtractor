.class public final LJG/Fl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv4/J;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Z

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/Object;

.field public final h:Lcom/reddit/type/FlairTextColor;

.field public final i:Lcom/reddit/type/FlairAllowableContent;

.field public final j:I


# direct methods
.method public constructor <init>(ILcom/reddit/type/FlairAllowableContent;Lcom/reddit/type/FlairTextColor;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, LJG/Fl;->a:Ljava/lang/String;

    iput-boolean p9, p0, LJG/Fl;->b:Z

    iput-boolean p10, p0, LJG/Fl;->c:Z

    iput-object p6, p0, LJG/Fl;->d:Ljava/lang/String;

    iput-object p7, p0, LJG/Fl;->e:Ljava/lang/String;

    iput-object p8, p0, LJG/Fl;->f:Ljava/lang/String;

    iput-object p4, p0, LJG/Fl;->g:Ljava/lang/Object;

    iput-object p3, p0, LJG/Fl;->h:Lcom/reddit/type/FlairTextColor;

    iput-object p2, p0, LJG/Fl;->i:Lcom/reddit/type/FlairAllowableContent;

    iput p1, p0, LJG/Fl;->j:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, LJG/Fl;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, LJG/Fl;

    iget-object v1, p1, LJG/Fl;->a:Ljava/lang/String;

    iget-object v3, p0, LJG/Fl;->a:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/f;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-boolean v1, p0, LJG/Fl;->b:Z

    iget-boolean v3, p1, LJG/Fl;->b:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-boolean v1, p0, LJG/Fl;->c:Z

    iget-boolean v3, p1, LJG/Fl;->c:Z

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, LJG/Fl;->d:Ljava/lang/String;

    iget-object v3, p1, LJG/Fl;->d:Ljava/lang/String;

    if-nez v1, :cond_6

    if-nez v3, :cond_5

    move v1, v0

    goto :goto_1

    :cond_5
    :goto_0
    move v1, v2

    goto :goto_1

    :cond_6
    if-nez v3, :cond_7

    goto :goto_0

    :cond_7
    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :goto_1
    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, LJG/Fl;->e:Ljava/lang/String;

    iget-object v3, p1, LJG/Fl;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, LJG/Fl;->f:Ljava/lang/String;

    iget-object v3, p1, LJG/Fl;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    return v2

    :cond_a
    iget-object v1, p0, LJG/Fl;->g:Ljava/lang/Object;

    iget-object v3, p1, LJG/Fl;->g:Ljava/lang/Object;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    return v2

    :cond_b
    iget-object v1, p0, LJG/Fl;->h:Lcom/reddit/type/FlairTextColor;

    iget-object v3, p1, LJG/Fl;->h:Lcom/reddit/type/FlairTextColor;

    if-eq v1, v3, :cond_c

    return v2

    :cond_c
    iget-object v1, p0, LJG/Fl;->i:Lcom/reddit/type/FlairAllowableContent;

    iget-object v3, p1, LJG/Fl;->i:Lcom/reddit/type/FlairAllowableContent;

    if-eq v1, v3, :cond_d

    return v2

    :cond_d
    iget v1, p0, LJG/Fl;->j:I

    iget p1, p1, LJG/Fl;->j:I

    if-eq v1, p1, :cond_e

    return v2

    :cond_e
    return v0
.end method

.method public final hashCode()I
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, LJG/Fl;->a:Ljava/lang/String;

    if-nez v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    const/16 v2, 0x1f

    mul-int/2addr v1, v2

    iget-boolean v3, p0, LJG/Fl;->b:Z

    invoke-static {v1, v2, v3}, Landroidx/activity/b;->h(IIZ)I

    move-result v1

    iget-boolean v3, p0, LJG/Fl;->c:Z

    invoke-static {v1, v2, v3}, Landroidx/activity/b;->h(IIZ)I

    move-result v1

    iget-object v3, p0, LJG/Fl;->d:Ljava/lang/String;

    if-nez v3, :cond_1

    move v3, v0

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, LJG/Fl;->e:Ljava/lang/String;

    if-nez v3, :cond_2

    move v3, v0

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, LJG/Fl;->f:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Landroidx/compose/foundation/text/modifiers/m;->d(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, LJG/Fl;->g:Ljava/lang/Object;

    if-nez v3, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_3
    add-int/2addr v1, v0

    mul-int/2addr v1, v2

    iget-object v0, p0, LJG/Fl;->h:Lcom/reddit/type/FlairTextColor;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget-object v1, p0, LJG/Fl;->i:Lcom/reddit/type/FlairAllowableContent;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/2addr v1, v2

    iget v0, p0, LJG/Fl;->j:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, LJG/Fl;->d:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "null"

    goto :goto_0

    :cond_0
    invoke-static {v0}, LbJ/b;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "FlairTemplateFragment(id="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, LJG/Fl;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", isModOnly="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, LJG/Fl;->b:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isEditable="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, LJG/Fl;->c:Z

    const-string v3, ", backgroundColor="

    const-string v4, ", text="

    invoke-static {v3, v0, v4, v1, v2}, LJG/B2;->B(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    iget-object v0, p0, LJG/Fl;->e:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", type="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, LJG/Fl;->f:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", richtext="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, LJG/Fl;->g:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", textColor="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, LJG/Fl;->h:Lcom/reddit/type/FlairTextColor;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", allowableContent="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, LJG/Fl;->i:Lcom/reddit/type/FlairAllowableContent;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", maxEmojis="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, LJG/Fl;->j:I

    const-string v2, ")"

    invoke-static {v0, v2, v1}, Lk7/r0;->s(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
