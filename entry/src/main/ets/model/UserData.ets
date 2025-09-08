import { ProfileData } from './ProfileData';

export interface UserData {
  id: number;
  username: string;
  email: string;
  profile: ProfileData;
}