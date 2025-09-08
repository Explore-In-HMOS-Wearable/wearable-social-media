import { IPostData } from '../../model/Interface/IPostData';
import { mockUserData } from './MockUserData';

const timestamp = Date.now().toString();

const dateFromTimestamp: Date = new Date(timestamp);

export const mockPostData: IPostData = {
  id: 1,
  username: 'John Doe',
  likes: 1,
  description: 'This post is mock data',
  isLiked: true,
  photo: $r('app.media.post1'),
  likeCount: 1,
  commentCount: 1,
  publishDate: timestamp,
  user: mockUserData,
  location: 'Uganda',
}