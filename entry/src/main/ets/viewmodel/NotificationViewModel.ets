import { mockPostData } from '../mockServices/mockData/MockPostData';
import { mockUserData2, mockUserData3 } from '../mockServices/mockData/MockUserData';
import { MockNotificationService } from '../mockServices/MockNotificationService';
import { INotification } from '../model/Interface/INotification';
import { NotificationType } from '../model/NotificationModel';

const timestamp: number = Date.now();

const dateFromTimestamp: Date = new Date(timestamp);


export class NotificationViewModel {
  private notificationService: MockNotificationService = new MockNotificationService();
  private _notifications: Array<INotification> = [];
  private _isLoading: boolean = false;
  private _error: string | null = null;

  getNotifications(): Array<INotification> {
    return this._notifications;
  }

  getIsLoading(): boolean {
    return this._isLoading;
  }

  getError(): string | null {
    return this._error;
  }

  async loadNotifications(
    updateCallback: (notifications: Array<INotification>, isLoading: boolean, error: string | null) => void
  ) {

    try {
      this._isLoading = true;
      this._error = null;
      updateCallback(this._notifications, this._isLoading, this._error);
      const fetchedNotifications = mockNotificationDataList;
      this._notifications = fetchedNotifications;
      this._isLoading = false;

      updateCallback(this._notifications, this._isLoading, this._error);
    } catch (error) {
      this._error = 'Error when loading notifications';
      this._isLoading = false;

      updateCallback(this._notifications, this._isLoading, this._error);
    }
  }

  async followUser(
    notificationId: number,
    updateCallback: (notifications: Array<INotification>) => void
  ) {
    try {
      const result = await this.notificationService.handleFollow(notificationId, true);
      if (result) {
        const notificationIndex = this._notifications.findIndex(
          (notification) => notification.id === notificationId
        );
        if (notificationIndex !== -1) {
          updateCallback(this._notifications);
        }
      }
    } catch (error) {
    }
  }
}

export const mockNotificationDataList: Array<INotification> = [
  {
    id: 1,
    createdAt: dateFromTimestamp,
    postId: 1,
    type: NotificationType.Follow,
    content: 'followed you',
    post: mockPostData,
    fromUser: mockUserData2
  },
  {
    id: 2,
    createdAt: dateFromTimestamp,
    postId: 1,
    type: NotificationType.Like,
    content: 'liked your post',
    post: mockPostData,
    fromUser: mockUserData3
  }
]