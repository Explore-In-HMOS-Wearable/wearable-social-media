import { INotification } from '../../model/Interface/INotification';
import { NotificationType } from '../../model/NotificationModel';
import { mockPostData } from './MockPostData';
import { mockUserData } from './MockUserData';

const timestamp: number = Date.now();

const dateFromTimestamp: Date = new Date(timestamp);

export const mockNotificationData : INotification =
  {
    id: 1,
    createdAt: dateFromTimestamp,
    postId: 1,
    type: NotificationType.Follow,
    content: 'Your friend like your post',
    post: mockPostData,
    fromUser: mockUserData
  }
