import { ExplorePage } from './ExplorePage'
import { NotificationPage } from './NotificationPage'
import { ProfilePage } from './ProfilePage'
import { WsNotification } from '../model/WsNotificationData'
import { emitter } from '@kit.BasicServicesKit'
import { IProfileResponse } from '../model/Interface/IProfileResponse'
import { mockProfileResponse2 } from '../mockServices/mockData/MockProfileResponse'
import { HomePage } from './HomePage'
import { TmpClass } from './MenuPage'
import { edgeWidths } from '@kit.ArkUI'
import { common2D, drawing } from '@kit.ArkGraphics2D'

@Builder
export function MainPageBuilder(name: string, param: Object) {
  MainPage()
}

@Component
export struct MainPage {
  private gridMargin: number = 100
  private gridGutter: number = 100
  private sm: number = -200
  @State currentIndex: number = 0
  @State notificationCount: number = 0
  private tabsController: TabsController = new TabsController()
  currentUser: IProfileResponse = mockProfileResponse2
  private newNotification: object = []
  pageInfos: NavPathStack = new NavPathStack();
  private color1: common2D.Color = {
    alpha: 255,
    red: 210,
    green: 210,
    blue: 210
  };
  private color2: common2D.Color = {
    alpha: 255,
    red: 77,
    green: 15,
    blue: 135
  };
  @State drawingColorFilterFirst: ColorFilter | undefined =
    drawing.ColorFilter.createBlendModeColorFilter(this.color1, drawing.BlendMode.SRC_IN);
  @State drawingColorFilterSecond: ColorFilter | undefined =
    drawing.ColorFilter.createBlendModeColorFilter(this.color2, drawing.BlendMode.SRC_IN);

  @Builder
  TabBuilder(index: number, normalImage: Resource, selectedImage: Resource, size: number, margin: string,
    marginLeft: string) {
    Column() {

      Image(normalImage)
        .width(size)
        .height(size)
        .renderMode(ImageRenderMode.Original)
        .foregroundColor($r('app.color.main_selected'))
        .margin({ bottom: margin })
        .colorFilter(this.currentIndex === index ? this.drawingColorFilterFirst : this.drawingColorFilterSecond)
    }
    .width('20%')
    .height('100%')
    .backgroundImageSize(ImageSize.FILL)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = index
      this.tabsController.changeIndex(index)
    })
  }

  handleNotification(message: string) {
    const wsMessage = JSON.parse(message) as WsNotification
    const types = ['comment', 'like', 'follow_request'];
    if (types.some(type => wsMessage.type.includes(type))) {
      this.notificationCount++
      const eventData: emitter.EventData = {
        data: wsMessage
      }
      emitter.emit('newNotification', eventData)
    }
  }

  build() {


    NavDestination() {

      Stack({ alignContent: Alignment.Bottom }) {

        Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
          TabContent() {
            HomePage()
          }
          .tabBar(this.TabBuilder(0, $r('app.media.home'), $r('app.media.home_selected_icon'), 14, '11vp', '18vp'))

          TabContent() {
            ExplorePage()
          }
          .tabBar(this.TabBuilder(1, $r('app.media.search'), $r('app.media.search_selected_icon'), 17, '-1vp',
            '7vp'))

          TabContent() {
            NotificationPage()
          }
          .tabBar(this.TabBuilder(3, $r('app.media.hearth'), $r('app.media.heart_selected_icon'), 17, '-1vp', '-7vp'))

          TabContent() {
            ProfilePage({ currentUser: this.currentUser })
          }
          .tabBar(this.TabBuilder(4, $r('app.media.profile_icon'), $r('app.media.profile_selected_icon'), 14, '11vp',
            '-18vp'))
        }
        .width('100%')
        .height('100%')
        .backgroundColor($r('app.color.home_background_color'))
        .barHeight('0vp')
        .barGridAlign({ sm: this.sm, margin: this.gridMargin, gutter: this.gridGutter })
        .barWidth('70%')
        .barBackgroundBlurStyle(BlurStyle.Thin,
          { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT })
        .backgroundImageResizable({ slice: edgeWidths(3) })
        .barPosition(BarPosition.End)
        .barBackgroundColor($r('app.color.sections_tab_color_selected'))
        .barMode(BarMode.Fixed)
        .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent) => {
          this.currentIndex = targetIndex;
          if (targetIndex === 3) {
            this.notificationCount = 0
          }
        })

        Column() {
          Row() {
            this.TabBuilder(0, $r('app.media.home'), $r('app.media.home_selected_icon'), 20, '7vp', '18vp')
            this.TabBuilder(1, $r('app.media.search5'), $r('app.media.search_selected_icon'), 19, '-3vp', '7vp')
            this.TabBuilder(2, $r('app.media.hearth'), $r('app.media.heart_selected_icon'), 19, '-3vp', '-7vp')
            this.TabBuilder(3, $r('app.media.profile_selected_icon'), $r('app.media.profile_selected_icon'), 17, '7vp',
              '-18vp')
          }.width('45%')
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .width('100%')
        .height('15%')
        .backgroundImage($r('app.media.background2'))
        .backgroundImageSize({ width: '100%', height: '100%' })
        .border({ width: 0 })

      }

    }

    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
      setTimeout(() => {
        this.tabsController.changeIndex((context.pathInfo.param as TmpClass).pageIndex)
      }, 0)

    })
  }
}



