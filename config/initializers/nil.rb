# frozen_string_literal: true

# hoge.hige.a_methodのような形式で書いた時、hoge,higeがnilかどうかチェックせずに済むようにするマジック
class NilClass
  def method_missing(_name, *_args)
    nil
  end
end
