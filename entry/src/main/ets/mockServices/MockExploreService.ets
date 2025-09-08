import { IPostData } from '../model/Interface/IPostData';
import { ExploreService } from '../service/ExploreService';
import { mockPostDataList } from './mockData/MockPostDataList';

export class MockExploreService extends ExploreService {

  async fetchPosts(): Promise<IPostData[]> {
    return mockPostDataList
  }

  async likePost(postId: number): Promise<boolean> {
    return true
  }
}