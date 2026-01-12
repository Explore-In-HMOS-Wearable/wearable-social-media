import { MockCommentService } from '../mockServices/MockCommentService';
import { ICommentData } from '../model/Interface/ICommentData';

@Component
export default struct CommentInput {
  @State private message: string = '';
  @Prop postId: number;
  @Link selectedComments: Array<ICommentData>;
  private commentService: MockCommentService = new MockCommentService();
  emojiList = ['❤️', '🙌', '🔥', '👏', '😢', '😍', '😮', '😂'];

  build() {
    Column() {
      Row() {
        ForEach(this.emojiList, (emoji: string) => {
          Text(emoji)
            .fontSize(18)
            .onClick(() => {
              this.message += emoji
            })
            .padding({ left: 8, right: 8 });
        }, (item: string, index: number) => item)

      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        top: 8,
        bottom: 8
      });
      Row() {
        TextInput({
          placeholder: 'Add a comment...',
          text: this.message
        })
          .height(40)
          .width('90%')
          .backgroundColor(Color.Gray)
          .borderRadius(20)
          .padding({ left: 12, right: 12 })
          .fontSize(14)
          .onChange((value: string) => {
            this.message = value;
          });
        Button({
          type: ButtonType.Normal,
          stateEffect: true
        }) {
          Image($r('app.media.share_icon'))
            .width(20)
            .height(20)
            .fillColor(this.message.trim().length > 0 ? Color.Blue : Color.Grey);
        }
        .width(40)
        .height(40)
        .backgroundColor(Color.Transparent)
        .enabled(this.message.trim().length > 0)
        .onClick(async () => {
          if (this.message.trim().length > 0) {
            try {
              const newComment = await this.commentService.addComment(this.postId, this.message);
              this.selectedComments = [...this.selectedComments, newComment];
              this.message = '';
            } catch (error) {
            }
          }
        });
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ bottom: 16 })
      .padding({
        left: 16,
        right: 16,
        top: 8,
        bottom: 8
      })
      .backgroundColor(Color.White)
      .borderRadius(20);
    }
    .shadow({
      radius: 10,
      color: Color.Black,
      offsetX: 20,
      offsetY: 20
    })
    .width('100%')
    .backgroundColor(Color.White);
  }
}
