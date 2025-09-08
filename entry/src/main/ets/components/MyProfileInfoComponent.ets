import { IProfileResponse } from '../model/Interface/IProfileResponse';

@Component
struct MyProfileInfoComponent {
  @Prop user: IProfileResponse
  onFollowerClick: () => void = () => {
  }
  onFollowingClick: () => void = () => {
  }

  build() {
    Column({ space: 1 }) {

      Row() {
        Blank()

        Image($r(this.user.profile.photo))
          .width(40)
          .height(40)
          .borderRadius(80)

        Blank()

        Row() {
          Column({ space: 6 }) {
            Text(this.user?.postCount?.toString())
            Text($r('app.string.Posts_Text'))
              .fontSize(7)

          }.height('100%')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .width('33%')

          Column({ space: 6 }) {
            Text(this.user?.followerCount?.toString())
            Text($r('app.string.Followers_Text'))
              .fontSize(7)

          }
          .height('100%')
          .width('33%')

          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .onClick(() => {
            this.onFollowerClick()
          })

          Column({ space: 6 }) {
            Text(this.user?.followingCount?.toString())
            Text($r('app.string.Following_Text'))
              .fontSize(7)

          }
          .width('33%')

          .height('100%')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .onClick(() => {
            this.onFollowingClick()
          })

        }
        .height('90%')
        .width('70%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.SpaceEvenly)
      }
      .height('100%')
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
    }
    .height('20%')
    .width('80%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
    .margin({ top: '1%' })
  }
}

export { MyProfileInfoComponent };