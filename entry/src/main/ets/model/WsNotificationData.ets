export interface WsNotification {
  type: string;
  fromUserId: string;
  content: string;
  user: User;
}

interface User {
  id: string;
  username: string;
  profile: Profile;
}

interface Profile {
  id: string;
  photo: string;
}