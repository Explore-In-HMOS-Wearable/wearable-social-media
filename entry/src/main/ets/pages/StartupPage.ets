import { StorageManager } from '../model/StorageManager';
import { routePageNoParams } from '../RouterUtils';

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
