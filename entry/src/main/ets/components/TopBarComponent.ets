import { IProfileResponse } from '../model/Interface/IProfileResponse';

@Component
struct TopBarComponent {
  @Prop user: IProfileResponse;
  onClickFunction: () => void = () => {
  }

  build() {
    Column() {
      Text('Theodore Everleigh')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
    }
    .height('10%')
    .width('90%')
    .justifyContent(FlexAlign.Center)
  }
}

export { TopBarComponent };