export interface LocalMedia {
  id: number;
  imageUrl: string;
  type: MediaType;
}

export enum MediaType {
  Recent = 'recent',
  Favorites = 'favorites',
  Videos = 'videos',
}