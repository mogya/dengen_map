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
  importance: 5,
})
cat_rentaloffice = Tag::Category.find_or_create_by({
  name: "レンタルオフィス",
  image: "spot_icon_20_[type]_[size]px.png",
  importance: 5,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "マクドナルド",
  image: "spot_icon_01_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ミスタードーナツ",
  image: "spot_icon_05_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "モスバーガー",
  image: "spot_icon_02_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ロッテリア",
  image: "spot_icon_03_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "バーガーキング",
  image: "spot_icon_06_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ウェンディーズ",
  image: "spot_icon_06_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ケンタッキーフライドチキン",
  image: "spot_icon_04_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "サブウェイ",
  image: "spot_icon_06_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "フレッシュネスバーガー",
  image: "spot_icon_06_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ファーストキッチン",
  image: "spot_icon_06_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "銀座ルノアール",
  image: "spot_icon_07_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "ドトール/エクセルシオール",
  image: "spot_icon_12_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "タリーズコーヒー",
  image: "spot_icon_11_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "スターバックス",
  image: "spot_icon_08_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "シャノアール（ベローチェ）",
  image: "spot_icon_14_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ゲラゲラ",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ゆう遊空間",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "マンボー",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "アプレシオ",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "スペースクリエイト自遊空間",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "快活CLUB",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "エアーズカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "らくだ",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "アイ・カフェ",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "まんが広場",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "まんがランド",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "バグース",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "コミックバスター",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "メディアカフェポパイ",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ほっとステーション",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "サイバック",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ゲオカフェ",
  image: "spot_icon_18_[type]_[size]px.png",
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
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "プロント",
  image: "spot_icon_13_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "カフェ・ド・クリエ",
  image: "spot_icon_09_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "シアトルズベスト",
  image: "spot_icon_10_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "喫茶店(その他)",
  image: "spot_icon_17_[type]_[size]px.png",
  importance: 9,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "ファストフード(その他)",
  image: "spot_icon_06_[type]_[size]px.png",
  importance: 9,
})
cat_other = Tag::Category.find_or_create_by({
  name: "その他",
  image: "spot_icon_23_[type]_[size]px.png",
  importance: 4,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "待合室・ラウンジ",
  image: "spot_icon_23_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "図書館",
  image: "spot_icon_24_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_rentaloffice,
  name: "その他レンタルオフィス",
  image: "spot_icon_20_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ネットカフェ(その他)",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 9,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "上島珈琲店",
  image: "spot_icon_16_[type]_[size]px.png",
  importance: 10,
})
cat_convinience_store = Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "コンビニエンスストア",
  image: "spot_icon_30_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "メイドカフェなど(萌)",
  image: "spot_icon_22_[type]_[size]px.png",
  importance: 10,
})
cat_foods = Tag::Category.find_or_create_by({
  name: "飲食店",
  image: "spot_icon_19_[type]_[size]px.png",
  importance: 5,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "飲食店(その他)",
  image: "spot_icon_19_[type]_[size]px.png",
  importance: 9,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "公共施設",
  image: "spot_icon_23_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "バー",
  image: "spot_icon_19_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_netcafe,
  name: "ワイプ",
  image: "spot_icon_18_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_cafe,
  name: "サンマルクカフェ",
  image: "spot_icon_25_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "カラオケ",
  image: "spot_icon_21_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_foods,
  name: "居酒屋",
  image: "spot_icon_19_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_fastfood,
  name: "クリスピークリームドーナツ",
  image: "spot_icon_06_[type]_[size]px.png",
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
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "ホテル",
  image: "spot_icon_23_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "献血ルーム",
  image: "spot_icon_23_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "理髪店・美容院",
  image: "spot_icon_33_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "コワーキングスペース",
  image: "spot_icon_26_[type]_[size]px.png",
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
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_other,
  name: "ネイルサロン",
  image: "spot_icon_32_[type]_[size]px.png",
  importance: 10,
})
Tag::Category.find_or_create_by({
  parent: cat_convinience_store,
  name: "ファミリーマート",
  image: "spot_icon_29_[type]_[size]px.png",
  importance: 15,
})
Tag::Category.find_or_create_by({
  parent: cat_convinience_store,
  name: "ローソン",
  image: "spot_icon_27_[type]_[size]px.png",
  importance: 15,
})
Tag::Category.find_or_create_by({
  parent: cat_convinience_store,
  name: "セブンイレブン",
  image: "spot_icon_28_[type]_[size]px.png",
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

Tag::Other.find_or_create_by({ name:'power_ok', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'power_ng', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'power_ok2', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'power_netcafe', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'nosmoke', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'smoke', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'smoke_separate', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'qi', image:'info_icon_sprite_{$size}px.png' })
Tag::Other.find_or_create_by({ name:'eatinspace', image:'info_icon_sprite_{$size}px.png' })

Tag::Wifi.find_or_create_by({ name:'softbank', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'docomo', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'au', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'livedoor', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'hotspot', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'flets', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'bbmobile', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'freespot', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'cable', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'other', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'starbucks', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'familymart', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'lawson', image:'info_icon_sprite_{$size}px.png' })
Tag::Wifi.find_or_create_by({ name:'seveneleven', image:'info_icon_sprite_{$size}px.png' })
