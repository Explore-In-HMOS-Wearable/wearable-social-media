import { LocalMedia } from '../model/LocalMedia';

export abstract class MediaService {
  abstract fetchLocalMedia(): Promise<LocalMedia[]>;
}