import { ICommentData } from '../model/Interface/ICommentData';


export interface CommentBody {
  content: string
}
export interface UserData {
  id: number,
  username: string,
  email: string
}
export abstract class CommentService {
  abstract fetchComments(postId: number): Promise<ICommentData[]>;
  abstract addComment(postId: number, receivedContent: string): Promise<ICommentData>;
}
