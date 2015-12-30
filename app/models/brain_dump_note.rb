class BrainDumpNote < ActiveRecord::Base
  belongs_to :brain_dump
  belongs_to :user

  auto_html_for :body do
    html_escape
    image
    youtube(width: 560, height: 315, autoplay: false)
    vimeo(width: 560, height: 315, autoplay: false)
    soundcloud(width: 560, height: 100, autoplay: false)
    link(target: '_blank', rel: 'nofollow')
    simple_format
  end

  validates :user, presence: true
  validates :body, presence: true

end
