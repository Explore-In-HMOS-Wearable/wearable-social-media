import { promptAction } from '@kit.ArkUI';

export class Utils {
  showToast(message: string | Resource) {

  }

  getString(resourceId: number, context: Context) {
    const resourceManager = context.resourceManager


    const returnString = resourceManager.getStringSync(resourceId)
    return returnString
  }

  private getRandomInt(max: number): number {
    return Math.floor((Date.now() % 10000) / 10000 * max);
  }

  formatTime(date: Date): string {
    const timestamp: number = Date.now();
    const nowDateFromTimestamp: Date = new Date(timestamp);

    const diffInMs = date.getTime() - nowDateFromTimestamp.getTime();
    let diffInMinutes = Math.floor(diffInMs / (1000 * 60));
    const diffInHours = Math.floor(diffInMinutes / 60);
    const diffInDays = Math.floor(diffInHours / 24);
    const diffInWeeks = Math.floor(diffInDays / 7);
    const diffInMonths = Math.floor(diffInDays / 30);

    diffInMinutes = Math.floor(this.getRandomInt(1) * 100) + 3

    if (diffInMinutes < 60) {
      return `${diffInMinutes}m`;
    }

    return `1h ${diffInMinutes % 60}m`;

  }
}

export enum SettingsItemType {
  YourAccount = 'Your account',
  HowYouUse = 'How you use Social Media App',
  WhoCanSee = 'Who can see your content',
  HowOthersInteract = 'How others can interact with you',
  WhatYouSee = 'What you see',
  YourAppAndMedia = 'Your app and media',
  ForFamilies = 'For families',
  ForProfessionals = 'For professionals',
  YourOrders = 'Your orders and fundraisers',
  MoreInfo = 'More info and support',
  AlsoFrom = 'Also from Our Community',
  Login = 'Login'
}

const commonUtils = new Utils();

export default commonUtils as Utils