# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ id: 1, name: 'Chicago' }, { id: 1, name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tag.delete_all
cat_fastfood = Tag::Category.find_or_create_by!({
  id: 1,
  name: "ファストフード",
  importance: 5,
})
cat_cafe = Tag::Category.find_or_create_by!({
  id: 2,
  name: "喫茶店",
  importance: 5,
})
cat_netcafe = Tag::Category.find_or_create_by!({
  id: 3,
  name: "ネットカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 5,
})
cat_rentaloffice = Tag::Category.find_or_create_by!({
  id: 4,
  name: "レンタルオフィス",
  image: "spot_icon_20_[type]_[size]px.png",
  image_id: 20,
  sprite_pos: 19,
  importance: 5,
})
Tag::Category.find_or_create_by!({
  id: 5,
  parent: cat_fastfood,
  name: "マクドナルド",
  image: "spot_icon_01_[type]_[size]px.png",
  image_id: 1,
  sprite_pos: 0,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 6,
  parent: cat_fastfood,
  name: "ミスタードーナツ",
  image: "spot_icon_05_[type]_[size]px.png",
  image_id: 5,
  sprite_pos: 4,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 7,
  parent: cat_fastfood,
  name: "モスバーガー",
  image: "spot_icon_02_[type]_[size]px.png",
  image_id: 2,
  sprite_pos: 1,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 8,
  parent: cat_fastfood,
  name: "ロッテリア",
  image: "spot_icon_03_[type]_[size]px.png",
  image_id: 3,
  sprite_pos: 2,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 9,
  parent: cat_fastfood,
  name: "バーガーキング",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  sprite_pos: 5,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 10,
  parent: cat_fastfood,
  name: "ウェンディーズ",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  sprite_pos: 5,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 11,
  parent: cat_fastfood,
  name: "ケンタッキーフライドチキン",
  image: "spot_icon_04_[type]_[size]px.png",
  image_id: 4,
  sprite_pos: 3,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 12,
  parent: cat_fastfood,
  name: "サブウェイ",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  sprite_pos: 5,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 13,
  parent: cat_fastfood,
  name: "フレッシュネスバーガー",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  sprite_pos: 5,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 14,
  parent: cat_fastfood,
  name: "ファーストキッチン",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  sprite_pos: 5,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 15,
  parent: cat_cafe,
  name: "銀座ルノアール",
  image: "spot_icon_07_[type]_[size]px.png",
  image_id: 7,
  sprite_pos: 6,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 16,
  parent: cat_cafe,
  name: "ドトール/エクセルシオール",
  image: "spot_icon_12_[type]_[size]px.png",
  image_id: 12,
  sprite_pos: 11,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 17,
  parent: cat_cafe,
  name: "タリーズコーヒー",
  image: "spot_icon_11_[type]_[size]px.png",
  image_id: 11,
  sprite_pos: 10,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 18,
  parent: cat_cafe,
  name: "スターバックス",
  image: "spot_icon_08_[type]_[size]px.png",
  image_id: 8,
  sprite_pos: 7,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 19,
  parent: cat_cafe,
  name: "シャノアール（ベローチェ）",
  image: "spot_icon_14_[type]_[size]px.png",
  image_id: 14,
  sprite_pos: 13,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 20,
  parent: cat_netcafe,
  name: "ゲラゲラ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 21,
  parent: cat_netcafe,
  name: "ゆう遊空間",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 22,
  parent: cat_netcafe,
  name: "マンボー",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 23,
  parent: cat_netcafe,
  name: "アプレシオ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 18,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 24,
  parent: cat_netcafe,
  name: "スペースクリエイト自遊空間",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 25,
  parent: cat_netcafe,
  name: "快活CLUB",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 26,
  parent: cat_netcafe,
  name: "エアーズカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 27,
  parent: cat_netcafe,
  name: "らくだ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 28,
  parent: cat_netcafe,
  name: "アイ・カフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 29,
  parent: cat_netcafe,
  name: "まんが広場",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 30,
  parent: cat_netcafe,
  name: "まんがランド",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 31,
  parent: cat_netcafe,
  name: "バグース",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 32,
  parent: cat_netcafe,
  name: "コミックバスター",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 33,
  parent: cat_netcafe,
  name: "メディアカフェポパイ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 34,
  parent: cat_netcafe,
  name: "ほっとステーション",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 35,
  parent: cat_netcafe,
  name: "サイバック",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 36,
  parent: cat_netcafe,
  name: "ゲオカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 37,
  parent: cat_rentaloffice,
  name: "デスカット",
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 38,
  parent: cat_cafe,
  name: "珈琲館",
  image: "spot_icon_15_[type]_[size]px.png",
  image_id: 15,
  sprite_pos: 14,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 39,
  parent: cat_cafe,
  name: "プロント",
  image: "spot_icon_13_[type]_[size]px.png",
  image_id: 13,
  sprite_pos: 12,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 40,
  parent: cat_cafe,
  name: "カフェ・ド・クリエ",
  image: "spot_icon_09_[type]_[size]px.png",
  image_id: 9,
  sprite_pos: 8,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 41,
  parent: cat_cafe,
  name: "シアトルズベスト",
  image: "spot_icon_10_[type]_[size]px.png",
  image_id: 10,
  sprite_pos: 9,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 42,
  parent: cat_cafe,
  name: "喫茶店(その他)",
  image: "spot_icon_17_[type]_[size]px.png",
  image_id: 17,
  sprite_pos: 16,
  importance: 9,
})
Tag::Category.find_or_create_by!({
  id: 43,
  parent: cat_fastfood,
  name: "ファストフード(その他)",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  sprite_pos: 5,
  importance: 9,
})
cat_other = Tag::Category.find_or_create_by!({
  id: 44,
  name: "その他",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  sprite_pos: 22,
  importance: 4,
})
Tag::Category.find_or_create_by!({
  id: 45,
  parent: cat_other,
  name: "待合室・ラウンジ",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  sprite_pos: 22,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 46,
  parent: cat_other,
  name: "図書館",
  image: "spot_icon_24_[type]_[size]px.png",
  image_id: 24,
  sprite_pos: 23,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 47,
  parent: cat_rentaloffice,
  name: "その他レンタルオフィス",
  image: "spot_icon_20_[type]_[size]px.png",
  image_id: 20,
  sprite_pos: 19,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 48,
  parent: cat_netcafe,
  name: "ネットカフェ(その他)",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 9,
})
Tag::Category.find_or_create_by!({
  id: 49,
  parent: cat_cafe,
  name: "上島珈琲店",
  image: "spot_icon_16_[type]_[size]px.png",
  image_id: 16,
  sprite_pos: 15,
  importance: 10,
})
cat_convinience_store = Tag::Category.find_or_create_by!({
  id: 50,
  parent: cat_other,
  name: "コンビニエンスストア",
  image: "spot_icon_30_[type]_[size]px.png",
  image_id: 30,
  sprite_pos: 29,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 51,
  parent: cat_other,
  name: "メイドカフェなど(萌)",
  image: "spot_icon_22_[type]_[size]px.png",
  image_id: 22,
  sprite_pos: 21,
  importance: 10,
})
cat_foods = Tag::Category.find_or_create_by!({
  id: 52,
  name: "飲食店",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  sprite_pos: 18,
  importance: 5,
})
Tag::Category.find_or_create_by!({
  id: 53,
  parent: cat_foods,
  name: "飲食店(その他)",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  sprite_pos: 18,
  importance: 9,
})
Tag::Category.find_or_create_by!({
  id: 54,
  parent: cat_other,
  name: "公共施設",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  sprite_pos: 22,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 55,
  parent: cat_foods,
  name: "バー",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  sprite_pos: 18,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 56,
  parent: cat_netcafe,
  name: "ワイプ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  sprite_pos: 17,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 57,
  parent: cat_cafe,
  name: "サンマルクカフェ",
  image: "spot_icon_25_[type]_[size]px.png",
  image_id: 25,
  sprite_pos: 24,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 58,
  parent: cat_other,
  name: "カラオケ",
  image: "spot_icon_21_[type]_[size]px.png",
  image_id: 21,
  sprite_pos: 20,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 59,
  parent: cat_foods,
  name: "居酒屋",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  sprite_pos: 18,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 60,
  parent: cat_fastfood,
  name: "クリスピークリームドーナツ",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 06,
  sprite_pos: 05,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 61,
  parent: cat_other,
  name: "カー用品店",
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 62,
  parent: cat_other,
  name: "カーディーラー",
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 63,
  parent: cat_other,
  name: "フィットネスクラブ",
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 64,
  parent: cat_other,
  name: "百貨店",
  image: "spot_icon_34_[type]_[size]px.png",
  image_id: 34,
  sprite_pos: 33,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 65,
  parent: cat_other,
  name: "ホテル",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  sprite_pos: 22,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 66,
  parent: cat_other,
  name: "献血ルーム",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  sprite_pos: 22,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 67,
  parent: cat_other,
  name: "理髪店・美容院",
  image: "spot_icon_33_[type]_[size]px.png",
  image_id: 33,
  sprite_pos: 32,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 68,
  parent: cat_other,
  name: "コワーキングスペース",
  image: "spot_icon_26_[type]_[size]px.png",
  image_id: 26,
  sprite_pos: 25,
  importance: 11,
})
Tag::Category.find_or_create_by!({
  id: 69,
  parent: cat_other,
  name: "イートインスペース",
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 70,
  parent: cat_other,
  name: "てもみん",
  image: "spot_icon_31_[type]_[size]px.png",
  image_id: 31,
  sprite_pos: 30,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 71,
  parent: cat_other,
  name: "ネイルサロン",
  image: "spot_icon_32_[type]_[size]px.png",
  image_id: 32,
  sprite_pos: 31,
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 72,
  parent: cat_convinience_store,
  name: "ファミリーマート",
  image: "spot_icon_29_[type]_[size]px.png",
  image_id: 29,
  sprite_pos: 28,
  importance: 15,
})
Tag::Category.find_or_create_by!({
  id: 73,
  parent: cat_convinience_store,
  name: "ローソン",
  image: "spot_icon_27_[type]_[size]px.png",
  image_id: 27,
  sprite_pos: 26,
  importance: 15,
})
Tag::Category.find_or_create_by!({
  id: 74,
  parent: cat_convinience_store,
  name: "セブンイレブン",
  image: "spot_icon_28_[type]_[size]px.png",
  image_id: 28,
  sprite_pos: 27,
  importance: 15,
})
Tag::Category.find_or_create_by!({
  id: 75,
  parent: cat_foods,
  name: "ファミレス",
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 76,
  parent: cat_foods,
  name: "ココイチ",
  importance: 10,
})
Tag::Category.find_or_create_by!({
  id: 77,
  parent: cat_foods,
  name: "フードコート",
  importance: 10,
})

