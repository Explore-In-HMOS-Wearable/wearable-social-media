import { SymbolGlyphModifier } from '@kit.ArkUI';

@Component
struct SearchBarComponent {
  @Link searchInput: string;

  build() {
    Row() {
      Search({ value: this.searchInput, placeholder: $r('app.string.Search_Text') })

        .width('55%')
        .height('90%')
        .borderRadius(5)
        .onChange((value: string) => {
          this.searchInput = value
        })
        .onSubmit((value: string) => {
          this.searchInput = value
        })
        .searchIcon(new SymbolGlyphModifier($r('sys.symbol.magnifyingglass')).fontColor([Color.Gray])
          .rotate({ angle: 90 })
          .fontSize(13)
          .margin({ top: '1vp' }))
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: new SymbolGlyphModifier($r('sys.symbol.xmark')).fontColor([Color.Gray])
            .fontSize(9)
            .margin({ top: '2vp' })
        })
        .opacity(0.99)
        .textAlign(TextAlign.Start)
        .useEffect(true)
        .backgroundColor(Color.White)
        .fontColor(Color.Black)
        .foregroundColor(Color.Blue)
        .minFontSize('15fp')
        .placeholderFont({ size: 12, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .placeholderColor('#ad303030')
        .maxFontSize('23fp')
    }
    .height('30vp')
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}

export { SearchBarComponent };