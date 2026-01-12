import { IChatData } from '../../model/Interface/IChatData';
import { mockUserData2 } from './MockUserData';

const timestamp: number = Date.now();

const dateFromTimestamp: Date = new Date(timestamp);

export const mockChatData : IChatData = {
  id: 1,
  avatar: 'app.media.profile_image',
  username: 'John Doe',
  lastMessage: 'This is mock message',
  time: '10 minutes ago',
  unread: false,
  user: mockUserData2,
  isSender: false,
  createdAt: dateFromTimestamp
}