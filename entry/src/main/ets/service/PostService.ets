import { IPostData } from '../model/Interface/IPostData'


const postList: Array<IPostData> = []

export abstract class PostService {

  abstract fetchPosts(): Promise<IPostData[]>

  abstract likePost(postId: number): Promise<boolean>


}
