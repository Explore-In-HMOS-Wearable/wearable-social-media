import { IPostData } from '../model/Interface/IPostData';

@Component
struct ExploreGridComponent {
  @Prop explorePosts: Array<IPostData> = [];
  customSize: number = 128
  onClickFunction: (postData: IPostData) => void = () => {
  }

  aboutToAppear(): void {
  }

  @Builder
  gridItemBuilder(item: IPostData) {
    GridItem() {
      Image((item.photo))
        .width(this.customSize)
        .height(this.customSize)
        .objectFit(ImageFit.Cover)
    }
    .onClick(() => {
      this.onClickFunction(item)
    })
  }

  build() {
    Grid() {
      ForEach(this.explorePosts, (item: IPostData) => {
        this.gridItemBuilder(item)
      }, (item: string, index: number) => item)
    }
    .columnsTemplate('1fr 1fr 1fr')
    .width('100%')
    .height('100%')
    .columnsGap(2)
    .rowsGap(2)
    .padding({ bottom: 100 })
  }
}

export { ExploreGridComponent };