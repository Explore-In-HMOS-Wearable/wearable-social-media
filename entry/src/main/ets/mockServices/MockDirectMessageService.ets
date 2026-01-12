import { IChatData } from '../model/Interface/IChatData';
import { IChatDetailData } from '../model/Interface/IChatDetailData';
import { DirectMessageService } from '../service/DirectMessageService';
import { mockChatDataList } from './mockData/MockChatDataList';
import { mockChatDetailDataList } from './mockData/MockChatDetailData';

export class MockDirectMessageService extends DirectMessageService {

  async fetchChats(): Promise<IChatData[]> {
    return mockChatDataList
  }

  async fetchChatDetails(): Promise<IChatDetailData[]> {
    return mockChatDetailDataList
  }
}