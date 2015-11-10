# hoge.hige.a_methodのような形式で書いた時、hoge,higeがnilかどうかチェックせずに済むようにするマジック
class NilClass
  def method_missing(name, *args)
    nil
  end
end
