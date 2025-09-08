import { IUserData } from './IUserData';

export interface IChatDetailData {
  id: number,
  senderType: 'me' | 'other';
  content: string;
  createdAt: Date;
  sender?: IUserData;
  receiver?: IUserData;
}