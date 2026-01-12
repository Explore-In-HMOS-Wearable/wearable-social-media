import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonConstants } from '../CommonConstants';
import { SearchBarComponent } from '../components/SearchBarComponent';
import { WaterFlowDataSource } from '../utils/WaterFlowDataSource';
import { common } from '@kit.AbilityKit';
import cryptoFramework from '@ohos.security.cryptoFramework';

const TAG = 'StickyPage';

@Component
export struct StickyPage {
  private arr: number[] = CommonConstants.ARR;
  private colors: number[] = CommonConstants.COLORS;
  private scrollOffset: number = 0;
  private minSize: number = 80;
  private maxSize: number = 180;
  private sections: WaterFlowSections = new WaterFlowSections();
  scroller: Scroller = new Scroller();
  dataCount: number = 100;
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];
  oneColumnSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 1,
    columnsGap: 5,
    rowsGap: 10,
    margin: {
      top: 8,
      left: 0,
      bottom: 8,
      right: 0
    },
    onGetItemMainSizeByIndex: (index: number) => {
      if (index === 1) {
        return 100;
      } else {
        return 200;
      }
    }
  };
  twoColumnSection: SectionOptions = {
    itemsCount: 2,
    crossCount: 2,
    onGetItemMainSizeByIndex: (index: number) => {
      return 250;
    }
  };

  getResourceStringArray(resource: Resource): Array<string> {
    let result: string[] = []
    try {
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext
      result = context.resourceManager.getStringArrayValueSync(resource.id);
    } catch (e) {
      hilog.error(0x0000, TAG, `[getResourceString]getStringSync failed, error:${JSON.stringify(e)}.`);
    }
    return result;
  }

  async setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(await getSize());
      this.itemHeightArray.push(await getSize());
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
    const sectionOptions: SectionOptions[] = [];
    let count = 0;
    let oneOrTwo = 0;
    while (count < this.dataCount) {
      if (oneOrTwo++ % 2 === 0) {
        sectionOptions.push(this.oneColumnSection);
        count += this.oneColumnSection.itemsCount;
      } else {
        sectionOptions.push(this.twoColumnSection)
        count += this.twoColumnSection.itemsCount
      }
    }
    this.sections.splice(-1, 0, sectionOptions)

  }

  build() {
    Scroll() {
      Column() {
        WaterFlowComponent()
      }
    }
  }
}

@Component
struct WaterFlowComponent {
  private minSize: number = 80;
  private maxSize: number = 180;
  private colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  scroller: Scroller = new Scroller();
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];
  @State searchInput: string = '';

  async setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(await getSize());
      this.itemHeightArray.push(await getSize());
    }
  }

  aboutToAppear() {
    this.setItemSizeArray();
  }

  build() {
    Column({ space: 0 }) {

      Blank().width('100%').height('1vp')

      SearchBarComponent({ searchInput: $searchInput })

      WaterFlow({ scroller: this.scroller }) {

        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            this.ImageRelative(item)
          }
          .onAppear(() => {
            if (item + 20 === this.dataSource.totalCount()) {
              for (let i = 0; i < 100; i++) {
                this.dataSource.addLastItem()
              }
            }
          })
          .width(CommonConstants.FULL_WIDTH)
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(Color.White)
        }, (item: string) => item)


      }
      .columnsTemplate('repeat(auto-fill,80)')
      .columnsGap(5)
      .rowsGap(3)
      .cachedCount(10)
      .height('110%')
      .width('135%')
      .scrollBar(BarState.On)
      .margin({ left: '20%' })

    }
  }

  @Builder
  ImageRelative(item: number) {
    RelativeContainer() {

      Image($rawfile(`sections/${item % 4}.jpg`))
        .objectFit(ImageFit.Cover)
        .width(CommonConstants.FULL_WIDTH)
        .layoutWeight(1)
        .borderRadius($r('app.float.sections_item_radius'))
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .id('image');

      Stack() {
      }
      .linearGradient({
        angle: 0,
        colors: [[$r('app.color.linearGradient_first_color'), 0.0],
          [$r('app.color.linearGradient_last_color'), 1.0]]
      })
      .width(CommonConstants.FULL_WIDTH)
      .height($r('app.float.sections_item_blur_height'))
      .borderRadius($r('app.float.sections_item_radius'))
      .hitTestBehavior(HitTestMode.None)
      .alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      })
      .id('mask');

    }
  }
}

async function getSize() {
  const ret = (getRandomValue() * 180);
  return (ret > 80 ? ret : 80);
}

function getRandomValue(): number {
  try {
    const random = cryptoFramework.createRandom();
    const randomBytes = random.generateRandomSync(4);
    const view = new DataView(randomBytes.data.buffer);
    const randomUint32 = view.getUint32(0, false);
    return randomUint32 / 4294967296;
  } catch (error) {
    console.error('Random generation error:', error);
    return 1
  }
}