import { IUserData } from './IUserData';

export interface ICommentData {
  profileImage: string;
  profileName: string;
  createdAt: string;
  content: string;
  user: IUserData
}