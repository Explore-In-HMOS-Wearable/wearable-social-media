@Builder
export function MenuPageBuilder(name: string, param: Object) {
  MenuPage()
}

@Observed
export class TmpClass {
  pageIndex: number = -1;

  constructor(pageIndex: number) {
    this.pageIndex = pageIndex;
  }
}

@Component
export struct MenuPage {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        List({ space: 7 }) {
          this.ButtonIcon($r('app.media.home'), 'Home', '18vp', 0)
          this.ButtonIcon($r('app.media.story3'), 'Stories', '19vp', 1)
          this.ButtonIcon($r('app.media.hearth'), 'Activity', '15vp', 2)
          this.ButtonIcon($r('app.media.searchicon'), 'Explore', '17vp', 3)
        }
        .scrollBar(BarState.Off)
        .alignListItem(ListItemAlign.Center)
        .alignSelf(ItemAlign.Center)
      }
      .height('100%')
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Black)
    }
    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })
  }

  @Builder
  ButtonIcon(resource: Resource, name: string, width: string, pageIndex: number) {
    ListItem() {
      Row({ space: 11 }) {
        Column() {
          Image(resource)
            .height(width)
            .objectFit(ImageFit.Contain)
        }
        .width('45vp')

        Text(name).fontColor(Color.White).fontSize(12)
      }
      .width('70%')
      .height('15%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .backgroundColor('#ff000000')
      .backgroundImage($r('app.media.background2'))
      .backgroundImageSize(ImageSize.FILL)
      .borderRadius(10)
      .onClick(() => {
        this.pageInfos.pushPathByName('MainPage', new TmpClass(pageIndex));
      })
    }
  }
}
