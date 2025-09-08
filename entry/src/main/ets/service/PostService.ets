import { IPostData } from '../model/Interface/IPostData'


let postList: Array<IPostData> = []

export abstract class PostService {

  abstract fetchPosts(): Promise<IPostData[]>

  abstract likePost(postId: number): Promise<boolean>


}
