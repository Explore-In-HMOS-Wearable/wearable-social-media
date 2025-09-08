import { MockDirectMessageService } from '../mockServices/MockDirectMessageService';
import { IChatData } from '../model/Interface/IChatData';
import { IChatDetailData } from '../model/Interface/IChatDetailData';

@Observed
export class DirectMessageViewModel {
  private directMessageService: MockDirectMessageService;
  private _chats: Array<IChatData> = []
  private _chatDetails: Array<IChatDetailData> = []
  private _isLoading: boolean = false
  private _error: string | null = null

  constructor() {
    this.directMessageService = new MockDirectMessageService();
  }

  getChats(): Array<IChatData> {
    return this._chats
  }

  getChatDetails(): Array<IChatDetailData> {
    return this._chatDetails
  }

  getIsLoading(): boolean {
    return this._isLoading
  }

  getError(): string | null {
    return this._error
  }

  async loadMessages(updateCallback: (chats: Array<IChatData>, isLoading: boolean, error: string | null) => void) {
    try {
      this._isLoading = true
      this._error = null
      updateCallback(this._chats, this._isLoading, this._error)

      const fetchedChats = await this.directMessageService.fetchChats()
      this._chats = fetchedChats
      this._isLoading = false

      updateCallback(this._chats, this._isLoading, this._error)
    } catch (error) {
      this._error = 'Error when loading chats'
      this._isLoading = false

      updateCallback(this._chats, this._isLoading, this._error)
    }
  }

  async loadDetailMessages(updateCallback: (chats: Array<IChatDetailData>, isLoading: boolean, error: string | null)
  => void) {
    try {
      this._isLoading = true
      this._error = null
      updateCallback(this._chatDetails, this._isLoading, this._error)

      const fetchedChatDetails = await this.directMessageService.fetchChatDetails()
      this._chatDetails = fetchedChatDetails
      this._isLoading = false

      updateCallback(this._chatDetails, this._isLoading, this._error)
    } catch (error) {
      this._error = 'Error when loading chat details'
      this._isLoading = false

      updateCallback(this._chatDetails, this._isLoading, this._error)
    }
  }
}