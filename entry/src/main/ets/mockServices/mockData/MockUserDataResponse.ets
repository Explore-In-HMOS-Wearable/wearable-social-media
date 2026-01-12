import { IUserDataResponse } from '../../model/Interface/IUserDataResponse';


const timestamp: number = Date.now();

const dateFromTimestamp: Date = new Date(timestamp);

export const mockUserDataResponse : IUserDataResponse = {
  id: 2,
  username: 'John Doe',
  email: 'example@example.com',
  createdAt: dateFromTimestamp
}

export const mockUserDataResponse2 : IUserDataResponse = {
  id: 1,
  username: 'Tom Doe',
  email: 'example@example.com',
  createdAt: dateFromTimestamp
}