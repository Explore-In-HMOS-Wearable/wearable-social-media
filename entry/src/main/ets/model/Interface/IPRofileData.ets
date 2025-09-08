import { IUserData } from './IUserData';

export interface IProfileData {
  id: number;
  biography: string;
  lastSeen?: string;
  user: IUserData;
  photo: string;
}