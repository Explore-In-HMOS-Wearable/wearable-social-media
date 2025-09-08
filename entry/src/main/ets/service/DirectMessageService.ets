

import { IChatData } from '../model/Interface/IChatData'
import { IChatDetailData } from '../model/Interface/IChatDetailData'


export abstract class DirectMessageService {
  abstract fetchChats(): Promise<IChatData[]>;

  abstract fetchChatDetails(): Promise<IChatDetailData[]>

}