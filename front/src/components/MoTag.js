export default class MoTag extends Object{
  constructor(tag, size) {
    super(tag);
    this.id = tag.id;
    this.name = tag.name;
    this.type = tag.type;
    this.detail = tag.detail;
    this.importance = tag.importance;
    this.sprite_pos = tag.sprite_pos
    if (tag.image != null){
        this.image = `https://oasis.mogya.com/images/design/${tag.image.replace('[size]',size).replace('[type]','none')}`;
    }else{
        this.image = null;
    }
    this.background_url = ""
    this.background_pos = tag.sprite_pos
    this.parent_id = tag.parent_id
    this.image_id = tag.image_id
    this.image = tag.image

    if (this.sprite_pos != null){
        this.sprite_x = this.sprite_pos * size
        if (this.type === 'Tag::Category'){
            this.sprite_url = `//oasis.mogya.com/images/design/spot_icon_sprite_${size}px.png`
        }else{
            this.sprite_url = `//oasis.mogya.com/images/design/info_icon_sprite_${size}px.png`
        }
    }else{
        this.sprite_x = null
    }
  }
}