Tag::Other.find_or_create_by!({
  id:78,
  name:'電源:お客様用コンセント',
  image_id:1,
  sprite_pos:0
})
Tag::Other.find_or_create_by!({
  id:79,
  name:'電源:NG',
  image_id:2,
  sprite_pos:1
})
Tag::Other.find_or_create_by!({
  id:80,
  name:'電源:壁コンセント',
  image_id:4,
  sprite_pos:3
})
Tag::Other.find_or_create_by!({
  id:81,
  name:'電源:充電器貸出',
  image_id:29,
  sprite_pos:28
})
Tag::Other.find_or_create_by!({
  id:82,
  name:'電源:USB',
  image_id:28,
  sprite_pos:27
})
Tag::Other.find_or_create_by!({
  id:83,
  name:'タバコ:全席禁煙',
  image_id:7,
  sprite_pos:6
})
Tag::Other.find_or_create_by!({
  id:84,
  name:'タバコ:全席喫煙可',
  image_id:8,
  sprite_pos:7
})
Tag::Other.find_or_create_by!({
  id:85,
  name:'タバコ:分煙',
  image_id:9,
  sprite_pos:8
})
Tag::Other.find_or_create_by!({
  id:86,
  name:'用途:ノマド'
})
Tag::Other.find_or_create_by!({
  id:87,
  name:'用途:充電'
})
Tag::Other.find_or_create_by!({
  id:88,
  name:'Qi',
  image_id:10,
  sprite_pos:9
})
Tag::Other.find_or_create_by!({
  id:89,
  name:'イートインスペース',
  image_id:25,
  sprite_pos:24
})
Tag::Other.find_or_create_by!({
  id:90,
  name:'駅構内'
})

