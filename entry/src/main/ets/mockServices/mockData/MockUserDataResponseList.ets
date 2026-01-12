import { IUserDataResponse } from '../../model/Interface/IUserDataResponse';
const timestamp: number = Date.now();
const dateFromTimestamp: Date = new Date(timestamp);

export const mockUserDataResponseList : Array<IUserDataResponse> = [
  {
    id: 1,
    username: 'Tom',
    email: 'example@example.com',
    createdAt: dateFromTimestamp
  }
]