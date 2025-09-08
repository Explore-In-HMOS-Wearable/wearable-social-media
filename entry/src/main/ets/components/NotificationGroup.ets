import { FollowNotification } from './FollowNotification';
import { LikeNotification } from './LikeNotification';
import { MultipleLikeNotification } from './MultipleLikeNotification';
import { INotification } from '../model/Interface/INotification';

@Component
struct NotificationGroup {
  @Prop title: string;
  onFollow: (id: number) => void = () => {
  };
  @Prop notifications: Array<INotification> = [];

  build() {
    Column() {
      ForEach(this.notifications, (notification: INotification) => {
        FollowNotification({ notification: notification, onFollow: this.onFollow });
      }, (item: string, index: number) => item)

      ForEach(this.notifications, (notification: INotification) => {
        LikeNotification({ notification: notification });
      }, (item: string, index: number) => item)

      ForEach(this.notifications, (notification: INotification) => {
        MultipleLikeNotification({ notification: notification });
      }, (item: string, index: number) => item)

    }.height('100%').width('100%')
  }
}

export { NotificationGroup }