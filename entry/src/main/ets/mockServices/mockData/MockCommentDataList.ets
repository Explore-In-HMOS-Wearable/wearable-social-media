import { ICommentData } from '../../model/Interface/ICommentData'
import { mockUserData_2 } from './MockUserData'

export const mockCommentDataList : Array<ICommentData> = [
  {
    profileImage: 'app.media.post',
    profileName: 'John Doe',
    createdAt: '10 minutes ago',
    content: 'This is example content',
    user: mockUserData_2
  }
]