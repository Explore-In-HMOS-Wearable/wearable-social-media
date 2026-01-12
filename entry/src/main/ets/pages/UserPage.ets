import { ProfileInfoComponent } from '../components/ProfileInfoComponent';
import { ProfilePostsTabComponent } from '../components/ProfilePostsTabComponent';
import { IProfileResponse } from '../model/Interface/IProfileResponse';
import { mockProfileResponseList } from '../mockServices/mockData/MockProfileResponseList';
import { IUserData } from '../model/Interface/IUserData';

@Entry
@Component
struct UserPage {
  @State currentUserProfile: IProfileResponse = mockProfileResponseList[0]

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