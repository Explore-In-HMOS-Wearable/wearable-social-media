import { CommentData } from './CommentData';
import { UserData } from './UserData';

export interface CommentResponse {
  commentData : CommentData,
  userData: UserData
}