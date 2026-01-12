import { IPostData } from '../model/Interface/IPostData'
import { IProfileResponse } from '../model/Interface/IProfileResponse'
import { ProfilePostsGridComponent } from './ProfilePostsGridComponent'

@Component
struct ProfilePostsTabComponent {
  @Prop @Watch('onUserData') user: IProfileResponse
  @Prop userMentionedPosts: Array<IPostData>
  @State currentIndex: number = 0
  private tabsController: TabsController = new TabsController()

  @Builder
  TabBuilder(index: number, normalImage: Resource, selectedImage: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImage : normalImage)
        .width(24)
        .height(24)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = index
      this.tabsController.changeIndex(index)
    })
  }

  build() {
    ProfilePostsGridComponent({ userPosts: this.user.posts })
  }

  onUserData(changedPropertyName: string) {
  }
}

export { ProfilePostsTabComponent };