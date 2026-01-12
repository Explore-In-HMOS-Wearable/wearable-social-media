import { emitter } from '@kit.BasicServicesKit'
import { IPostData } from '../model/Interface/IPostData'

@Component
struct PostItem {
  @Prop @Watch('onPostData') postData: IPostData
  onLike: () => void = () => {
  }
  onClickComment: () => void = () => {
  }
  private isLiked: boolean = false
  private iconWidth: string = '12vp';

  openProfile() {

    if (this.postData.user.id) {
    } else {
      emitter.emit('changeTab', {
        data: {
          tabId: 4
        }
      })
    }
  }

  build() {
    Column() {
      Row() {

        Blank().width('13%')

        Column() {
          Image((this.postData.user.photo))
            .width(32)
            .height(32)
            .borderRadius(16)
        }

        Column() {
          Text(this.postData.user.username)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              this.openProfile()
            })
            .fontSize(11)

          Text(this.postData.location)
            .fontColor(Color.White)
            .fontSize(9)

        }
        .backgroundColor(Color.Black)
        .padding({ left: 10 })
      }
      .width('100%')
      .backgroundColor(Color.Black)
      .padding(3)

      Image((this.postData.photo))
        .width('80%')
        .aspectRatio(1)
        .objectFit(ImageFit.Cover)

    }
    .margin({ bottom: 10 })
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)

  }

  onPostData(changedPropertyName: string) {
  }

}

export { PostItem }