import { display } from '@kit.ArkUI';
import { Contact, ContactsGroup } from './Contact';
import { DividerTmp } from './DividerTmp';
import { util } from '@kit.ArkTS';

let MTop: Record<string, number> = { 'top': 50 }

let mSize = 10;

export let contactsGroups: object[] = [
  {
    title: 'A',
    contacts: [
      new Contact('艾佳', $r('app.media.loading')),
      new Contact('安安', $r('app.media.icon_unsel_mine')),
      new Contact('Angela', $r('app.media.icon_topic')),
      new Contact('Angela', $r('app.media.icon_topic')),
      new Contact('Angela', $r('app.media.icon_topic')),
      new Contact('Angela', $r('app.media.icon_topic')),
      new Contact('Angela', $r('app.media.icon_topic')),
      new Contact('Angela', $r('app.media.icon_topic')),
    ],
    key: util.generateRandomUUID(true)
  } as ContactsGroup,

  {
    title: 'B',
    contacts: [
      new Contact('白叶', $r('app.media.icon_rank')),
      new Contact('伯明', $r('app.media.ic_tab_normal')),
      new Contact('伯明', $r('app.media.ic_tab_normal')),
      new Contact('伯明', $r('app.media.ic_tab_normal')),
      new Contact('伯明', $r('app.media.ic_tab_normal')),
      new Contact('伯明', $r('app.media.ic_tab_normal')),
      new Contact('伯明', $r('app.media.ic_tab_normal')),
    ],
    key: util.generateRandomUUID(true)
  } as ContactsGroup,

]


@Entry
@Component
struct StackExample {
  private searchArr: Array<string> = ['1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2'];
  private screenWidth = px2vp(display.getDefaultDisplaySync().width);
  private gap = (this.screenWidth - this.screenWidth * 0.9) / 3
  private listScroller: Scroller = new Scroller();


  @State egDivider: DividerTmp = new DividerTmp(1, 10, 10, '#ffe9f0f0')

  build() {

    Column() {
      RelativeContainer() {
        Text()
          .backgroundColor(Color.Red)
          .height(100)
          .width(100)
          .id('row1')
          .alignRules({
            'top': { 'anchor': '__container__', 'align': VerticalAlign.Top }, left: {
              'anchor': '__container__',
              align: HorizontalAlign.Start
            }
          })

        Text()
          .backgroundColor(Color.Green)
          .height(100)
          .width(100)
          .id('row2')
          .alignRules({
            'top': { 'anchor': 'row1', 'align': VerticalAlign.Bottom }, right: {
              'anchor': 'row1',
              align: HorizontalAlign.End
            }
          })

        Text()
          .backgroundColor(Color.Yellow)
          .height(100)
          .width(100)
          .id('row3')
          .alignRules({
            'top': { 'anchor': 'row2', 'align': VerticalAlign.Top }, left: {
              'anchor': 'row2',
              align: HorizontalAlign.End
            }
          })

      }.border({ width: 10, color: Color.Brown }).height(200).width('100%')


      List({space:10,scroller:this.listScroller}) {
        ForEach(contactsGroups, (item: ContactsGroup, index) => {

          ListItemGroup({ header: this.itemHead(item.title) }) {

            ForEach(item.contacts,(contact:Contact) =>{
              ListItem() {
                Row() {
                  Text(contact.name).fontColor(Color.Black).fontSize(30)
                  Image(contact.icon).width(40).height(40).margin(10)
                }.height('auto')
              }
            })

          }

        })
      }.width('100%').alignListItem(ListItemAlign.Center)
      .divider(this.egDivider).sticky(StickyStyle.Header).layoutWeight(1) // 自适应占满剩余空间


      Button('回到顶部').onClick(()=>{
        this.listScroller.scrollToIndex(0)
      })
    }.width('100%').height('100%')


  }

  @Builder
  itemHead(text:string){
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }
}