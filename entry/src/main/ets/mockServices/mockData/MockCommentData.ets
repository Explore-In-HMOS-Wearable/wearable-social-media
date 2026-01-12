import { ICommentData } from '../../model/Interface/ICommentData'
import { mockUserData3 } from './MockUserData'

export const mockCommentData : ICommentData =
  {
    profileImage: 'app.media.profile_image',
    profileName: 'John Doe Comment',
    createdAt: '15 minutes ago',
    content: 'Content Comment',
    user: mockUserData3
  }
