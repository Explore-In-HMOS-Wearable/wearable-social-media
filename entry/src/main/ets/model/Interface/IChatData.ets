import { IUserData } from './IUserData';

export interface IChatData {
  id: number,
  avatar: string;
  username: string;
  lastMessage: string;
  time: string;
  unread: boolean;
  user: IUserData,
  isSender: boolean;
  createdAt: Date;
}