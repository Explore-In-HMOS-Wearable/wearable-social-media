import { IProfileResponse } from '../model/Interface/IProfileResponse';

@Component
struct ProfileStoriesComponent {
  @Prop user: IProfileResponse;

  @Builder
  listItemBuilder(resource: ResourceStr, item: string) {
    ListItem() {
      Column({ space: 10 }) {
        Image(resource).width(10).height(10)
        Text(item)
      }.alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center)
    }.width('30%').height('10%').onClick(() => {
    })
  }

  build() {
    List({ space: 30 }) {
      ForEach([], (item: string) => {
        this.listItemBuilder($r('app.media.add_story_icon'), item)
      }, (item: string, index: number) => item)

    }.height('14%').margin({ top: 20 })
    .width('85%')
    .listDirection(Axis.Horizontal)
  }
}

export { ProfileStoriesComponent };