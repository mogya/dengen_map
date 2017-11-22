import axios from 'axios';

const apiBase = 'https://oasis.mogya.com/api/';
// const apiBase = 'http://0.0.0.0/api/';

export default class Base {
  constructor() {
    this.client = this._createClient(apiBase);
  }

  _createClient(apiBase) {
    const element = document.getElementsByName('csrf-token')[0]
    if (element && element.content){
      return axios.create({
        baseURL: apiBase,
        timeout: 50000,
        headers: {'X-CSRF-Token': element.content}
      });
    } else {
      return axios.create({
        baseURL: apiBase,
        timeout: 50000
      });
    }
  }
}
