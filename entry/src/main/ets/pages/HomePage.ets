import { PostItem } from '../components/PostItem'
import { PostViewModel } from '../viewmodel/PostViewModel'
import { CommentItem } from '../components/CommenItem'
import CommentInput from '../components/CommentInput'
import { IPostData } from '../model/Interface/IPostData'
import { ICommentData } from '../model/Interface/ICommentData'
import { mockCommentDataList } from '../mockServices/mockData/MockCommentDataList'

import { ComponentContent } from '@kit.ArkUI'
import { mockUserData, mockUserData3 } from '../mockServices/mockData/MockUserData'

@Builder
function buildText() {
  Column() {
    Text(`Example Header`)
      .fontSize(15)
      .fontWeight(FontWeight.Bold)
  }
  .margin({ top: 20 })
  .justifyContent(FlexAlign.Center)
}

@Builder
export function HomePageBuilder(name: string, param: Object) {
  HomePage()
}

@Component
export struct HomePage {
  pageInfos: NavPathStack = new NavPathStack();
  private postViewModel: PostViewModel = new PostViewModel()
  @State posts: Array<IPostData> = mockPostDataList;
  @State selectedComments: Array<ICommentData> = mockCommentDataList
  private isRefreshing: boolean = false
  @State isPresent: boolean = false;
  private showDragBar: boolean = true;
  @State sheetHeight: number | SheetSize | null | undefined = 600;
  @State selectedPostId: number = 0;

  @Builder
  myBuilder() {
    Column() {
      Column() {
        Text($r('app.string.Comments_Text'))
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .padding({ top: 16, bottom: 16 });

        ForEach(this.selectedComments, (comment: ICommentData) => {
          CommentItem({
            comment: comment
          })
        }, (item: string, index: number) => item)
      }

      CommentInput({
        postId: this.selectedPostId,
        selectedComments: $selectedComments
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .width('100%')
    .height('100%')
  }

  private openComment = (postId: number) => {
    this.selectedPostId = postId;
    this.postViewModel.loadComments(postId, (comments) => {
      this.selectedComments = [...comments];
    });
    this.isPresent = !this.isPresent;
  };

  async aboutToAppear() {
  }

  context: UIContext = this.getUIContext();
  header: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));

  build() {

    NavDestination() {

      Column() {

        Scroll() {
          Column() {
            Blank().height('39vp').width('100%')

            ForEach(this.posts, (post: IPostData) => {

              PostItem({
                postData: post
              })
            }, (item: string, index: number) => item)

            Blank().height('39vp').width('100%')
              .backgroundColor(Color.Black)

          }
        }
      }
      .bindSheet(this.isPresent, this.myBuilder(),
        { height: this.sheetHeight, dragBar: this.showDragBar, showClose: false })
      .backgroundColor(Color.Black)
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })
  }
}

const timestamp = new Date().toString();

export const mockPostDataList: Array<IPostData> = [
  {
    id: 1,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post2'),
    likeCount: 10,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData3,
    location: 'Canada'
  },
  {
    id: 2,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post1'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData,
    location: 'Canada'
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
    location: 'Canada'
  },
  {
    id: 3,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post4'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData,
    location: 'Canada'
  },
  {
    id: 3,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post5'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData,
    location: 'Canada'
  },
  {
    id: 3,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post6'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData,
    location: 'Canada'
  },
  {
    id: 3,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post7'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData,
    location: 'Canada'
  },
  {
    id: 3,
    username: '',
    likes: 1,
    description: 'It is good post',
    isLiked: true,
    photo: $r('app.media.post8'),
    likeCount: 5,
    commentCount: 1,
    publishDate: timestamp,
    user: mockUserData,
    location: 'Canada'
  }
]

