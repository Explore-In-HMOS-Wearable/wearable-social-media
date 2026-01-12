import { NotificationViewModel } from '../viewmodel/NotificationViewModel';
import { NotificationGroup } from '../components/NotificationGroup';
import Utils from '../Utils';
import { emitter } from '@kit.BasicServicesKit';
import { INotification } from '../model/Interface/INotification';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct NotificationPage {
  private notificationViewModel: NotificationViewModel = new NotificationViewModel();
  @State notifications: Array<INotification> = [];
  followUser = (notificationId: number) => {
    this.notificationViewModel.followUser(notificationId, (updatedNotification) => {
      this.notifications = [...updatedNotification];
    });
  };
  private scrollerForScroll: Scroller = new Scroller()

  async aboutToAppear() {
    await this.notificationViewModel.loadNotifications((fetchedNotifications) => {
      this.notifications = fetchedNotifications;
    });
    emitter.on('newNotification', (notification: emitter.EventData) => {
      const notify = notification.data as INotification
      this.notifications.unshift(notify)
    })
  }

  build() {

    Column() {

      Scroll(this.scrollerForScroll) {
        Column() {
          Blank().height('35vp')
          NotificationGroup({
            title: Utils.getString($r('app.string.New_Text').id,
              (this.getUIContext().getHostContext() as common.UIAbilityContext)
            ),
            notifications: this.notifications,
            onFollow: this.followUser
          })

          Blank().height('35vp')

        }
        .padding({
          top: 1,
          bottom: 5,
          left: 16,
          right: 16
        })

        .margin({
          top: -5
        })

        .alignItems(HorizontalAlign.Start)
        .height('auto')
        .width('100%');
      }
      .scrollBar(BarState.Off)
      .height('90%')
      .width('100%')
      .scrollBarWidth('1.00vp')
      .scrollBarColor(Color.Transparent)
      .edgeEffect(EdgeEffect.Spring)
      .friction(0.6)

    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Black)
    .align(Alignment.TopStart)

  }
}

export { NotificationPage };
