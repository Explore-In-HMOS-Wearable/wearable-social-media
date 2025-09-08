import { IUserData } from './Interface/IUserData';


export interface ChatData {
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