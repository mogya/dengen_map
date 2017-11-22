import Base from './Base';

export default class MoApi extends Base {
  constructor() {
    super();
  }

  search(params) {
    return this.client.get('/v0/search', { params: params });
  }
  station(params) {
    return this.client.get('/v0/station', { params: params });
  }
}
