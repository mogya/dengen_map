# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :spot
  enum link_type: %i[official facebook instgram twitter other]

  # linksの中でもっとも公式にふさわしいURLを得る
  # officialがあればそれを返す。それ以外の場合、facebookやtwitterなどがあればそれを返す
  def self.official_link(links)
    ret = nil
    links.each do |link|
      ret ||= link unless link.other?
      if link.official?
        ret = link
        break
      end
    end
    ret
  end
end
