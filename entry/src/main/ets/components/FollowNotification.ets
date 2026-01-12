import { INotification } from '../model/Interface/INotification';
import Utils from '../Utils';

@Component
struct FollowNotification {
  @Prop notification: INotification;
  private isFollowing: boolean = false;
  onFollow: (id: number) => void = () => {
  };

  build() {
    Column() {
      Row() {
        Image((this.notification.fromUser.photo))
          .width(22)
          .height(22)
          .borderRadius(22);
        Text() {
          Span(this.notification.fromUser.username + `\n `).fontWeight(FontWeight.Bold);
          Span(this.notification.content + ` `);

        }
        .margin({ left: 10 })
        .fontSize(9)
        .textAlign(TextAlign.Start)
        .width('50%');


        Column() {
          Text() {
            Span(Utils.formatTime(new Date(this.notification.createdAt.toString().replace('.000Z', ''))))
              .fontColor(Color.Gray)
              .fontSize('8fp');
          }
          .textAlign(TextAlign.Start)
        }
        .width('15%');
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({ top: 8, bottom: 8 });
  }
}

export { FollowNotification };
