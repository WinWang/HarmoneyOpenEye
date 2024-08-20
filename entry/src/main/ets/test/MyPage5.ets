import { CommonDialog } from '../views/CommonDialog'

@Entry
@Component
export struct MyPage{

  @State dialogTitle: Resource = $r('app.string.dialog_about_title')
  @State dialogContent: Resource = $r('app.string.project_desc')

  dialogController: CustomDialogController = new CustomDialogController({
    builder:CommonDialog({ title: $dialogTitle, description: $dialogContent, showPositive: false}),
    alignment: DialogAlignment.Center
  })

  build() {
    Column(){
      Text('MyChild').fontSize(30).onClick(()=>{
        this.dialogController.open()
      })
    }

  }
}