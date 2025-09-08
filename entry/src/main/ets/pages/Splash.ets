@Builder
export function SplashPageBuilder(name: string, param: Object) {
  Splash()
}

@Entry
@Component
export struct Splash {
  @State message: string = 'Welcome to \n Social App on \n Wearable ';
  pageInfos: NavPathStack = new NavPathStack();

  aboutToAppear() {
    this.init()
  }

  onPageShow(): void {
    this.init()
  }

  init() {
    this.pageInfos.pushPathByName('MenuPage', null);
  }

  build() {

    NavDestination() {

      Column() {

        Column() {

          Blank().height('15%')

          Text(this.message)
            .id('HelloWorld')
            .fontSize(21)
            .fontWeight(FontWeight.Bold)
            .height('50%')

          Image($r('app.media.user_icon'))
            .width('75vp')
            .margin({
              top: '-20.00vp',
              right: '0.00vp',
              bottom: '0.00vp',
              left: '0.00vp'
            })

        }.height('100%').width('100%')

      }
      .height('100%')
      .width('100%')
      .backgroundImage($r('app.media.background1'))
      .backgroundImageSize(ImageSize.FILL)
      .onClick(() => {

        this.pageInfos.pushPathByName('MenuPage', null);

      })

    }
    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })

  }
}