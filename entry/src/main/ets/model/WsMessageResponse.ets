export interface WsMessageResponse {
  type: string,
  message: Message
}

export interface Message {
  id: number,
  content: string,
  sender: User,
  receiver: User,
  createdAt: Date
}

export interface User {
  id: number,
  username: string
}