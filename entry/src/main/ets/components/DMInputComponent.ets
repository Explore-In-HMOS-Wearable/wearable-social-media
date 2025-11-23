import { mockChatDetailDataList } from '../mockServices/mockData/mockChatDetailData';
import { IChatDetailData } from '../model/Interface/IChatDetailData';
import { SendMessage } from '../model/sendMessage';

@Component
export default struct DmInputComponent {
  @State private message: string = mockChatDetailDataList[0].content;
  @State messageList: Array<IChatDetailData>=mockChatDetailDataList

aboutToAppear(): void {
  }


  build() {
    Flex({
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center,
    }) {

      Row() {
        Flex({
          direction: FlexDirection.Row,
          justifyContent: FlexAlign.Start,
          alignItems: ItemAlign.Center,
        }) {
          Button({
            type: ButtonType.Normal,
            stateEffect: true,
          }) {
            Image($r('app.media.camera_icon'))
              .width(28)
              .height(28)
              .fillColor(Color.Grey);
          }
          .width(30)
          .height(30)
          .backgroundColor(Color.Transparent)
          .onClick(() => {
          });
          TextInput({
            placeholder: 'Type message...',
            text: this.message,
          })
            .flexGrow(1)
            .height(40)
            .backgroundColor($r('app.color.input_grey'))
            .borderRadius(20)
            .padding({ left: 12, right: 12 })
            .backgroundColor($r('app.color.input_grey'))
            .fontSize(12)
            .onChange((value: string) => {
              this.message = value;
            });
          Button({
            type: ButtonType.Normal,
            stateEffect: true,
          }) {
            Image($r('app.media.share_icon'))
              .width(20)
              .height(20)
              .fillColor(this.message.trim().length > 0 ? Color.Blue : Color.Grey);
          }
          .width(20)
          .height(20)
          .backgroundColor(Color.Transparent)
          .enabled(this.message.trim().length > 0)
          .onClick(() => {
            if (this.message.trim().length > 0) {

              const message: SendMessage = {
                event: 'sendMessage',
                data: {
                  senderId: '7',
                  receiverId: '3',
                  content: this.message
                }
              }

              this.messageList.push({
                id: 1,
                content: this.message,
                createdAt: new Date(),
                senderType: 'me'
              })
              this.message = '';
            }
          });
        }
        .flexGrow(1)
        .backgroundColor($r('app.color.input_grey'))
        .borderRadius(20)
        .border({ width: 1, color: $r('app.color.input_grey') })
        .padding({ left: 8, right: 8 });

      }
      .width('100%')
      .padding({
        left: 12,
        right: 12,
        top: 8,
        bottom: 8
      })
      .backgroundColor(Color.White);
    }
  }
}
