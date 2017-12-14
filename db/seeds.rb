# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ id: 1, name: 'Chicago' }, { id: 1, name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
cat_fastfood = Tag::Category.find_or_create_by({
  name: "ファストフード",
  importance: 5,
})
cat_cafe = Tag::Category.find_or_create_by({
  name: "喫茶店",
  importance: 5,
})
cat_netcafe = Tag::Category.find_or_create_by({
  name: "ネットカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 5,
})
cat_rentaloffice = Tag::Category.find_or_create_by({
  name: "レンタルオフィス",
  image: "spot_icon_20_[type]_[size]px.png",
  image_id: 20,
  importance: 5,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "マクドナルド",
  image: "spot_icon_01_[type]_[size]px.png",
  image_id: 1,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ミスタードーナツ",
  image: "spot_icon_05_[type]_[size]px.png",
  image_id: 5,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "モスバーガー",
  image: "spot_icon_02_[type]_[size]px.png",
  image_id: 2,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ロッテリア",
  image: "spot_icon_03_[type]_[size]px.png",
  image_id: 3,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "バーガーキング",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ウェンディーズ",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ケンタッキーフライドチキン",
  image: "spot_icon_04_[type]_[size]px.png",
  image_id: 4,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "サブウェイ",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "フレッシュネスバーガー",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ファーストキッチン",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "銀座ルノアール",
  image: "spot_icon_07_[type]_[size]px.png",
  image_id: 7,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "ドトール/エクセルシオール",
  image: "spot_icon_12_[type]_[size]px.png",
  image_id: 12,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "タリーズコーヒー",
  image: "spot_icon_11_[type]_[size]px.png",
  image_id: 11,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "スターバックス",
  image: "spot_icon_08_[type]_[size]px.png",
  image_id: 8,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "シャノアール（ベローチェ）",
  image: "spot_icon_14_[type]_[size]px.png",
  image_id: 14,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ゲラゲラ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ゆう遊空間",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "マンボー",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "アプレシオ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "スペースクリエイト自遊空間",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "快活CLUB",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "エアーズカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "らくだ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "アイ・カフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "まんが広場",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "まんがランド",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "バグース",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "コミックバスター",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "メディアカフェポパイ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ほっとステーション",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "サイバック",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ゲオカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_rentaloffice,
  name: "デスカット",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "珈琲館",
  image: "spot_icon_15_[type]_[size]px.png",
  image_id: 15,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "プロント",
  image: "spot_icon_13_[type]_[size]px.png",
  image_id: 13,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "カフェ・ド・クリエ",
  image: "spot_icon_09_[type]_[size]px.png",
  image_id: 9,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "シアトルズベスト",
  image: "spot_icon_10_[type]_[size]px.png",
  image_id: 10,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "喫茶店(その他)",
  image: "spot_icon_17_[type]_[size]px.png",
  image_id: 17,
  importance: 9,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ファストフード(その他)",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 6,
  importance: 9,
})
cat_other = Tag::Category.find_or_create_by({
  name: "その他",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  importance: 4,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "待合室・ラウンジ",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "図書館",
  image: "spot_icon_24_[type]_[size]px.png",
  image_id: 24,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_rentaloffice,
  name: "その他レンタルオフィス",
  image: "spot_icon_20_[type]_[size]px.png",
  image_id: 20,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ネットカフェ(その他)",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 9,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "上島珈琲店",
  image: "spot_icon_16_[type]_[size]px.png",
  image_id: 16,
  importance: 10,
})
cat_convinience_store = Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "コンビニエンスストア",
  image: "spot_icon_30_[type]_[size]px.png",
  image_id: 30,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "メイドカフェなど(萌)",
  image: "spot_icon_22_[type]_[size]px.png",
  image_id: 22,
  importance: 10,
})
cat_foods = Tag::Category.find_or_create_by({
  name: "飲食店",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  importance: 5,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "飲食店(その他)",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  importance: 9,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "公共施設",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "バー",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ワイプ",
  image: "spot_icon_18_[type]_[size]px.png",
  image_id: 18,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "サンマルクカフェ",
  image: "spot_icon_25_[type]_[size]px.png",
  image_id: 25,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "カラオケ",
  image: "spot_icon_21_[type]_[size]px.png",
  image_id: 21,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "居酒屋",
  image: "spot_icon_19_[type]_[size]px.png",
  image_id: 19,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "クリスピークリームドーナツ",
  image: "spot_icon_06_[type]_[size]px.png",
  image_id: 06,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "カー用品店",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "カーディーラー",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "フィットネスクラブ",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "百貨店",
  image: "spot_icon_34_[type]_[size]px.png",
  image_id: 34,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "ホテル",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "献血ルーム",
  image: "spot_icon_23_[type]_[size]px.png",
  image_id: 23,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "理髪店・美容院",
  image: "spot_icon_33_[type]_[size]px.png",
  image_id: 33,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "コワーキングスペース",
  image: "spot_icon_26_[type]_[size]px.png",
  image_id: 26,
  importance: 11,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "イートインスペース",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "てもみん",
  image: "spot_icon_31_[type]_[size]px.png",
  image_id: 31,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "ネイルサロン",
  image: "spot_icon_32_[type]_[size]px.png",
  image_id: 32,
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_convinience_store,
  name: "ファミリーマート",
  image: "spot_icon_29_[type]_[size]px.png",
  image_id: 29,
  importance: 15,
})
Tag::Category.find_or_create_by({
  parent: cat_convinience_store,
  name: "ローソン",
  image: "spot_icon_27_[type]_[size]px.png",
  image_id: 27,
  importance: 15,
})
Tag::Category.find_or_create_by({
  parent: cat_convinience_store,
  name: "セブンイレブン",
  image: "spot_icon_28_[type]_[size]px.png",
  image_id: 28,
  importance: 15,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "ファミレス",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "ココイチ",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "フードコート",
  importance: 10,
})

