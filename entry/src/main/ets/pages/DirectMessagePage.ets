import { ChatListItem } from '../components/ChatListItem';
import { SearchBarComponent } from '../components/SearchBarComponent';
import { IChatData } from '../model/Interface/IChatData';
import { routerBack } from '../RouterUtils';
import { DirectMessageViewModel } from '../viewmodel/DirectMessageViewModel';

@Entry
@Component
struct DirectMessagePage {
  @State message: string = 'DirectMessage Page';
  @State directMessageViewModel: DirectMessageViewModel = new DirectMessageViewModel()
  @State chatData: Array<IChatData> = []
  @State searchInput: string = '';

  aboutToAppear() {
    this.directMessageViewModel.loadMessages((fetchedChats) => {
      this.chatData = fetchedChats
    })
  }

  build() {
    Column() {

      Row() {
        Image($r('app.media.back_icon'))
          .width(24)
          .height(24)
          .onClick(() => routerBack())

        Blank()

        Image($r('app.media.edit_icon'))
          .width(24)
          .height(24)
      }
      .width('100%')
      .padding(10)
      .backgroundColor($r('app.color.white'))

      SearchBarComponent({ searchInput: this.searchInput })

      List() {
        ForEach(this.chatData, (item: IChatData) => {
          ListItem() {
            ChatListItem({
              chatData: item
            })
          }
        }, (item: string, index: number) => item)
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}

export { DirectMessagePage };
