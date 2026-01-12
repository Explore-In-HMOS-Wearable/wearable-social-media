import { INotification } from '../../model/Interface/INotification';
import { NotificationType } from '../../model/NotificationModel';
import { mockPostData } from './MockPostData';
import { mockUserData2, mockUserData3 } from './MockUserData';

const timestamp: number = Date.now();
const dateFromTimestamp: Date = new Date(timestamp);
dateFromTimestamp.setMinutes(dateFromTimestamp.getMinutes() + Math.floor(getRandomInt(2) * 27) + 1)

function getRandomInt(max: number): number {
  return Math.floor((Date.now() % 10000) / 10000 * max);
}

export const mockNotificationDataList: Array<INotification> = [
  {
    id: 1,
    createdAt: dateFromTimestamp,
    postId: 1,
    type: NotificationType.Follow,
    content: 'John Doe followed you',
    post: mockPostData,
    fromUser: mockUserData2
  },
  {
    id: 2,
    createdAt: dateFromTimestamp,
    postId: 1,
    type: NotificationType.Like,
    content: 'Your friend like your post',
    post: mockPostData,
    fromUser: mockUserData3
  }
]
