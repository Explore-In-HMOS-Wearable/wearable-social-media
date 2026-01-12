import { IProfileResponse } from '../../model/Interface/IProfileResponse';

import { mockPostDataList } from './MockPostDataList';
import { mockProfileDataResponse } from './MockProfileDataResponse';
import { mockUserDataResponseList } from './MockUserDataResponseList';

export const mockProfileResponse: IProfileResponse = {
  profile: mockProfileDataResponse,
  followerCount: 1,
  followingCount: 1,
  followers: mockUserDataResponseList,
  followings: mockUserDataResponseList,
  posts: mockPostDataList,
  postCount: 1,
  isFollowed: true
}

export const mockProfileResponse2: IProfileResponse = {
  profile: mockProfileDataResponse,
  followerCount: 654,
  followingCount: 2354,
  followers: mockUserDataResponseList,
  followings: mockUserDataResponseList,
  posts: mockPostDataList,
  postCount: 3,
  isFollowed: true
}