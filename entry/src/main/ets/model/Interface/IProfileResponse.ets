import { IPostData } from './IPostData';
import { IProfileDataResponse } from './IProfileDataResponse';
import { IUserDataResponse } from './IUserDataResponse';

export interface IProfileResponse {
  profile: IProfileDataResponse;
  followerCount: number;
  followingCount: number;
  followers: Array<IUserDataResponse>;
  followings: Array<IUserDataResponse>;
  posts: Array<IPostData>;
  postCount: number;
  isFollowed: boolean;
}