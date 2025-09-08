@Component
struct SectionTitle {
  @Prop text: string;

  build() {
    Text(this.text)
      .fontColor(Color.Black)
      .fontSize(16)
      .margin({ top: 16, bottom: 16 })
      .textAlign(TextAlign.Start)
      .width('100%')
      .fontWeight(FontWeight.Medium);
  }
}

export { SectionTitle }