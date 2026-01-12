import { PostItem } from '../components/PostItem'
import { ExploreViewModel } from '../viewmodel/ExploreViewModel'
import { IPostData } from '../model/Interface/IPostData'

@Entry
@Component
struct ExplorePageListView {
  private postViewModel: ExploreViewModel = new ExploreViewModel()
  @State posts: Array<IPostData> = []

  private likePost(postId: number): void {
    this.postViewModel.likePost(postId, (updatedPosts) => {
      this.posts = [...updatedPosts]
    })
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.back_arrow_icon'))
          .width(60)
          .height(30)
          .objectFit(ImageFit.ScaleDown)

        Text($r('app.string.Explore_Text'))
          .fontWeight(FontWeight.Bold)
          .fontSize(16)
      }
      .width('100%')
      .padding(10)
      .backgroundColor($r('app.color.white'))

      List() {
        ForEach(this.posts, (post: IPostData) => {
          PostItem({
            postData: post
          })
        }, (item: string, index: number) => item)
      }
      .width('100%')
      .height('70%')
      .layoutWeight(1)
    }
  }
}

export { ExplorePageListView }