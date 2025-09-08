import { IUserData } from './IUserData';

export interface IPostData {
  id: number;
  username: string;
  likes: number;
  description: string;
  isLiked: boolean;
  photo: Resource;
  likeCount: number;
  commentCount:number,
  publishDate: string,
  user: IUserData;
  location: string;
}