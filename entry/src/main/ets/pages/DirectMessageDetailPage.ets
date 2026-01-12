import { DMDetailPageHeader } from '../components/DMDetailPageHeader';
import { MessageListItemComponent } from '../components/MessageListComponent';
import { DirectMessageViewModel } from '../viewmodel/DirectMessageViewModel';
import dayjs from 'dayjs';
import relativeTime from 'dayjs/plugin/relativeTime';
import { IChatDetailData } from '../model/Interface/IChatDetailData';

dayjs.extend(relativeTime)

@Entry
@Component
struct DirectMessageDetailPage {
  private message: string = 'DirectMessageDetail Page';
  private newMessage: string = ''
  private chatDetailData: Array<IChatDetailData> = []
  private directMessageViewModel: DirectMessageViewModel = new DirectMessageViewModel()
  private listScroller: Scroller = new Scroller();

  async aboutToAppear() {

    this.directMessageViewModel.loadDetailMessages((fetchLoadMessage) => {
      this.chatDetailData = fetchLoadMessage
    })
  }

  build() {

    Column() {
      DMDetailPageHeader({})
      List({ scroller: this.listScroller }) {
        ForEach(this.chatDetailData, (conversation: IChatDetailData) => {
          ListItem() {
            MessageListItemComponent({
              chatDetailData: conversation
            })
          }
          .width('70%')
          .height('70%')

        }, (item: string, index: number) => item)

      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .backgroundColor($r('app.color.white_light'))

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)

  }
}

export { DirectMessageDetailPage };
