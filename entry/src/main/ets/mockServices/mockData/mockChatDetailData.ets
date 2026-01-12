import { IChatDetailData } from '../../model/Interface/IChatDetailData';
import { mockUserData } from './MockUserData';

const timestamp: number = Date.now();

const dateFromTimestamp: Date = new Date(timestamp);

export const mockChatDetailDataList : Array<IChatDetailData> = [
  {
    id: 1,
    senderType: 'other',
    content: 'Example Mock Last Message',
    createdAt: dateFromTimestamp,
    sender: mockUserData,
    receiver: mockUserData
  }
]