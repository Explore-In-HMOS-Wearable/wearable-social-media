import { MockMediaService } from '../mockServices/MockMediaService';
import { LocalMedia, MediaType } from '../model/LocalMedia';

export class NewPostViewModel {
  private service: MockMediaService;
  private _imageGrid: Array<LocalMedia> = [];
  private _selectedImage: LocalMedia | null = null;
  private _selectedMediaType: MediaType = MediaType.Recent;
  private _filteredImageGrid: Array<LocalMedia> = [];
  private _isLoading: boolean = false;
  private _error: string | null = null;

  constructor() {
    this.service = new MockMediaService();
  }

  getImageGrid(): Array<LocalMedia> {
    return this._filteredImageGrid;
  }

  getSelectedImage(): LocalMedia | null {
    return this._selectedImage;
  }

  getSelectedMediaType(): MediaType {
    return this._selectedMediaType;
  }

  getIsLoading(): boolean {
    return this._isLoading;
  }

  getError(): string | null {
    return this._error;
  }

  async loadImages(updateCallback: (filteredImages: Array<LocalMedia>) => void) {
    try {
      this._isLoading = true;
      const fetchedImages = await this.service.fetchLocalMedia();
      this._imageGrid = fetchedImages;
      this._selectedImage = fetchedImages[0]
      this.filterMediaByType(this._selectedMediaType, updateCallback);
      this._isLoading = false;
    } catch (error) {
      this._error = 'Error when loading images';
      this._isLoading = false;
    }
  }

  filterMediaByType(type: MediaType, updateCallback: (filteredImages: Array<LocalMedia>) => void) {
    this._selectedMediaType = type;

    if (type === MediaType.Recent) {
      this._filteredImageGrid = this._imageGrid;
    } else {
      this._filteredImageGrid = this._imageGrid.filter(media => media.type === type);
    }

    updateCallback(this._filteredImageGrid);
  }

  selectImage(image: LocalMedia, updateCallback: (selectedImage: LocalMedia) => void) {
    this._selectedImage = image;
    updateCallback(this._selectedImage);
  }
}
