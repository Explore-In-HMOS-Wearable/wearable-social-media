import { IProfileResponse } from '../model/Interface/IProfileResponse';
import { UserService } from '../service/UserService';
import { MockProfileResponse } from './mockData/MockProfileResponse';

export class MockUserService extends UserService {
  async fetchUser(): Promise<IProfileResponse> {
    return MockProfileResponse
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