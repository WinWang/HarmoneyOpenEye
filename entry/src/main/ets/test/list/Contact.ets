import { util } from '@kit.ArkTS';

export class Contact {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}

export class ContactsGroup {
  title: string = ''
  contacts: Array<object> | null = null
  key: string = ''
}