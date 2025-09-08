import { MockCommentService } from '../mockServices/MockCommentService';
import { MockPostService } from '../mockServices/MockPostService';
import { ICommentData } from '../model/Interface/ICommentData';
import { IPostData } from '../model/Interface/IPostData';


@Observed
export class PostViewModel {
  private model: MockPostService
  private commentService: MockCommentService;
  private _comments: Array<ICommentData> = []
  private _posts: Array<IPostData> = []
  private _isLoading: boolean = false
  private _error: string | null = null

  constructor() {
    this.model = new MockPostService();
    this.commentService = new MockCommentService();
  }

  getPosts(): Array<IPostData> {
    return this._posts
  }

  getIsLoading(): boolean {
    return this._isLoading
  }

  getError(): string | null {
    return this._error
  }

  async loadPosts(updateCallback: (posts: Array<IPostData>, isLoading: boolean, error: string | null) => void) {
    try {
      this._isLoading = true
      this._error = null
      updateCallback(this._posts, this._isLoading, this._error)

      const fetchedPosts = await this.model.fetchPosts()
      this._posts = fetchedPosts
      this._isLoading = false

      updateCallback(this._posts, this._isLoading, this._error)
    } catch (error) {
      this._error = 'Error when loading posts'
      this._isLoading = false

      updateCallback(this._posts, this._isLoading, this._error)
    }
  }

  async likePost(postId: number, status: boolean) {
    const result = await this.model.likePost(postId)
    if (result) {
      const postIndex = this._posts.findIndex(post => post.id === postId)
      if (postIndex !== -1) {
        if (status) {
          this._posts[postIndex].isLiked = true
          this._posts[postIndex].likeCount += 1
        } else {
          this._posts[postIndex].isLiked = false
          this._posts[postIndex].likeCount -= 1
        }
      }
    }
  }

  async loadComments(postId: number, updateCallback: (comments: Array<ICommentData>) => void): Promise<void> {
    try {
      const fetchedComments = await this.commentService.fetchComments(postId);
      this._comments = fetchedComments;
      updateCallback(this._comments);
    } catch (error) {
      updateCallback(this._comments || []);
    }
  }
}