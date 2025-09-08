import { MediaType } from '../LocalMedia';

export interface ILocalMedia {
  id: number;
  imageUrl: string;
  type: MediaType;
}