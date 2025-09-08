import { LocalMedia } from '../model/LocalMedia';
import { MediaService } from '../service/MediaService';
import { mockLocalMediaDataList } from './mockData/MockLocalMediaDataList';

export class MockMediaService extends MediaService {
  async fetchLocalMedia(): Promise<LocalMedia[]> {
    return mockLocalMediaDataList as Array<LocalMedia>
  }

}