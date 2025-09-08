import { UserData } from './UserData';

export interface ProfileData {
  id?: number;
  biography: string;
  lastSeen?: string;
  user: UserData;
  photo?: string;
}