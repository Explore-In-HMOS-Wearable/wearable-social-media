import { MockExploreService } from '../mockServices/MockExploreService';
import { IPostData } from '../model/Interface/IPostData';


@Observed
export class ExploreViewModel {
  private model: MockExploreService;

  private _posts: Array<IPostData> = []
  private _isLoading: boolean = false
  private _error: string | null = null

  constructor() {
    this.model = new MockExploreService();
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
    }
    catch (error) {
      this._error = 'Error when loading posts'
      this._isLoading = false

      updateCallback(this._posts, this._isLoading, this._error)
    }
  }

  async likePost(postId: number, updateCallback: (posts: Array<IPostData>) => void) {
    const result = await this.model.likePost(postId)
    if (result) {
      const postIndex = this._posts.findIndex(post => post.id === postId)
      if (postIndex !== -1) {
        this._posts[postIndex].likeCount += 1
        updateCallback(this._posts)
      }
    }
  }
}