# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
img_path = 'http://oasis.mogya.com/images/design/'
info_icon_sprite_path = img_path + 'info_icon_sprite_{$size}px.png'
Tag::Category.create(name:'ファストフード', parent_id:1)
Tag::Category.create(name:'喫茶店', parent_id:2)
Tag::Category.create(name:'ネットカフェ', parent_id:3,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'レンタルオフィス', parent_id:5,
  image:img_path + 'spot_icon_20_[type]_[size]px.png')
Tag::Category.create(name:'その他', parent_id:6,
  image:img_path + 'spot_icon_23_[type]_[size]px.png')
Tag::Category.create(name:'飲食店', parent_id:4,
  image:img_path + 'spot_icon_19_[type]_[size]px.png')
Tag::Category.create(name:'図書館', parent_id:16,
  image:img_path + 'spot_icon_24_[type]_[size]px.png')
Tag::Category.create(name:'マクドナルド', parent_id:1,
  image:img_path + 'spot_icon_01_[type]_[size]px.png')
Tag::Category.create(name:'ミスタードーナツ', parent_id:5,
  image:img_path + 'spot_icon_05_[type]_[size]px.png')
Tag::Category.create(name:'モスバーガー', parent_id:2,
  image:img_path + 'spot_icon_02_[type]_[size]px.png')
Tag::Category.create(name:'ロッテリア', parent_id:3,
  image:img_path + 'spot_icon_03_[type]_[size]px.png')
Tag::Category.create(name:'バーガーキング', parent_id:8,
  image:img_path + 'spot_icon_06_[type]_[size]px.png')
Tag::Category.create(name:'ウェンディーズ', parent_id:9,
  image:img_path + 'spot_icon_06_[type]_[size]px.png')
Tag::Category.create(name:'ケンタッキーフライドチキン', parent_id:4,
  image:img_path + 'spot_icon_04_[type]_[size]px.png')
Tag::Category.create(name:'サブウェイ', parent_id:7,
  image:img_path + 'spot_icon_06_[type]_[size]px.png')
Tag::Category.create(name:'待合室・ラウンジ', parent_id:15,
  image:img_path + 'spot_icon_23_[type]_[size]px.png')
Tag::Category.create(name:'フレッシュネスバーガー', parent_id:11,
  image:img_path + 'spot_icon_06_[type]_[size]px.png')
Tag::Category.create(name:'ファーストキッチン', parent_id:10,
  image:img_path + 'spot_icon_06_[type]_[size]px.png')
Tag::Category.create(name:'銀座ルノアール', parent_id:1,
  image:img_path + 'spot_icon_07_[type]_[size]px.png')
Tag::Category.create(name:'ドトール/エクセルシオール', parent_id:7,
  image:img_path + 'spot_icon_12_[type]_[size]px.png')
Tag::Category.create(name:'タリーズコーヒー', parent_id:6,
  image:img_path + 'spot_icon_11_[type]_[size]px.png')
Tag::Category.create(name:'スターバックス', parent_id:3,
  image:img_path + 'spot_icon_08_[type]_[size]px.png')
Tag::Category.create(name:'シャノアール（ベローチェ）', parent_id:9,
  image:img_path + 'spot_icon_14_[type]_[size]px.png')
Tag::Category.create(name:'ゲラゲラ', parent_id:11,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'ゆう遊空間', parent_id:6,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'マンボー', parent_id:16,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'アプレシオ', parent_id:2,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'スペースクリエイト自遊空間', parent_id:14,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'快活CLUB', parent_id:17,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'エアーズカフェ', parent_id:9,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'らくだ', parent_id:7,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'アイ・カフェ', parent_id:8,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'まんが広場', parent_id:5,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'まんがランド', parent_id:4,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'バグース', parent_id:15,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'コミックバスター', parent_id:12,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'メディアカフェポパイ', parent_id:1,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'ほっとステーション', parent_id:3,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'サイバック', parent_id:13,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'ゲオカフェ', parent_id:10,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'デスカット', parent_id:1)
Tag::Category.create(name:'珈琲館', parent_id:10,
  image:img_path + 'spot_icon_15_[type]_[size]px.png')
Tag::Category.create(name:'プロント', parent_id:8,
  image:img_path + 'spot_icon_13_[type]_[size]px.png')
Tag::Category.create(name:'カフェ・ド・クリエ', parent_id:4,
  image:img_path + 'spot_icon_09_[type]_[size]px.png')
Tag::Category.create(name:'シアトルズベスト', parent_id:5,
  image:img_path + 'spot_icon_10_[type]_[size]px.png')
Tag::Category.create(name:'喫茶店(その他)', parent_id:12,
  image:img_path + 'spot_icon_17_[type]_[size]px.png')
Tag::Category.create(name:'ファストフード(その他)', parent_id:12,
  image:img_path + 'spot_icon_06_[type]_[size]px.png')
