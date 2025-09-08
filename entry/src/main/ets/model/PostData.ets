import { IUserData } from './Interface/IUserData';

export interface PostData {
  id: number;
  username: string;
  likes: number;
  description: string;
  isLiked: boolean;
  photo: string;
  likeCount: number;
  commentCount:number,
  publishDate: Date,
  user: IUserData;
  location: string;
}

interface User {
  id: string;
  username: string;
  profile: Profile;
}

interface Profile {
  photo: string;
}