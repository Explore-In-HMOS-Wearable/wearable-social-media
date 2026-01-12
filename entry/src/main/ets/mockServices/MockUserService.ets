import { IProfileResponse } from '../model/Interface/IProfileResponse';
import { UserService } from '../service/UserService';
import { mockProfileResponse } from './mockData/MockProfileResponse';

export class MockUserService extends UserService {
  async fetchUser(): Promise<IProfileResponse> {
    return mockProfileResponse
  }

  async followUser(userId: number): Promise<boolean> {
    return true
  }

  async loginUser(): Promise<boolean> {
    return true
  }

  async logoutUser(): Promise<boolean> {
    return true
  }


}