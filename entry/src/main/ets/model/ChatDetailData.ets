import { IUserData } from './Interface/IUserData';


export interface ChatDetailData {
  id: number,
  senderType: 'me' | 'other';
  content: string;
  createdAt: Date;
  sender?: IUserData;
  receiver?: IUserData;
}