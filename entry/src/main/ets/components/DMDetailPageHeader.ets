import dayjs from 'dayjs'
import relativeTime from 'dayjs/plugin/relativeTime'
import { IUserData } from '../model/Interface/IUserData'

dayjs.extend(relativeTime)

@Component
export struct DMDetailPageHeader {
  @Prop userData: IUserData

  build() {
    Row({
      space: 8
    }) {
      Image($r('app.media.back_icon'))
        .width(24)
        .height(24)

      Image((this.userData.photo))
        .width(36)
        .height(36)
        .borderRadius(20)

      Column() {
        Text(this.userData.username)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
        Text(dayjs().to(dayjs(this.userData.lastSeen)))
          .fontSize(12)
          .fontColor($r('app.color.mid_gray'))
      }

      Row() {
        Image($r('app.media.phone_icon'))
          .width(20)
          .height(20)

        Blank()
          .width('10%')

        Image($r('app.media.video_icon'))
          .width(24)
          .height(24)
      }
      .width('40%')
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .height(60)
    .padding({ left: 8, right: 8 })
    .backgroundColor(Color.White)

  }
}