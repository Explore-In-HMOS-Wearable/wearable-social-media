import { IUserData } from './Interface/IUserData';

export enum NotificationType {
  Follow = 'follow_request',
  Like = 'like',
  Comment = 'comment'
}

export interface NotificationModel {
  id: number,
  type: NotificationType;
  postId: number;
  createdAt: Date;
  content: Resource;
  post: Post;
  fromUser: IUserData;
}

interface Post {
  id: number;
  photo: string;
}

interface User {
  id: number;
  username: string;
  profile: Profile;
}

interface Profile {
  id: number;
  photo: string;
}