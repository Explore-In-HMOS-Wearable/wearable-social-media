import { IProfileResponse } from '../model/Interface/IProfileResponse';

interface Follow {
  followingId: number
}

@Component
struct ProfileInfoComponent {
  @Prop user: IProfileResponse;
  @State followState: boolean = false;

  build() {
    Column({ space: 10 }) {
      Row() {
        Image($r(this.user.profile.photo))
          .width(80)
          .height(80)
          .borderRadius(80);
        Row() {
          Column({ space: 6 }) {
            Text(this.user.posts.length.toString());
            Text($r('app.string.Posts_Text'))
              .fontSize(14);
          }
          .height('100%')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center);

          Column({ space: 6 }) {
            Text(this.user?.followerCount?.toString());
            Text($r('app.string.Followers_Text'))
              .fontSize(14);
          }
          .height('100%')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center);

          Column({ space: 6 }) {
            Text(this.user?.followingCount?.toString());
            Text($r('app.string.Following_Text'))
              .fontSize(14);
          }
          .height('100%')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center);
        }
        .height('90%')
        .width('90%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.SpaceEvenly);
      }
      .height('30%')
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start);

      Column({ space: 10 }) {
        Text(this.user.profile.user?.username);
        Text(this.user?.profile.biography);
      }
      .height('30%')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.End);

      Row() {
        Button(this.user.isFollowed ? 'Unfollow' : 'Follow', { type: ButtonType.Normal })
          .onClick(() => {
            if (this.user.isFollowed) {
              this.user.followerCount--;
            } else {
              this.user.followerCount++;
            }
            this.user.isFollowed = !this.user.isFollowed;
          })
          .borderRadius(5)
          .width('100%')
          .height('80%')
          .backgroundColor($r('app.color.forgot_password_blue'))
          .fontColor($r('app.color.white'));
      }
      .height('15%')
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween);
    }
    .height('30%')
    .width('90%')
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.End);
  }
}

export { ProfileInfoComponent };