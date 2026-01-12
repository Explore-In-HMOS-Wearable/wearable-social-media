
@Component
struct TopBarComponent {
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