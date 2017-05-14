class Link < ApplicationRecord
  belongs_to :spot
  enum link_type: [:unknown, :official, :facebook, :instagram, :twitter, :other]
  after_initialize :set_link_type

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

  def set_link_type
    case url
    when %r(://twitter.com/)
      self.link_type = :twitter
    when %r(://facebook.com/),%r(://www.facebook.com/)
      self.link_type = :facebook
    when %r(://www.instagram.com/)
      self.link_type = :instagram
    else
      self.link_type = :other
    end
  end

end
