import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';


const TAG: string = '[StorageManagement]';
let storage: preferences.Preferences;
let storageTemp: preferences.Preferences;

export class StorageManager {

  async getFromStorage(context: common.Context, url: string) {
    const name = url;
    try {
      storage = await preferences.getPreferences(context, `${name}`);
    } catch (err) {
      Error(`getStorage failed, code is ${err?.code}, message is ${err?.message}`);
    }

  }

  async getStorage(context: common.Context, url: string) {
    storage = storageTemp;
    await this.getFromStorage(context, url);
    return storage;
  }

  async putStorageValue(context: common.Context, key: string, value: string, url: string) {
    storage = await this.getStorage(context, url);
    try {
      await storage.put(key, value);
      await storage.flush();
    } catch (err) {
    }
    return
  }

  async hasStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    let result: boolean = false;
    try {
      result = await storage.has(key);
    } catch (err) {
    }
    return result;
  }

  async getStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    let getValue: preferences.ValueType = 'null';
    try {
      getValue = await storage.get(key, false);
    } catch (err) {
    }
    return getValue;
  }

  async deleteStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    try {
      await storage.delete(key);
      await storage.flush();
    } catch (err) {
    }
    return
  }

}

