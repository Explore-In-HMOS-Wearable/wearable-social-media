import { IPostData } from '../model/Interface/IPostData'

@Component
struct ProfileMentionedPostsGridComponent {
  @Prop userMentionedPosts: Array<IPostData>
  customSize: number = 129

  @Builder
  gridItemBuilder(data: IPostData) {
    GridItem() {
      Image((data.photo))
        .width(this.customSize)
        .height(this.customSize)
        .objectFit(ImageFit.Cover)
    }
    .onClick(() => {
    })
  }

  build() {
    Grid() {

      ForEach(this.userMentionedPosts, (item: IPostData) => {
        this.gridItemBuilder(item)
      }, (item: string, index: number) => item)

    }
    .columnsTemplate('1fr 1fr 1fr')
    .width('100%')
    .columnsGap(0)
    .rowsGap(0)
  }
}

export { ProfileMentionedPostsGridComponent };