import Base from './Base';

export default class MoApiV1 extends Base {
  constructor() {
    super();
  }

  spots(params) {
    return this.client.get('/v1/spots.json', { params: params });
  }

  tags(params) {
    console.log(`moAPI calling. `, '/v1/tags.json', { params: params });
    return this.client.get('/v1/tags.json', { params: params });
  }
}
