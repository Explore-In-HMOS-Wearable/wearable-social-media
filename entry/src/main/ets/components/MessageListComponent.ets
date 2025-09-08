import { IChatDetailData } from '../model/Interface/IChatDetailData'

@Component
export struct MessageListItemComponent {
  @Prop chatDetailData: IChatDetailData

  build() {
    Row() {
      if (this.chatDetailData.senderType === 'other') {
        Image((this.chatDetailData?.sender?.photo))
          .width(24)
          .height(24)
          .borderRadius(20)
          .margin({ right: 10 })

        Text(this.chatDetailData.content)
          .backgroundColor($r('app.color.bg_message_sender'))
          .borderRadius(20)
          .padding(10)
          .width('%60')
      }

      if (this.chatDetailData.senderType === 'me') {
        Blank()

        Text(this.chatDetailData.content)
          .backgroundColor($r('app.color.bg_message_me'))
          .fontColor(Color.White)
          .borderRadius(20)
          .padding(10)
          .width('%60')
          .margin({ right: 10 })
      }
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 5, bottom: 5 })
  }
}