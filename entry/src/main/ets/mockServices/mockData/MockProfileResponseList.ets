import { IProfileResponse } from '../../model/Interface/IProfileResponse';
import { mockPostDataList } from './MockPostDataList';
import { mockProfileDataResponse, mockProfileDataResponse1 } from './MockProfileDataResponse';
import { mockUserDataResponseList } from './MockUserDataResponseList';



export const mockProfileResponseList : Array<IProfileResponse > = [
  {
    profile: mockProfileDataResponse,
    followerCount: 1,
    followingCount: 1,
    followers: mockUserDataResponseList,
    followings: mockUserDataResponseList,
    posts: mockPostDataList,
    postCount: 1,
    isFollowed: true
  },
{
  profile: mockProfileDataResponse1,
  followerCount: 1,
  followingCount: 1,
  followers: mockUserDataResponseList,
  followings: mockUserDataResponseList,
  posts: mockPostDataList,
  postCount: 1,
  isFollowed: true
}

]