Tag::Wifi.find_or_create_by!({
  id:91,
  name:'ソフトバンクWi-Fi',
  image_id:11,
  sprite_pos:10
})
Tag::Wifi.find_or_create_by!({
  id:92,
  name:'docomo Wi-Fi',
  image_id:12,
  sprite_pos:11
})
Tag::Wifi.find_or_create_by!({
  id:93,
  name:'au Wi-Fi',
  image_id:13,
  sprite_pos:12
})
Tag::Wifi.find_or_create_by!({
  id:94,
  name:'ホットスポット',
  image_id:15,
  sprite_pos:14
})
Tag::Wifi.find_or_create_by!({
  id:95,
  name:'フレッツ・スポット',
  image_id:16,
  sprite_pos:15
})
Tag::Wifi.find_or_create_by!({
  id:96,
  name:'BBモバイルポイント',
  image_id:17,
  sprite_pos:16
})
Tag::Wifi.find_or_create_by!({
  id:97,
  name:'FREESPOT',
  image_id:18,
  sprite_pos:17
})
Tag::Wifi.find_or_create_by!({
  id:98,
  name:'有線LAN',
  image_id:19,
  sprite_pos:18
})
Tag::Wifi.find_or_create_by!({
  id:99,
  name:'独自',
  image_id:20,
  sprite_pos:19
})
Tag::Wifi.find_or_create_by!({
  id:100,
  name:'UQWi-Fi',
  image_id:20,
  sprite_pos:19
})
Tag::Wifi.find_or_create_by!({
  id:101,
  name:'Wi-Fi Nex',
  image_id:20,
  sprite_pos:19
})
Tag::Wifi.find_or_create_by!({
  id:102,
  name:'eoモバイル',
  image_id:20,
  sprite_pos:19
})
Tag::Wifi.find_or_create_by!({
  id:103,
  name:'その他',
  image_id:20,
  sprite_pos:19
})
Tag::Wifi.find_or_create_by!({
  id:104,
  name:'FON',
  image_id:20,
  sprite_pos:19
})
Tag::Wifi.find_or_create_by!({
  id:105,
  name:'STARBUCKS Wi-Fi',
  image_id:21,
  sprite_pos:20
})
Tag::Wifi.find_or_create_by!({
  id:106,
  name:'ファミマWi-Fi',
  image_id:22,
  sprite_pos:21
})
Tag::Wifi.find_or_create_by!({
  id:107,
  name:'Lawson Wi-Fi',
  image_id:23,
  sprite_pos:22
})
Tag::Wifi.find_or_create_by!({
  id:108,
  name:'7SPOT',
  image_id:24,
  sprite_pos:23
})
Tag::Wifi.find_or_create_by!({
  id:109,
  name:'マクドナルドWiFi',
  image_id:20,
  sprite_pos:19
})
Tag::Wifi.find_or_create_by!({
  id:110,
  name:'wi2',
  image_id:26,
  sprite_pos:25
})
Tag::Wifi.find_or_create_by!({
  id:111,
  name:'wi2:Premium',
  image_id:30,
  sprite_pos:29
})
Tag::Wifi.find_or_create_by!({
  id:112,
  name:'wi2:Free',
  image_id:31,
  sprite_pos:30
})
Tag::Wifi.find_or_create_by!({
  id:113,
  name:'Tullys Wi-Fi',
  image_id:27,
  sprite_pos:26
})
