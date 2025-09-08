import { PostItem } from '../components/PostItem';
import router from '@ohos.router';
import { IPostData } from '../model/Interface/IPostData';

@Entry
@Component
struct PostDetailPage {
  @State post: IPostData = {} as IPostData;

  aboutToAppear(): void {
    const params = router.getParams();
    this.post = params as IPostData;
  }
  build() {
     if (this.post)
     {PostItem({
       postData: this.post
     })}
     }
}

export { PostDetailPage };
