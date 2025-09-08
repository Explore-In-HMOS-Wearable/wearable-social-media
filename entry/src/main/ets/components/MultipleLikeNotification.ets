import { INotification } from '../model/Interface/INotification';
import Utils from '../Utils';

@Component
struct MultipleLikeNotification {
  @Prop notification: INotification;

  build() {
    Column() {
      Row() {
        Image((this.notification.fromUser.photo))
          .width(22)
          .height(22)
          .borderRadius(22);
        Text() {
          Span(this.notification.fromUser.username + '\n ').fontWeight(FontWeight.Bold);
          Span(this.notification.content + '  ').margin({ left: 10 });
        }
        .margin({ left: 10 })
        .fontSize(9)
        .textAlign(TextAlign.Start)
        .width('50%');

        Column() {
          Text() {
            Span(Utils.formatTime(new Date(this.notification.createdAt.toString().replace('.000Z', ''))))
              .fontColor(Color.Gray)
              .fontSize(7);
          }
          .textAlign(TextAlign.Start)
        }
        .width('15%');
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ top: 11, bottom: 11 })
    .width('100%');
  }
}

export { MultipleLikeNotification };
