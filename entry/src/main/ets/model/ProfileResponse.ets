import { PostData } from './PostData';

export interface ProfileResponse {
  profile: ProfileDataResponse;
  followerCount: number;
  followingCount: number;
  followers: Array<UserDataResponse>;
  followings: Array<UserDataResponse>;
  posts: Array<PostData>;
  postCount: number;
  isFollowed: boolean;
}

interface ProfileDataResponse {
  id: number;
  biography: string;
  lastSeen: Date;
  photo: string;
  user: UserDataResponse;
}

interface UserDataResponse {
  id: number;
  username: string;
  email: string;
  createdAt: Date;
}
