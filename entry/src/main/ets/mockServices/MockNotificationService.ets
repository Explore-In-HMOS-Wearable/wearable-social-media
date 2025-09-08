import { INotification } from '../model/Interface/INotification';
import { NotificationService } from '../service/NotificationService';
import { mockNotificationDataList } from './mockData/MockNotificationDataList';

export class MockNotificationService extends NotificationService {
  async fetchNotifications(): Promise<INotification[]> {
    return mockNotificationDataList
  }

  async handleFollow(notificationId: number, follow: boolean): Promise<boolean> {
    return true;
  }
}