export interface SendMessage {
event: string,
data: MessageData
}

export interface MessageData {
  senderId: string,
  receiverId: string,
  content: string
}