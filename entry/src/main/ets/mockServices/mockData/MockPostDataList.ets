import { IPostData } from '../../model/Interface/IPostData';
import { mockUserData, mockUserData_2, mockUserData_3 } from './MockUserData';

const timestamp = new Date().toString();

const dateFromTimestamp: Date = new Date(timestamp);

export const mockPostDataList: Array<IPostData> = [
  {
    id: 1,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post1'),
    likeCount: 10,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData_3,
    location: 'Izmir',
  },
  {
    id: 2,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post2'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData_2,
    location: 'Izmir',
  },
  {
    id: 3,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post3'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData,
    location: 'Izmir',
  }

]