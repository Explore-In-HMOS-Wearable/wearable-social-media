import { IPostData } from '../model/Interface/IPostData';
import { routePageWithObjectParams } from '../RouterUtils';

@Component
struct ProfilePostsGridComponent {
  @Prop userPosts: Array<IPostData>;
  customSize: number = 45

  @Builder
  gridItemBuilder(data: IPostData) {
    GridItem() {
      Image((data.photo))
        .width(this.customSize)
        .height(this.customSize)
        .objectFit(ImageFit.Cover)
    }
    .onClick(() => {
      routePageWithObjectParams('pages/PostDetailPage', data)
    })
  }

  build() {
    Grid() {
      ForEach(this.userPosts, (item: IPostData) => {
        this.gridItemBuilder(item)
      }, (item: string, index: number) => item)
    }
    .columnsTemplate('1fr 1fr 1fr')
    .width('70%')
    .columnsGap(1)
    .rowsGap(1)

  }
}

export { ProfilePostsGridComponent };