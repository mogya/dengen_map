import CategoryData from '@/util/CategoryData.js';

export default class MoSpot extends Object{
  constructor(spot) {
    super(spot);
    Object.getOwnPropertyNames(spot).forEach(key=>{
      this[key] = spot[key]
    })
    this.latitude = Number(spot.latitude);
    this.longitude = Number(spot.longitude);

    delete this.tag;

    this.icon = spot.icon.replace('[size]',45);
    // this.powerframeIcon = spot.icon_powerframe.replace('[size]',45).replace('_ok_','_none_').replace('_unknown_','_none_');
    // delete this.icon_powerframe;

    this.PcUrl = spot.url;
    delete this.url;

    this.moUrl = spot.mo_url;
    delete this.mo_url;

    this.categoryIcon = spot.prime_category.image.replace('[type]','none').replace('[size]','30');
    this.categoryName = spot.prime_category.name;
  }

}
