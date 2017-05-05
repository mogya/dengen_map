import Base from './Base';

export default class MoApi extends Base {
  constructor() {
    super();
  }

  search(params) {
    return this.client.get('/search', { params: params });
  }
  station(params) {
    return this.client.get('/station', { params: params });
  }
}
