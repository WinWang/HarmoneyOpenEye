/**
 * Tab item info.
 */
export interface TabItem {
  /**
   * Tab item index.
   */
  index?: number;

  /**
   * Tab item title.
   */
  title?: string;

  /**
   * Image activated.
   */
  imageActivated?: Resource;

  /**
   * Image original.
   */
  imageOriginal?: Resource;


  rankType?: string
}