Tag::Other.find_or_create_by({ name:'電源:お客様用コンセント', image_id:0 })
Tag::Other.find_or_create_by({ name:'電源:NG', image_id:1 })
Tag::Other.find_or_create_by({ name:'電源:壁コンセント', image_id:3 })
Tag::Other.find_or_create_by({ name:'電源:充電器貸出', image_id:28 })
Tag::Other.find_or_create_by({ name:'電源:USB', image_id:27 })
Tag::Other.find_or_create_by({ name:'タバコ:全席禁煙', image_id:6 })
Tag::Other.find_or_create_by({ name:'タバコ:全席喫煙可', image_id:7 })
Tag::Other.find_or_create_by({ name:'タバコ:分煙', image_id:8 })
Tag::Other.find_or_create_by({ name:'用途:ノマド' })
Tag::Other.find_or_create_by({ name:'用途:充電' })
Tag::Other.find_or_create_by({ name:'Qi', image_id:9 })
Tag::Other.find_or_create_by({ name:'イートインスペース', image_id:24 })
Tag::Other.find_or_create_by({ name:'駅構内' })

Tag::Wifi.find_or_create_by({ name:'ソフトバンクWi-Fi', image_id:10 })
Tag::Wifi.find_or_create_by({ name:'docomo Wi-Fi', image_id:11 })
Tag::Wifi.find_or_create_by({ name:'au Wi-Fi', image_id:12 })
Tag::Wifi.find_or_create_by({ name:'ホットスポット', image_id:14 })
Tag::Wifi.find_or_create_by({ name:'フレッツ・スポット', image_id:15 })
Tag::Wifi.find_or_create_by({ name:'BBモバイルポイント', image_id:16 })
Tag::Wifi.find_or_create_by({ name:'FREESPOT', image_id:17 })
Tag::Wifi.find_or_create_by({ name:'有線LAN', image_id:18 })
Tag::Wifi.find_or_create_by({ name:'独自', image_id:19 })
Tag::Wifi.find_or_create_by({ name:'UQWi-Fi', image_id:19 })
Tag::Wifi.find_or_create_by({ name:'Wi-Fi Nex', image_id:19 })
Tag::Wifi.find_or_create_by({ name:'eoモバイル', image_id:19 })
Tag::Wifi.find_or_create_by({ name:'その他', image_id:19 })
Tag::Wifi.find_or_create_by({ name:'FON', image_id:19 })
Tag::Wifi.find_or_create_by({ name:'STARBUCKS Wi-Fi', image_id:20 })
Tag::Wifi.find_or_create_by({ name:'ファミマWi-Fi', image_id:21 })
Tag::Wifi.find_or_create_by({ name:'Lawson Wi-Fi', image_id:22 })
Tag::Wifi.find_or_create_by({ name:'7SPOT', image_id:23 })
Tag::Wifi.find_or_create_by({ name:'マクドナルドWiFi', image_id:19 })
Tag::Wifi.find_or_create_by({ name:'wi2', image_id:25 })
Tag::Wifi.find_or_create_by({ name:'wi2:Premium', image_id:29 })
Tag::Wifi.find_or_create_by({ name:'wi2:Free', image_id:30 })
Tag::Wifi.find_or_create_by({ name:'Tullys Wi-Fi', image_id:26 })
