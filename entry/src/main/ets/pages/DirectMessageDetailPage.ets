import { DMDetailPageHeader } from '../components/DMDetailPageHeader';
import DMInputComponent from '../components/DMInputComponent';
import { MessageListItemComponent } from '../components/MessageListComponent';
import { getParams } from '../RouterUtils';

import { DirectMessageViewModel } from '../viewmodel/DirectMessageViewModel';
import dayjs from 'dayjs';
import relativeTime from 'dayjs/plugin/relativeTime';
import { IUserData } from '../model/Interface/IUserData';
import { IChatDetailData } from '../model/Interface/IChatDetailData';

dayjs.extend(relativeTime)

@Entry
@Component
struct DirectMessageDetailPage {
  @State message: string = 'DirectMessageDetail Page';
  @State newMessage: string = ''
  @State chatDetailData: Array<IChatDetailData> = []
  @State directMessageViewModel: DirectMessageViewModel = new DirectMessageViewModel()
  private listScroller: Scroller = new Scroller();
  @State userData: IUserData = getParams() as IUserData

  async aboutToAppear() {

    this.directMessageViewModel.loadDetailMessages((fetchLoadMessage) => {
      this.chatDetailData = fetchLoadMessage
    })
  }

  build() {

    Column() {
      DMDetailPageHeader({
        userData: this.userData
      })
      List({ scroller: this.listScroller }) {
        ForEach(this.chatDetailData, (conversation: IChatDetailData) => {
          ListItem() {
            MessageListItemComponent({
              chatDetailData: conversation
            })
          }
        }, (item: string, index: number) => item)

      }.width('100%')
      .layoutWeight(1)
      .backgroundColor($r('app.color.white_light'))

      DMInputComponent({
        messageList: this.chatDetailData
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)

  }
}

export { DirectMessageDetailPage };