Tag::Category.create(name:'その他レンタルオフィス', parent_id:2,
  image:img_path + 'spot_icon_20_[type]_[size]px.png')
Tag::Category.create(name:'ネットカフェ(その他)', parent_id:19,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'上島珈琲店', parent_id:11,
  image:img_path + 'spot_icon_16_[type]_[size]px.png')
Tag::Category.create(name:'コンビニエンスストア', parent_id:7,
  image:img_path + 'spot_icon_30_[type]_[size]px.png')
Tag::Category.create(name:'メイドカフェなど(萌)', parent_id:11,
  image:img_path + 'spot_icon_22_[type]_[size]px.png')
Tag::Category.create(name:'飲食店(その他)', parent_id:5,
  image:img_path + 'spot_icon_19_[type]_[size]px.png')
Tag::Category.create(name:'公共施設', parent_id:14,
  image:img_path + 'spot_icon_23_[type]_[size]px.png')
Tag::Category.create(name:'バー', parent_id:2,
  image:img_path + 'spot_icon_19_[type]_[size]px.png')
Tag::Category.create(name:'ワイプ', parent_id:18,
  image:img_path + 'spot_icon_18_[type]_[size]px.png')
Tag::Category.create(name:'サンマルクカフェ', parent_id:2,
  image:img_path + 'spot_icon_25_[type]_[size]px.png')
Tag::Category.create(name:'カラオケ', parent_id:3,
  image:img_path + 'spot_icon_21_[type]_[size]px.png')
Tag::Category.create(name:'居酒屋', parent_id:6,
  image:img_path + 'spot_icon_19_[type]_[size]px.png')
Tag::Category.create(name:'クリスピークリームドーナツ', parent_id:6,
  image:img_path + 'spot_icon_06_[type]_[size]px.png')
Tag::Category.create(name:'カー用品店', parent_id:5)
Tag::Category.create(name:'カーディーラー', parent_id:4)
Tag::Category.create(name:'フィットネスクラブ', parent_id:9)
Tag::Category.create(name:'百貨店', parent_id:17,
  image:img_path + 'spot_icon_34_[type]_[size]px.png')
Tag::Category.create(name:'ホテル', parent_id:10,
  image:img_path + 'spot_icon_23_[type]_[size]px.png')
Tag::Category.create(name:'献血ルーム', parent_id:12,
  image:img_path + 'spot_icon_23_[type]_[size]px.png')
Tag::Category.create(name:'理髪店・美容院', parent_id:13,
  image:img_path + 'spot_icon_33_[type]_[size]px.png')
Tag::Category.create(name:'コワーキングスペース', parent_id:6,
  image:img_path + 'spot_icon_26_[type]_[size]px.png')
Tag::Category.create(name:'イートインスペース', parent_id:2)
Tag::Category.create(name:'てもみん', parent_id:1,
  image:img_path + 'spot_icon_31_[type]_[size]px.png')
Tag::Category.create(name:'ネイルサロン', parent_id:8,
  image:img_path + 'spot_icon_32_[type]_[size]px.png')
Tag::Category.create(name:'ファミリーマート', parent_id:2,
  image:img_path + 'spot_icon_29_[type]_[size]px.png')
Tag::Category.create(name:'ローソン', parent_id:3,
  image:img_path + 'spot_icon_27_[type]_[size]px.png')
Tag::Category.create(name:'セブンイレブン', parent_id:1,
  image:img_path + 'spot_icon_28_[type]_[size]px.png')
Tag::Category.create(name:'ファミレス', parent_id:3)
Tag::Category.create(name:'ココイチ', parent_id:1)
Tag::Category.create(name:'フードコート', parent_id:4)
Tag::Other.create(name:'公式にOK',
  image: info_icon_sprite_path)
Tag::Other.create(name:'NG',
  image: info_icon_sprite_path)
Tag::Other.create(name:'実績あり',
  image: info_icon_sprite_path)
Tag::Other.create(name:'たぶんOK',
  image: info_icon_sprite_path)
Tag::Other.create(name:'Qi',
  image: info_icon_sprite_path)
Tag::Other.create(name:'イートインスペース',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'ソフトバンクWi-Fi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'docomoWi-Fi', detail:'docomo Wi-Fi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'auWi-Fi', detail:'au Wi-Fi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'フレッツ・スポット',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'BBモバイルポイント',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'FREESPOT',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'有線LAN',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'独自',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'STARBUCKSWi-Fi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'ファミマWi-Fi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'LawsonWi-Fi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'7SPOT', detail:'セブンスポット',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'TullysWi-Fi', detail:':Tullys Wi-Fi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'wi2',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'マクドナルドWiFi',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'FON',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'モビネクト',
  image: info_icon_sprite_path)
Tag::Wifi.create(name:'Wi-FiNex',
  image: info_icon_sprite_path)

