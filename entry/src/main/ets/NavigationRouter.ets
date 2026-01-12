import { MainPage } from './pages/MainPage';
import { MenuPage } from './pages/MenuPage';
import { Splash } from './pages/Splash';

@Entry
@Component
struct NavigationRouter {
  pageInfos: NavPathStack = new NavPathStack()
  private tabsController: TabsController = new TabsController();
  private currentIndex: number = 0;

  @Builder
  routerMap(builderName: string, param: object) {
    if (builderName === 'SplashPage') {
      Splash()
    } else if (builderName === 'MainPage') {
      MainPage()
    } else if (builderName === 'MenuPage') {
      MenuPage()
    }
  }

  aboutToAppear() {
    this.pageInfos.pushPathByName('SplashPage', null);
  }

  build() {
    Navigation(this.pageInfos) {
    }
    .mode(NavigationMode.Stack)
    .navDestination(this.routerMap)
    .hideTitleBar(true)
    .hideToolBar(true)
    .hideBackButton(true)
  }
}

