import { ICommentData } from '../model/Interface/ICommentData';

@Component
struct CommentItem {
  @Prop comment: ICommentData;
  @State isLiked: boolean = false;

  build() {
    Row() {
      Column() {
        Row() {
          Text(this.comment.user.username)
            .fontSize(14)
            .fontWeight(FontWeight.Bold);

          Text(this.comment.createdAt)
            .margin({ left: 8 })
            .fontColor(Color.Gray)
            .fontSize(12);
        }.margin({ bottom: 4 });

        Row() {
          Text(this.comment.content)
            .fontSize(14)
            .lineHeight(20);
        }
        .margin({ bottom: 4 });

        Row() {

          Text($r('app.string.Reply'))
            .fontColor(Color.Gray)
            .fontSize(12);

          Text($r('app.string.SeeTranslation'))
            .margin({ left: 20 })
            .fontColor(Color.Gray)
            .fontSize(12);
        }
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 5 });


      Image(this.isLiked ? $r('app.media.heart_selected_icon') :
        $r('app.media.heart_icon'))
        .width(16)
        .height(16)
        .onClick(() => {
          this.isLiked = !this.isLiked;
        });
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
    .margin({ bottom: 10 })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center);
  }
}

export { CommentItem };
