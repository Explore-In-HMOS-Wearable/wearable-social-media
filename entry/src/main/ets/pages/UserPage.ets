import { ProfileInfoComponent } from '../components/ProfileInfoComponent';
import { ProfilePostsTabComponent } from '../components/ProfilePostsTabComponent';
import { IProfileResponse } from '../model/Interface/IProfileResponse';
import { getParams, routePageNoParams } from '../RouterUtils';
import { mockProfileResponseList } from '../mockServices/mockData/MockProfileResponseList';
import { IUserData } from '../model/Interface/IUserData';

@Entry
@Component
struct UserPage {
  @Prop currentUser: IUserData
  @State currentUserProfile: IProfileResponse = mockProfileResponseList[0]

  aboutToAppear(): void {
    this.currentUser = getParams() as IUserData

    this.currentUserProfile =
      mockProfileResponseList.find((item) => item.profile.user.id === this.currentUser.id) as IProfileResponse

  }

  navigateToSettingsPage() {
    routePageNoParams('pages/SettingsPage')
  }

  build() {
    Scroll() {
      Column() {
        ProfileInfoComponent({ user: this.currentUserProfile })

        ProfilePostsTabComponent({
          user: this.currentUserProfile
        })

      }.alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Start)
      .width('100%')
    }
    .width('100%').scrollable(ScrollDirection.Vertical)
  }
}

export { UserPage };