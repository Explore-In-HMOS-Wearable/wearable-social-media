import { NotificationType } from '../NotificationModel';
import { IPostData } from './IPostData';
import { IUserData } from './IUserData';

export interface INotification {
  id: number,
  type: NotificationType;
  postId: number;
  createdAt: Date;
  content: string;
  post: IPostData;
  fromUser: IUserData;
}
