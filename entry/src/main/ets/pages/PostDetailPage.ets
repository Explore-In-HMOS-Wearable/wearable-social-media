import { PostItem } from '../components/PostItem';
import { IPostData } from '../model/Interface/IPostData';

@Entry
@Component
struct PostDetailPage {
  @State post: IPostData = {} as IPostData;

  aboutToAppear(): void {

  }
  build() {
     if (this.post)
     {PostItem({
       postData: this.post
     })}
     }
}

export { PostDetailPage };
