import { IProfileDataResponse } from '../../model/Interface/IProfileDataResponse';
import { mockUserDataResponse, mockUserDataResponse_2 } from './MockUserDataResponse';

const timestamp: number = Date.now();
const dateFromTimestamp: Date = new Date(timestamp);

export const mockProfileDataResponse: IProfileDataResponse = {
  id: 2,
  biography: 'This biography belongs to John Doe',
  lastSeen: dateFromTimestamp,
  photo: 'app.media.pic1',
  user: mockUserDataResponse_2
}

export const mockProfileDataResponse_1: IProfileDataResponse = {
  id: 1,
  biography: 'This biography belongs to John Doe',
  lastSeen: dateFromTimestamp,
  photo: 'app.media.post',
  user: mockUserDataResponse
}