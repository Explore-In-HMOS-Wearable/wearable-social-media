export class CommonConstants {
  static readonly FULL_OPACITY: number = 1;

  static readonly SIXTY_OPACITY: number = 0.6;

  static readonly EIGHTY_OPACITY: number = 0.8;

  static readonly FONT_WEIGHT_FIVE: number = 500;

  static readonly WATER_FLOW_LAYOUT_WEIGHT: number = 1;

  static readonly WATER_FLOW_COLUMNS_TEMPLATE: string = '1fr 1fr';

  static readonly FULL_WIDTH: string = '100%';
  static readonly HALF_WIDTH: string = '50%';

  static readonly FULL_HEIGHT: string = '100%';

  static readonly CACHED_COUNT: number = 6;

  static readonly WATER_FLOW_FRICTION: number = 0.65;

  static readonly DATASOURCE_MIN_COUNT: number = 5;

  static readonly TOOLBAR_FONT_WEIGHT: number = 500;

  static readonly TIME_OUT_FIVE_HUNDREDS: number = 500;

  static readonly TIME_OUT_TWO_THOUSANDS: number = 2000;

  static readonly INVALID_INDEX: number = -1;

  static readonly EVENT_TOP_ICON: string = 'event_top_icon';

  static readonly EVENT_QUICK_TOP_FUNC: string = 'event_quick_top_func';

  static readonly EVENT_REFRESH_WATERFLOW_DATA: string = 'event_refresh_waterflow_data';

  static readonly EVENT_HIDE_ITEM_MENU: string = 'event_hide_item_menu';

  static readonly EVENT_REMOVE_ITEM: string = 'event_remove_item';

  static readonly INDEX_CONTENT_WIDTH: string = '91.1%';

  static readonly DIVIDER_HEIGHT: number = 0.5;

  static readonly DIVIDER_WIDTH: string = '93%';

  static readonly EIGHTY_FONT_WIDTH: string = '80%';

  static readonly DIVIDER_DRAWER_WIDTH: string = '90%';

  static readonly CARD_TITLE_HEIGHT: number = 20;

  static readonly CARD_TEXT_HEIGHT: number = 48;

  static readonly INDEX_TITLE_HEIGHT: number = 112;

  static readonly FLOW_HEIGHT: Length = 244;

  static readonly TRANSLATE_BOTTOM: number = 40;

  static readonly BORDER_RADIUS_INDEX_LIST: number = 18;

  static readonly LIST_CONTENT_HEIGHT: string = '110%';

  static readonly TRANSLATE_TOP: number = -40;

  static readonly SEARCH_TEXT: string = 'search';

  static readonly ARR: number[] = [1, 2, 3, 4, 5, 6];

  static readonly GOODS_ARR: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  static readonly COLORS: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];

  }

export interface Route {
  title: string |Resource,
  child: Array<ChildRoute>
}

export interface ChildRoute {
  text: string|Resource,
  to: string
}

export class NavPageStyle {
  static readonly BAR_HEIGHT: number = 56;

  static readonly POSITION_INITIAL: number = 0;
}

export class ToolBarStyle {
  static readonly MARGIN_BOTTOM: number = 3;

  static readonly IMAGE_SIZE: number = 24;

  static readonly LAYOUT_WEIGHT: string = '30%';

  static readonly DIVIDER_HEIGHT: number = 0.5;

  static readonly DIVIDER_OPACITY: number = 0.05;
}