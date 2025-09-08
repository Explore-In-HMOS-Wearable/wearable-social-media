import { IPostData } from '../model/Interface/IPostData';
import { PostService } from '../service/PostService';
import { mockPostDataList } from './mockData/MockPostDataList';

export class MockPostService extends PostService {

  async fetchPosts(): Promise<IPostData[]> {
    return mockPostDataList
  }

  async likePost(postId: number): Promise<boolean> {
    return true
  }


}