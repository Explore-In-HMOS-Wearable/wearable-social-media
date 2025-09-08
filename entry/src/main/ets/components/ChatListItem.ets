import { IChatData } from '../model/Interface/IChatData'
import { routePageWithObjectParams } from '../RouterUtils'

@Component
struct ChatListItem {
  @Prop chatData: IChatData

  build() {
    Row() {
      Stack() {
        Image((this.chatData.user.photo))
          .width(48)
          .height(48)
          .borderRadius(24)
      }
      .margin({ right: 12 })

      Column() {
        Row() {
          Text(this.chatData.user.username)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Blank()
          Text(this.chatData.time)
            .fontSize(14)
            .padding(4)
            .fontColor('#666666')
        }
        .alignSelf(ItemAlign.Start)

        Text(this.chatData.lastMessage)
          .fontSize(14)
          .fontColor(this.chatData.unread ? $r('app.color.black') : $r('app.color.mid_gray'))
          .margin({ top: 4 })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .alignSelf(ItemAlign.Start)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .onClick(() => {
      routePageWithObjectParams('pages/DirectMessageDetailPage', this.chatData.user)
    })

  }
}

export { ChatListItem }