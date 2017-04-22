import CategoryData from './util/CategoryData.js';

export default class MoSpot extends Object{
  constructor(spot) {
    super(spot);
    this.id = spot.entry_id;
    this.latitude = Number(spot.latitude);
    this.longitude = Number(spot.longitude);

    this.tags = spot.tag.split(',');
    delete this.tag;

    this.wirelesses = spot.wireless.split(',');
    delete this.wireless;

    this.icon = spot.icon.replace('[size]',45);
    this.powerframeIcon = spot.icon_powerframe.replace('[size]',45).replace('_ok_','_none_');
    delete this.icon_powerframe;

    this.PcUrl = spot.url_pc;
    delete this.url_pc;

    this.moUrl = spot.mo_url;
    delete this.mo_url;

    this.urlTitle = spot.url_title;
    delete this.url_title;

    let currentCategory = {
      importance: 0,
      name: "その他",
      image: "//oasis.mogya.com/images/design/spot_icon_23_[type]_[size]px.png"
    };
    this.category.forEach((category)=>{
      if (CategoryData[category] && CategoryData[category].image){
        if (currentCategory.importance < CategoryData[category].importance){
          currentCategory.name = category;
          currentCategory.image = CategoryData[category].image;
          currentCategory.importance = CategoryData[category].importance;
        }
      }
    });
    this.categoryIcon = currentCategory.image.replace('[type]','none').replace('[size]','30');
    this.categoryName = currentCategory.name;
    // this.spotMarkerImage = {
    // url: 'http://localhost:8080/dist/tullys.svg',
    // scaledSize: new google.maps.Size(45, 45),
    // origin: new google.maps.Point(0, 0),
    // anchor: new google.maps.Point(0, 22)
    // };
  }

}
