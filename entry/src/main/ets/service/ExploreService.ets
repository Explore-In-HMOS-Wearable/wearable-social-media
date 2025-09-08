import { IPostData } from '../model/Interface/IPostData';


export abstract class ExploreService {
  abstract fetchPosts(): Promise<IPostData[]> ;
  abstract likePost(postId: number): Promise<boolean>;
}
