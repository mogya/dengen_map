export default class MoUrlParams {
  constructor(){
    this.params = {};
    this._load();
    this.updateTitleTag();
  }
  _load(){
    if (location.search.length > 0){
      const q = decodeURIComponent(location.search.substring(1)).split('&');
      q.forEach((pair)=>{
        let kv = pair.split('=');
        this.params[kv[0]] = kv[1];
      });
    }
    this.title = this.getTitle();
  }
  _save(){
    let pathnames = window.location.pathname.split('/');
    if (pathnames[pathnames.length-1].indexOf('map')>=0){
      pathnames.push(this.title);
    }else{
      pathnames[pathnames.length-1] = this.title;
    }

    let queryString = '?';
    for (let key in this.params) {
      if (/[^0-9,.]/.test(this.params[key])){
        queryString = queryString + `&${key}=${encodeURIComponent(this.params[key])}`;
      }else{
        queryString = queryString + `&${key}=${this.params[key]}`;
      }
    }
    history.replaceState( '', null, pathnames.join('/').replace(/\/$/,'')+queryString.replace('?&','?') );
  }
  set(key,value){
    this.params[key] = value;
    this._save();
    return this;
  }
  get(key){
    if (!this.params[key]){
      let match = location.search.match(new RegExp(key+'=(.*?)(&|$)'));
      if(match) {
        this.params[key] = decodeURIComponent(match[1]);
      }
    }
    return this.params[key];
  }
  getInt(key){
    return parseInt(this.get(key));
  }
  getBool(key){
    return (this.get(key)==='true');
  }
  setLatLng(lat,lng){
    const ll= `${lat},${lng}`;
    return this.set('ll',ll);
  }
  getLatLng(){
    const ll = this.get('ll');
    if (ll){
      const latlng = ll.split(',');
      return { lat: parseFloat(latlng[0]), lng: parseFloat(latlng[1]) };
    }else{
      return null;
    }
  }
  getLat(){
    const latlng = this.getLatLng();
    if (latlng){
      return this.getLatLng().lat;
    }else{
      return null;
    }
  }
  getLng(){
    const latlng = this.getLatLng();
    if (latlng){
      return this.getLatLng().lng;
    }else{
      return null;
    }
  }
  setTitle(title){
    this.title = title;
    this._save();
    this.updateTitleTag();
    return this;
  }
  getTitle(){
    if (!this.title){
      const title = window.location.pathname.split('/').pop();
      if (title.indexOf('map')<0){
        this.title = title;
      }else{
        this.title = null;
      }
    }
    return this.title;
  }
  updateTitleTag(){
    let title = this.getTitle();
    if (title){
      document.title = `${decodeURIComponent(title)}付近の電源マップ - モバイラーズオアシス`;
    }else{
      document.title = '電源マップ - モバイラーズオアシス';
    }
  }
}
