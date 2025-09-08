import { clearBackstack, routePageNoParams, routerBack } from '../RouterUtils';
import { rcp } from '@kit.RemoteCommunicationKit';
import router from '@ohos.router';
import { IProfileResponse } from '../model/Interface/IProfileResponse';
import { MockProfileResponse } from '../mockServices/mockData/MockProfileResponse';

@Entry
@Component
struct EditProfilePage {
  @State anyChange: boolean = false;
  @State isImagePicked: boolean = false;
  @State selectedUris: Array<string> = [];

  navigateToSettingsPage() {
    routePageNoParams('pages/SettingsPage');
  }

  @State currentUser: IProfileResponse = MockProfileResponse;

  aboutToAppear(): void {
    const params = router.getParams();
    this.currentUser = params as IProfileResponse
  }

  editUserData() {
    let tempPath = ''
    if (this.selectedUris.length > 0) {
      const imageName: string = this.selectedUris[0]?.split('/').pop() || '';

    }
    const userData = new rcp.MultipartForm({
      username: this.currentUser.profile.user.username,
      email: this.currentUser.profile.user.email || '',
      biography: this.currentUser.profile.biography || '',
      file: {
        contentOrPath: tempPath
      }
    })

    routePageNoParams('pages/StartupPage')
    clearBackstack()

  }

  build() {
    Scroll() {
      Column() {
        Row({ space: 5 }) {
          Image($r('app.media.back_arrow_icon'))
            .width(40)
            .height(30)
            .objectFit(ImageFit.ScaleDown)
            .onClick(() => {
              routerBack();
            });

          Text('Edit Profile')
            .fontWeight(FontWeight.Bold)
            .fontSize(20);
        }
        .width('100%')
        .padding(10);

        Divider();
        Row() {
          Image($r(this.currentUser.profile.photo))
            .padding({ top: 10, bottom: 10 })
            .width(120)
            .height(120)
            .borderRadius(250)
            .onClick(() => {
            });
        }

        Row() {
          Text('Edit your profile picture')

            .fontColor(Color.Blue)
            .fontWeight(FontWeight.Bold);
        }

        Row() {
          Column() {
            Row() {
              Text('Username')
                .fontSize(16)
                .width('100%')
                .height(50);
            }
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Start);

            Row() {
              Text('Biography')
                .fontSize(16)
                .width('100%')
                .height(80);
            }
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Start);

            Divider()
            Row() {
              Text('Email')
                .fontSize(16)
                .width('100%')
                .height(50);
            }
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Start);
          }
          .padding({ left: 10 })
          .width('30%');

          Column() {
            Row() {
              TextInput({ text: this.currentUser.profile.user.username })
                .onChange((value: string) => {
                  if (this.currentUser) {
                    this.currentUser.profile.user.username = value;
                    this.anyChange = true;
                  }
                })
                .width('100%')
                .height(50)
                .padding(10)
                .backgroundColor('#FFF');
            }

            Divider()
              .color(Color.Black)
            Row() {
              TextArea({ text: this.currentUser.profile.biography })
                .onChange((value: string) => {
                  if (this.currentUser) {
                    this.currentUser.profile.biography = value;
                    this.anyChange = true;
                  }
                })
                .width('100%')
                .height(80)
                .padding(10)
                .backgroundColor('#FFF');
            }

            Divider()
            Row() {
              TextInput({ text: this.currentUser.profile.user.email })
                .onChange((value: string) => {
                  if (this.currentUser) {
                    this.currentUser.profile.user.email = value;
                    this.anyChange = true;
                  }
                })
                .width('100%')
                .height(50)
                .padding(10)
                .backgroundColor('#FFF');
            }
          }
          .padding({ right: 8 })
          .width('70%');
        }

        Row() {
          Button('Done')
            .backgroundColor('#FFF')
            .enabled(this.anyChange)
            .fontColor(this.anyChange ? Color.Blue : Color.Gray)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              this.editUserData();
            });
        }
        .alignSelf(ItemAlign.End)
        .padding({ right: 8 });
      }
    }
    .width('100%')
    .scrollable(ScrollDirection.Vertical);
  }
}

export { EditProfilePage };