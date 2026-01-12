import { ICommentData } from '../model/Interface/ICommentData';
import { CommentService } from '../service/CommentService';
import { mockCommentData } from './mockData/MockCommentData';
import { mockCommentDataList } from './mockData/MockCommentDataList';

export class MockCommentService extends CommentService {


  async fetchComments(postId: number): Promise<ICommentData[]> {
    return mockCommentDataList;
  }

  async addComment(postId: number, receivedContent: string): Promise<ICommentData> {

    return mockCommentData;

  }


}