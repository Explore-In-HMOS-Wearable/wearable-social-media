import { StorageManager } from '../model/StorageManager';

@Entry
@Component
struct StartupPage {
  private storage: StorageManager = new StorageManager();

  async aboutToAppear() {
    routePageNoParams('pages/LoginPage')
  }

  build() {

  }
}
