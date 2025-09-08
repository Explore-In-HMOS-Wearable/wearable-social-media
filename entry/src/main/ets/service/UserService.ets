import { IProfileResponse } from '../model/Interface/IProfileResponse';

export abstract class UserService {
  abstract fetchUser(): Promise<IProfileResponse | undefined>
  abstract followUser(userId: number): Promise<boolean>
  abstract loginUser(): Promise<boolean>
  abstract logoutUser(): Promise<boolean>

}
