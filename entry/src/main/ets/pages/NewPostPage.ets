import { NewPostViewModel } from '../viewmodel/NewPostViewModel';
import { LocalMedia, MediaType } from '../model/LocalMedia';
import { dataSharePredicates } from '@kit.ArkData';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { BusinessError } from '@kit.BasicServicesKit';

import { abilityAccessCtrl, common, Permissions } from '@kit.AbilityKit';

const permissions: Array<Permissions> = ['ohos.permission.READ_IMAGEVIDEO', 'ohos.permission.READ_MEDIA'];

@Entry
@Component
struct NewPostPage {
  @State viewModel: NewPostViewModel = new NewPostViewModel();
  @State imageGrid: Array<LocalMedia> = [];
  @State selectedImage: string = '';
  @State selectedMediaType: MediaType = MediaType.Recent;
  @State isMenuOpen: boolean = false;
  @State selectedImageFile: string = ''
  @State imageArray: Array<Resource> = []
  @State postDescription: string = ''
  @State postLocation: string = ''

  reqPermissionsFromUser(permissions: Array<Permissions>, context: common.UIAbilityContext): void {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(context, permissions).then((data) => {
      let grantStatus: Array<number> = data.authResults;
      let length: number = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {

        } else {
          return;
        }
      }
      this.getImagesFromGallery()
    }).catch((err: BusinessError) => {
    })
  }

  @Builder
  postBuilder() {
    Column() {
      Text('New Post')
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
        .padding({ top: 20 });
      if (this.selectedImage) {
        Image(this.selectedImage)
          .width('100%')
          .aspectRatio(1)
          .objectFit(ImageFit.Cover)
          .margin({ top: 16 })
          .borderRadius(20)
      }
      Flex({
        direction: FlexDirection.Column,
        justifyContent: FlexAlign.Center
      }) {
        TextArea({ placeholder: 'Add Description', text: this.postDescription }).height('20%').width('100%')
          .onChange((data) => {
            this.postDescription = data
          })
        TextInput({ placeholder: 'Add Location', text: this.postLocation })
          .onChange((data) => {
            this.postLocation = data
          }).margin({ top: 10 })
        Button('Share Post')
          .width('100%')
          .onClick(() => {


          }).margin({ top: 10 })
      }.padding({ top: 20, right: 10, left: 10 })
    }
  }

  async getImagesFromGallery() {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOption: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
  }

  async aboutToAppear() {
    const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.reqPermissionsFromUser(permissions, context);
  }

  private changeMediaType(type: MediaType) {
    this.viewModel.filterMediaByType(type, (filteredImages) => {
      this.imageGrid = filteredImages;
      this.selectedMediaType = type;
    });
  }

  @Builder
  gridItemBuilder(res: Resource) {
    GridItem() {
      Image($r('app.media.photomachine'))
        .width('100%')
        .aspectRatio(1)
        .objectFit(ImageFit.Cover);
    }

  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.Cancel'))
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .layoutWeight(1)
          .fontWeight(FontWeight.Normal)
          .onClick(() => {
          });

        Text(this.selectedMediaType.charAt(0).toUpperCase() + this.selectedMediaType.slice(1))
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
          .bindMenu([
            { value: $r('app.string.Recent'), action: () => this.changeMediaType(MediaType.Recent) },
            { value: $r('app.string.Favorites'), action: () => this.changeMediaType(MediaType.Favorites) },
            { value: $r('app.string.Videos'), action: () => this.changeMediaType(MediaType.Videos) },
          ])
          .fontWeight(FontWeight.Bold);

        Text($r('app.string.Next'))
          .fontSize(16)
          .layoutWeight(1)
          .textAlign(TextAlign.End)
          .fontColor($r('app.color.focus_color'))
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.isMenuOpen = true
          });
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceAround)
      .width('100%')
      .padding({
        top: 10,
        bottom: 10,
        left: 16,
        right: 16
      });

      if (this.selectedImage) {
        Image(this.selectedImage)
          .width('100%')
          .aspectRatio(1)
          .objectFit(ImageFit.Cover);
      }
      Grid() {
        ForEach(this.imageArray, (item: Resource) => {
          this.gridItemBuilder(item);
        }, (item: string, index: number) => item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .width('100%')
      .layoutWeight(1)
      .columnsGap(2)
      .rowsGap(2)
      .padding({ top: 1 });
    }
    .width('100%')
    .bindSheet(this.isMenuOpen, this.postBuilder, { height: '100%', onDisappear: () => this.isMenuOpen = false })
  }
}

export { NewPostPage };
