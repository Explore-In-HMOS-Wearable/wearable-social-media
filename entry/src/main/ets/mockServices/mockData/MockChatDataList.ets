import { IChatData } from '../../model/Interface/IChatData';
import { mockUserData_2 } from './MockUserData';

const timestamp: number = Date.now();

const dateFromTimestamp: Date = new Date(timestamp);

export const mockChatDataList : Array<IChatData> = [
  {
    id: 1,
    avatar: 'app.media.profile_image',
    username: 'John Doe',
    lastMessage: 'Example Mock Last Message',
    time: '',
    unread: false,
    user: mockUserData_2,
    isSender: false,
    createdAt: dateFromTimestamp,
  }
]