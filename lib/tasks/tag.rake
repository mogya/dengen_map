namespace :tag do
  desc "初期タグデータを作成します"
  # 通常は rake db:data:load_dir dir=seed_yml から取り込んだほうが早い。このtaskは、カテゴリの初期登録のためのタスク。

  # :environment は モデルにアクセスするのに必須
  task :generate => :environment do
    tag_normal_power_ok = Tag::Other.create(
        name: 'power_ok',
        sprite_pos:  0,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_power_ng = Tag::Other.create(
        name: 'power_ng',
        sprite_pos: 1,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_power_unknown = Tag::Other.create(
        name: 'power_unknown',
        sprite_pos: 2,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_power_ok2 = Tag::Other.create(
        name: 'power_ok2',
        sprite_pos: 3,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_power_smoke = Tag::Other.create(
        name: 'power_smoke',
        sprite_pos: 4,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_power_nosomke = Tag::Other.create(
        name: 'power_nosomke',
        sprite_pos: 5,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_nosmoke = Tag::Other.create(
        name: 'nosmoke',
        sprite_pos: 6,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_smoke = Tag::Other.create(
        name: 'smoke',
        sprite_pos: 7,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_smoke_separate = Tag::Other.create(
        name: 'smoke_separate',
        sprite_pos: 8,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_qi = Tag::Other.create(
        name: 'qi',
        sprite_pos: 9,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_softbank = Tag::Wifi.create(
        name: 'softbank',
        sprite_pos: 10,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_docomo = Tag::Wifi.create(
        name: 'docomo',
        sprite_pos: 11,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_au = Tag::Wifi.create(
        name: 'au',
        sprite_pos: 12,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_livedoor = Tag::Wifi.create(
        name: 'livedoor',
        sprite_pos: 13,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_hotspot = Tag::Wifi.create(
        name: 'hotspot',
        sprite_pos: 14,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_flets = Tag::Wifi.create(
        name: 'flets',
        sprite_pos: 15,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_bbmobile = Tag::Wifi.create(
        name: 'bbmobile',
        sprite_pos: 16,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_freespot = Tag::Wifi.create(
        name: 'freespot',
        sprite_pos: 17,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_cable = Tag::Wifi.create(
        name: 'cable',
        sprite_pos: 18,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_other = Tag::Wifi.create(
        name: 'other',
        sprite_pos: 19,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_starbucks = Tag::Wifi.create(
        name: 'starbucks',
        sprite_pos: 20,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_familymart = Tag::Wifi.create(
        name: 'familymart',
        sprite_pos: 21,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_lawson = Tag::Wifi.create(
        name: 'lawson',
        sprite_pos: 22,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_wifi_seveneleven = Tag::Wifi.create(
        name: 'seveneleven',
        sprite_pos: 23,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
    tag_normal_eatinspace = Tag::Other.create(
        name: 'eatinspace',
        sprite_pos: 24,
        image: 'http://oasis.mogya.com/images/design/info_icon_sprite_{$size}px.png'
    );
  end
end
