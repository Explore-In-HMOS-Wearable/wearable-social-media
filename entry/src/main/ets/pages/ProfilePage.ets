import { MyProfileInfoComponent } from '../components/MyProfileInfoComponent';
import { TopBarComponent } from '../components/TopBarComponent';
import { ProfilePostsTabComponent } from '../components/ProfilePostsTabComponent';
import { routePageNoParams } from '../RouterUtils';
import { IProfileResponse } from '../model/Interface/IProfileResponse';
import { MockProfileResponse_2 } from '../mockServices/mockData/MockProfileResponse';

@Entry
@Component
struct ProfilePage {
  @State shouldShowSettingsPage: boolean = false
  @State showFollowers: boolean = false
  @State showFollowings: boolean = false
  @State currentUser: IProfileResponse = MockProfileResponse_2

  @Builder
  FollowerList() {
    Column() {
      List() {
        ForEach(this.currentUser.followers, (item: IProfileResponse) => {
          ListItem() {
            Row() {
              Image(`${item.profile?.photo}`)
                .width(44)
                .height(44)
                .borderRadius(22);
              Text() {
                Span(item.profile.user.username).fontWeight(FontWeight.Bold);
              }
              .margin({ left: 10 })
              .fontSize(14)
              .width('50%');
            }

          }
        }, (item: string, index: number) => item)
      }
    }.padding(20)
  }

  @Builder
  FollowingList() {
    Column() {
      List() {
        ForEach(this.currentUser.followings, (item: IProfileResponse) => {
          ListItem() {
            Row() {
              Image($r(this.currentUser.profile.photo))
                .width(44)
                .height(44)
                .borderRadius(22);
              Text() {
                Span(item.profile.user.username).fontWeight(FontWeight.Bold);
              }
              .margin({ left: 10 })
              .fontSize(14)
              .width('50%');
            }
          }
        }, (item: string, index: number) => item)
      }
    }.padding(20)
  }

  aboutToAppear() {

  }

  navigateToSettingsPage() {
    routePageNoParams('pages/SettingsPage')
  }

  build() {
    Scroll() {

      Column({ space: 3 }) {
        TopBarComponent({
          user: this.currentUser,
          onClickFunction: this.navigateToSettingsPage
        })
        MyProfileInfoComponent({
          user: this.currentUser,
          onFollowerClick: () => this.showFollowers = true,
          onFollowingClick: () => this.showFollowings = true
        })

        ProfilePostsTabComponent({
          user: this.currentUser
        })

      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .height('100%')
      .padding({ top: '5%' })
      .bindSheet(this.showFollowers, this.FollowerList(),
        { height: 500, onDisappear: () => this.showFollowers = false })

    }
    .width('100%').scrollable(ScrollDirection.Vertical)
    .backgroundColor(Color.Black)
    .bindSheet(this.showFollowings, this.FollowingList(),
      { height: 500, onDisappear: () => this.showFollowings = false })
  }
}

export { ProfilePage };
