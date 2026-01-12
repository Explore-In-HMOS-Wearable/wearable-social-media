import { INotification } from '../model/Interface/INotification';


const notificationList: Array<INotification> = []

export abstract class NotificationService {
  abstract fetchNotifications(): Promise<INotification[]>

  abstract handleFollow(notificationId: number, follow: boolean): Promise<boolean>
}
