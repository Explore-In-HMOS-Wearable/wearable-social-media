import { MockUserService } from '../mockServices/MockUserService';
import { IProfileResponse } from '../model/Interface/IProfileResponse';

@Observed
export class ProfileViewModel {
  private model: MockUserService
  private _user?: IProfileResponse
  private _isLoading: boolean = false
  private _error: string | null = null

  constructor() {
    this.model = new MockUserService()
  }

  get getUser(): IProfileResponse | undefined {
    return this._user
  }

  get isLoading(): boolean {
    return this._isLoading
  }

  get error(): string | null {
    return this._error
  }

  async loadUser() {
    try {
      this._isLoading = true
      this._error = null

      const fetchedUser = await this.model.fetchUser()
      this._user = fetchedUser
    } catch (error) {
      this._error = 'Error when loading user'
    } finally {
      this._isLoading = false
    }
  }

  async loginUser() {
    try {
      if (!this._user) {
        return
      }
      this._isLoading = true
      this._error = null

      const result = await this.model.loginUser()
    } catch (error) {
      this._error = 'Error when loading user'
    } finally {
      this._isLoading = false
    }
  }

  async logoutUser() {
    try {
      if (!this._user) {
        return
      }
      this._isLoading = true
      this._error = null

      const result = await this.model.logoutUser()
    } catch (error) {
      this._error = 'Error when loading user'
    } finally {
      this._isLoading = false
    }
  }

  async followUser(userId: number): Promise<void> {
    if (!this._user) {
      return
    }

    const result = await this.model.followUser(userId)
    if (result && this._user) {
      const updatedCount = this._user.followingCount + 1
      this._user.followingCount = updatedCount

    }
  }

  async unfollowUser(userId: number): Promise<void> {
    if (!this._user) {
      return
    }

    const result = await this.model.followUser(userId) // Assuming this toggles follow state
    if (result && this._user) {
      const updatedCount = this._user.followingCount - 1
      this._user.followingCount = updatedCount
    }
  }
}