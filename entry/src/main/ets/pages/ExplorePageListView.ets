import { PostItem } from '../components/PostItem'
import { ExploreViewModel } from '../viewmodel/ExploreViewModel'
import { IPostData } from '../model/Interface/IPostData'

@Entry
@Component
struct ExplorePageListView {
  @State postViewModel: ExploreViewModel = new ExploreViewModel()
  @State posts: Array<IPostData> = []
  private likePost(postId: number): void {
    this.postViewModel.likePost(postId, (updatedPosts) => {
      this.posts = [...updatedPosts]
    })
  }

  aboutToAppear() {
    let paramObject = getParams() as IPostData
    this.postViewModel.loadPosts((fetchedPosts) => {
      this.posts = fetchedPosts
      this.posts.splice(0, 0, paramObject)
    })
  }

  build() {
    Column() {

      Row() {
        Image($r('app.media.back_arrow_icon'))
          .width(60)
          .height(30)
          .objectFit(ImageFit.ScaleDown).onClick(() => {
        })

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
            postData: post,
          })
        }, (item: string, index: number) => item)
      }
      .width('100%')
      .layoutWeight(1)
    }
  }
}

export { ExplorePageListView }