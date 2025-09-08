import { UserData } from '../service/CommentService';


export interface CommentData {
  profileImage: string;
  profileName: string;
  createdAt: string;
  content: string;
  user: UserData
}