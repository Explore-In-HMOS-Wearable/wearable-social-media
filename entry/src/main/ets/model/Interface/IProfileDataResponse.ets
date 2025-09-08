import { IUserDataResponse } from './IUserDataResponse';

export interface IProfileDataResponse {
  id: number;
  biography: string;
  lastSeen: Date;
  photo: string;
  user: IUserDataResponse;
}