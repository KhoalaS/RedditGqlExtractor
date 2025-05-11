.class public final Lbh0/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LX9/a;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lnd0/j;

.field public final d:Lnd0/d;

.field public final e:Lnd0/k;

.field public final f:Lnd0/m;

.field public final g:Lnd0/a;

.field public final h:Lnd0/e;

.field public final i:Lnd0/l;

.field public final j:Lnd0/n;

.field public final k:Lnd0/i;

.field public final l:Lnd0/c;

.field public final m:Lnd0/g;

.field public final n:Lnd0/o;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/String;

.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lnd0/j;Lnd0/m;Lnd0/a;I)V
    .locals 2

    and-int/lit8 v0, p6, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object p2, v1

    :cond_0
    and-int/lit8 v0, p6, 0x4

    if-eqz v0, :cond_1

    move-object p3, v1

    :cond_1
    and-int/lit16 v0, p6, 0x80

    if-eqz v0, :cond_2

    move-object p4, v1

    :cond_2
    and-int/lit16 p6, p6, 0x100

    if-eqz p6, :cond_3

    move-object p5, v1

    :cond_3
    const-string p6, "noun"

    invoke-static {p1, p6}, Lkotlin/jvm/internal/f;->g(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbh0/a;->a:Ljava/lang/String;

    iput-object p2, p0, Lbh0/a;->b:Ljava/lang/String;

    iput-object p3, p0, Lbh0/a;->c:Lnd0/j;

    iput-object v1, p0, Lbh0/a;->d:Lnd0/d;

    iput-object v1, p0, Lbh0/a;->e:Lnd0/k;

    iput-object p4, p0, Lbh0/a;->f:Lnd0/m;

    iput-object p5, p0, Lbh0/a;->g:Lnd0/a;

    iput-object v1, p0, Lbh0/a;->h:Lnd0/e;

    iput-object v1, p0, Lbh0/a;->i:Lnd0/l;

    iput-object v1, p0, Lbh0/a;->j:Lnd0/n;

    iput-object v1, p0, Lbh0/a;->k:Lnd0/i;

    iput-object v1, p0, Lbh0/a;->l:Lnd0/c;

    iput-object v1, p0, Lbh0/a;->m:Lnd0/g;

    iput-object v1, p0, Lbh0/a;->n:Lnd0/o;

    iput-object v1, p0, Lbh0/a;->o:Ljava/lang/String;

    iput-object v1, p0, Lbh0/a;->p:Ljava/lang/String;

    iput-object v1, p0, Lbh0/a;->q:Ljava/lang/String;

    iput-object v1, p0, Lbh0/a;->r:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(LX9/e;)Lcom/google/protobuf/F1;
    .locals 4

    check-cast p1, LX9/c;

    invoke-static {}, Lcom/reddit/data/events/post/click/PostClick;->newBuilder()Lcom/reddit/data/events/post/click/b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    iget-object v2, p0, Lbh0/a;->a:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/reddit/data/events/post/click/PostClick;->access$3000(Lcom/reddit/data/events/post/click/PostClick;Ljava/lang/String;)V

    iget-object v1, p0, Lbh0/a;->b:Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$3800(Lcom/reddit/data/events/post/click/PostClick;Ljava/lang/String;)V

    :cond_0
    iget-object v1, p0, Lbh0/a;->c:Lnd0/j;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lnd0/j;->a()Lcom/reddit/corexdata/common/Post;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$4100(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/Post;)V

    :cond_1
    iget-object v1, p0, Lbh0/a;->d:Lnd0/d;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lnd0/d;->a()Lcom/reddit/corexdata/common/Listing;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$4400(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/Listing;)V

    :cond_2
    iget-object v1, p0, Lbh0/a;->e:Lnd0/k;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lnd0/k;->a()Lcom/reddit/corexdata/common/PostFlair;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$5600(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/PostFlair;)V

    :cond_3
    const/4 v1, 0x1

    iget-object v2, p0, Lbh0/a;->f:Lnd0/m;

    if-eqz v2, :cond_4

    invoke-virtual {v2, v1}, Lnd0/m;->a(Z)Lcom/reddit/corexdata/common/Subreddit;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v3, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v3, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v3, v2}, Lcom/reddit/data/events/post/click/PostClick;->access$7400(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/Subreddit;)V

    :cond_4
    iget-object v2, p0, Lbh0/a;->g:Lnd0/a;

    if-eqz v2, :cond_5

    invoke-virtual {v2, v1}, Lnd0/a;->a(Z)Lcom/reddit/corexdata/common/ActionInfo;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$8000(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/ActionInfo;)V

    :cond_5
    iget-object v1, p0, Lbh0/a;->h:Lnd0/e;

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Lnd0/e;->a()Lcom/reddit/corexdata/common/Media;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$8300(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/Media;)V

    :cond_6
    iget-object v1, p0, Lbh0/a;->i:Lnd0/l;

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lnd0/l;->a()Lcom/reddit/corexdata/common/Search;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$9500(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/Search;)V

    :cond_7
    iget-object v1, p0, Lbh0/a;->j:Lnd0/n;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lnd0/n;->a()Lcom/reddit/corexdata/common/TopicMetadata;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$11600(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/TopicMetadata;)V

    :cond_8
    iget-object v1, p0, Lbh0/a;->k:Lnd0/i;

    if-eqz v1, :cond_9

    invoke-virtual {v1}, Lnd0/i;->a()Lcom/reddit/corexdata/common/Poll;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$11900(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/Poll;)V

    :cond_9
    iget-object v1, p0, Lbh0/a;->l:Lnd0/c;

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Lnd0/c;->a()Lcom/reddit/corexdata/common/Feed;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$13100(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/Feed;)V

    :cond_a
    iget-object v1, p0, Lbh0/a;->m:Lnd0/g;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Lnd0/g;->a()Lcom/reddit/corexdata/common/NavigationSession;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$13700(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/NavigationSession;)V

    :cond_b
    iget-object v1, p0, Lbh0/a;->n:Lnd0/o;

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Lnd0/o;->a()Lcom/reddit/corexdata/common/TranslationMetrics;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$14300(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/corexdata/common/TranslationMetrics;)V

    :cond_c
    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    invoke-virtual {v1}, Lcom/reddit/data/events/post/click/PostClick;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$2400(Lcom/reddit/data/events/post/click/PostClick;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    invoke-virtual {v1}, Lcom/reddit/data/events/post/click/PostClick;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$2700(Lcom/reddit/data/events/post/click/PostClick;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    iget-wide v2, p1, LX9/c;->a:J

    invoke-static {v1, v2, v3}, Lcom/reddit/data/events/post/click/PostClick;->access$3300(Lcom/reddit/data/events/post/click/PostClick;J)V

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    iget-object v2, p1, LX9/c;->b:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/reddit/data/events/post/click/PostClick;->access$3500(Lcom/reddit/data/events/post/click/PostClick;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    iget-object v2, p1, LX9/c;->e:Lcom/reddit/data/common/client/app/App;

    invoke-static {v1, v2}, Lcom/reddit/data/events/post/click/PostClick;->access$5300(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/data/common/client/app/App;)V

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    iget-object v2, p1, LX9/c;->d:Lcom/reddit/data/common/client/session/Session;

    invoke-static {v1, v2}, Lcom/reddit/data/events/post/click/PostClick;->access$7700(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/data/common/client/session/Session;)V

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    iget-object v2, p1, LX9/c;->g:Lcom/reddit/data/common/client/platform/Platform;

    invoke-static {v1, v2}, Lcom/reddit/data/events/post/click/PostClick;->access$5900(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/data/common/client/platform/Platform;)V

    iget-object v1, p1, LX9/c;->c:Lcom/reddit/data/common/client/user/User;

    iget-object v2, p0, Lbh0/a;->o:Ljava/lang/String;

    if-nez v2, :cond_d

    goto :goto_0

    :cond_d
    invoke-virtual {v1}, Lcom/google/protobuf/F1;->toBuilder()Lcom/google/protobuf/z1;

    move-result-object v1

    check-cast v1, LWg/b;

    invoke-virtual {v1, v2}, LWg/b;->j(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/protobuf/z1;->d()Lcom/google/protobuf/F1;

    move-result-object v1

    check-cast v1, Lcom/reddit/data/common/client/user/User;

    :goto_0
    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$6800(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/data/common/client/user/User;)V

    iget-object v1, p1, LX9/c;->f:Lcom/reddit/data/common/client/screen/Screen;

    iget-object v2, p0, Lbh0/a;->p:Ljava/lang/String;

    if-nez v2, :cond_e

    goto :goto_1

    :cond_e
    invoke-virtual {v1}, Lcom/google/protobuf/F1;->toBuilder()Lcom/google/protobuf/z1;

    move-result-object v1

    check-cast v1, LUg/b;

    invoke-virtual {v1, v2}, LUg/b;->j(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/protobuf/z1;->d()Lcom/google/protobuf/F1;

    move-result-object v1

    check-cast v1, Lcom/reddit/data/common/client/screen/Screen;

    :goto_1
    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$5000(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/data/common/client/screen/Screen;)V

    iget-object v1, p1, LX9/c;->h:Lcom/reddit/data/common/client/request/Request;

    iget-object v2, p0, Lbh0/a;->q:Ljava/lang/String;

    if-nez v2, :cond_f

    goto :goto_2

    :cond_f
    invoke-virtual {v1}, Lcom/google/protobuf/F1;->toBuilder()Lcom/google/protobuf/z1;

    move-result-object v1

    check-cast v1, LTg/b;

    invoke-virtual {v1, v2}, LTg/b;->j(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/protobuf/z1;->d()Lcom/google/protobuf/F1;

    move-result-object v1

    check-cast v1, Lcom/reddit/data/common/client/request/Request;

    :goto_2
    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v2, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v2, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v2, v1}, Lcom/reddit/data/events/post/click/PostClick;->access$6200(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/data/common/client/request/Request;)V

    iget-object p1, p1, LX9/c;->i:Lcom/reddit/data/common/client/referrer/Referrer;

    if-eqz p1, :cond_10

    invoke-virtual {p1}, Lcom/google/protobuf/F1;->toBuilder()Lcom/google/protobuf/z1;

    move-result-object p1

    check-cast p1, LSg/b;

    if-nez p1, :cond_11

    :cond_10
    invoke-static {}, Lcom/reddit/data/common/client/referrer/Referrer;->newBuilder()LSg/b;

    move-result-object p1

    :cond_11
    iget-object v1, p0, Lbh0/a;->r:Ljava/lang/String;

    if-eqz v1, :cond_12

    invoke-virtual {p1, v1}, LSg/b;->j(Ljava/lang/String;)V

    :cond_12
    invoke-virtual {p1}, Lcom/google/protobuf/z1;->d()Lcom/google/protobuf/F1;

    move-result-object p1

    check-cast p1, Lcom/reddit/data/common/client/referrer/Referrer;

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->e()V

    iget-object v1, v0, Lcom/google/protobuf/z1;->b:Lcom/google/protobuf/F1;

    check-cast v1, Lcom/reddit/data/events/post/click/PostClick;

    invoke-static {v1, p1}, Lcom/reddit/data/events/post/click/PostClick;->access$6500(Lcom/reddit/data/events/post/click/PostClick;Lcom/reddit/data/common/client/referrer/Referrer;)V

    invoke-virtual {v0}, Lcom/google/protobuf/z1;->d()Lcom/google/protobuf/F1;

    move-result-object p1

    const-string v0, "buildPartial(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/f;->f(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lbh0/a;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lbh0/a;

    iget-object v1, p1, Lbh0/a;->a:Ljava/lang/String;

    iget-object v3, p0, Lbh0/a;->a:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lbh0/a;->b:Ljava/lang/String;

    iget-object v3, p1, Lbh0/a;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lbh0/a;->c:Lnd0/j;

    iget-object v3, p1, Lbh0/a;->c:Lnd0/j;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lbh0/a;->d:Lnd0/d;

    iget-object v3, p1, Lbh0/a;->d:Lnd0/d;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    const/4 v1, 0x0

    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    return v2

    :cond_6
    iget-object v3, p0, Lbh0/a;->e:Lnd0/k;

    iget-object v4, p1, Lbh0/a;->e:Lnd0/k;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    return v2

    :cond_7
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    return v2

    :cond_8
    iget-object v3, p0, Lbh0/a;->f:Lnd0/m;

    iget-object v4, p1, Lbh0/a;->f:Lnd0/m;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    return v2

    :cond_9
    iget-object v3, p0, Lbh0/a;->g:Lnd0/a;

    iget-object v4, p1, Lbh0/a;->g:Lnd0/a;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    return v2

    :cond_a
    iget-object v3, p0, Lbh0/a;->h:Lnd0/e;

    iget-object v4, p1, Lbh0/a;->h:Lnd0/e;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    return v2

    :cond_b
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    return v2

    :cond_c
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    return v2

    :cond_d
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    return v2

    :cond_e
    iget-object v3, p0, Lbh0/a;->i:Lnd0/l;

    iget-object v4, p1, Lbh0/a;->i:Lnd0/l;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    return v2

    :cond_f
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    return v2

    :cond_10
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    return v2

    :cond_11
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    return v2

    :cond_12
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    return v2

    :cond_13
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    return v2

    :cond_14
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    return v2

    :cond_15
    iget-object v3, p0, Lbh0/a;->j:Lnd0/n;

    iget-object v4, p1, Lbh0/a;->j:Lnd0/n;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_16

    return v2

    :cond_16
    iget-object v3, p0, Lbh0/a;->k:Lnd0/i;

    iget-object v4, p1, Lbh0/a;->k:Lnd0/i;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    return v2

    :cond_17
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    return v2

    :cond_18
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19

    return v2

    :cond_19
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    return v2

    :cond_1a
    iget-object v3, p0, Lbh0/a;->l:Lnd0/c;

    iget-object v4, p1, Lbh0/a;->l:Lnd0/c;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    return v2

    :cond_1b
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    return v2

    :cond_1c
    iget-object v3, p0, Lbh0/a;->m:Lnd0/g;

    iget-object v4, p1, Lbh0/a;->m:Lnd0/g;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1d

    return v2

    :cond_1d
    invoke-static {v1, v1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lbh0/a;->n:Lnd0/o;

    iget-object v3, p1, Lbh0/a;->n:Lnd0/o;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    return v2

    :cond_1f
    iget-object v1, p0, Lbh0/a;->o:Ljava/lang/String;

    iget-object v3, p1, Lbh0/a;->o:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    return v2

    :cond_20
    iget-object v1, p0, Lbh0/a;->p:Ljava/lang/String;

    iget-object v3, p1, Lbh0/a;->p:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    return v2

    :cond_21
    iget-object v1, p0, Lbh0/a;->q:Ljava/lang/String;

    iget-object v3, p1, Lbh0/a;->q:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lbh0/a;->r:Ljava/lang/String;

    iget-object p1, p1, Lbh0/a;->r:Ljava/lang/String;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_23

    return v2

    :cond_23
    return v0
.end method

.method public final hashCode()I
    .locals 4

    iget-object v0, p0, Lbh0/a;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Lbh0/a;->b:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->c:Lnd0/j;

    if-nez v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Lnd0/j;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->d:Lnd0/d;

    if-nez v2, :cond_2

    move v2, v1

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Lnd0/d;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit16 v0, v0, 0x3c1

    iget-object v2, p0, Lbh0/a;->e:Lnd0/k;

    if-nez v2, :cond_3

    move v2, v1

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Lnd0/k;->hashCode()I

    move-result v2

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit16 v0, v0, 0x3c1

    iget-object v2, p0, Lbh0/a;->f:Lnd0/m;

    if-nez v2, :cond_4

    move v2, v1

    goto :goto_4

    :cond_4
    invoke-virtual {v2}, Lnd0/m;->hashCode()I

    move-result v2

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->g:Lnd0/a;

    if-nez v2, :cond_5

    move v2, v1

    goto :goto_5

    :cond_5
    invoke-virtual {v2}, Lnd0/a;->hashCode()I

    move-result v2

    :goto_5
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->h:Lnd0/e;

    if-nez v2, :cond_6

    move v2, v1

    goto :goto_6

    :cond_6
    invoke-virtual {v2}, Lnd0/e;->hashCode()I

    move-result v2

    :goto_6
    add-int/2addr v0, v2

    const v2, 0xe1781

    mul-int/2addr v0, v2

    iget-object v3, p0, Lbh0/a;->i:Lnd0/l;

    if-nez v3, :cond_7

    move v3, v1

    goto :goto_7

    :cond_7
    invoke-virtual {v3}, Lnd0/l;->hashCode()I

    move-result v3

    :goto_7
    add-int/2addr v0, v3

    const v3, 0x67e12cdf

    mul-int/2addr v0, v3

    iget-object v3, p0, Lbh0/a;->j:Lnd0/n;

    if-nez v3, :cond_8

    move v3, v1

    goto :goto_8

    :cond_8
    invoke-virtual {v3}, Lnd0/n;->hashCode()I

    move-result v3

    :goto_8
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    iget-object v3, p0, Lbh0/a;->k:Lnd0/i;

    if-nez v3, :cond_9

    move v3, v1

    goto :goto_9

    :cond_9
    invoke-virtual {v3}, Lnd0/i;->hashCode()I

    move-result v3

    :goto_9
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    iget-object v2, p0, Lbh0/a;->l:Lnd0/c;

    if-nez v2, :cond_a

    move v2, v1

    goto :goto_a

    :cond_a
    invoke-virtual {v2}, Lnd0/c;->hashCode()I

    move-result v2

    :goto_a
    add-int/2addr v0, v2

    mul-int/lit16 v0, v0, 0x3c1

    iget-object v2, p0, Lbh0/a;->m:Lnd0/g;

    if-nez v2, :cond_b

    move v2, v1

    goto :goto_b

    :cond_b
    invoke-virtual {v2}, Lnd0/g;->hashCode()I

    move-result v2

    :goto_b
    add-int/2addr v0, v2

    mul-int/lit16 v0, v0, 0x3c1

    iget-object v2, p0, Lbh0/a;->n:Lnd0/o;

    if-nez v2, :cond_c

    move v2, v1

    goto :goto_c

    :cond_c
    invoke-virtual {v2}, Lnd0/o;->hashCode()I

    move-result v2

    :goto_c
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->o:Ljava/lang/String;

    if-nez v2, :cond_d

    move v2, v1

    goto :goto_d

    :cond_d
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_d
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->p:Ljava/lang/String;

    if-nez v2, :cond_e

    move v2, v1

    goto :goto_e

    :cond_e
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_e
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->q:Ljava/lang/String;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_f

    :cond_f
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_f
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lbh0/a;->r:Ljava/lang/String;

    if-nez v2, :cond_10

    goto :goto_10

    :cond_10
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_10
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PostClick(noun="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lbh0/a;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", correlationId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", post="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->c:Lnd0/j;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", listing="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->d:Lnd0/d;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", comment=null, postFlair="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->e:Lnd0/k;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", userPreferences=null, subreddit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->f:Lnd0/m;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", actionInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->g:Lnd0/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", media="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->h:Lnd0/e;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", profile=null, experiment=null, userSubreddit=null, search="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->i:Lnd0/l;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", outbound=null, adblock=null, metaflair="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", metaSearch=null, banner=null, customFeed=null, topicMetadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->j:Lnd0/n;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", poll="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->k:Lnd0/i;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", playback=null, gallery=null, adClick=null, feed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->l:Lnd0/c;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", adMetadata=null, navigationSession="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->m:Lnd0/g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", chat=null, translationMetrics="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->n:Lnd0/o;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", userLoggedInId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->o:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", screenViewType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->p:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", requestBaseUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->q:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", referrerDomain="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbh0/a;->r:Ljava/lang/String;

    const/16 v2, 0x29

    invoke-static {v0, v1, v2}, Landroidx/compose/material3/h0;->o(Ljava/lang/StringBuilder;Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
