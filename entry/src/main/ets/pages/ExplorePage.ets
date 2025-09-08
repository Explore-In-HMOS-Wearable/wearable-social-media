import { ExploreViewModel } from '../viewmodel/ExploreViewModel';
import { routePageWithObjectParams } from '../RouterUtils';
import { IPostData } from '../model/Interface/IPostData';
import { StickyPage } from './StickyPage';

@Component
struct ExplorePage {
  @State searchInput: string = '';
  @State exploreViewModel: ExploreViewModel = new ExploreViewModel()
  @State posts: Array<IPostData> = []
  @State isRefreshing: boolean = false
  scroller: Scroller = new Scroller()

  private navigateToPost(params: IPostData) {
    routePageWithObjectParams('pages/ExplorePageListView', params)
  }

  async getPosts() {
    await this.exploreViewModel.loadPosts((fetchedPosts) => {
      this.posts = fetchedPosts
    })
  }

  async aboutToAppear() {
    await this.getPosts()
  }

  build() {

    Scroll(this.scroller) {
      StickyPage()
    }
    .width('100%')
    .height('100%')
    .enableScrollInteraction(true)
    .backgroundColor(Color.Black)

  }
}

export { ExplorePage };
