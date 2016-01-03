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

  # paperclip_file_opts = { styles: lambda { |a| a.instance.is_image? ? { :small => "x200>", :medium => "x300>", :large => "x400>" } : {}},
  paperclip_file_opts = { styles: { small: "x200>", medium: "x300>", large: "x400>" },
  # paperclip_file_opts = { styles: lambda { |a| a.instance.check_file_type },
                          :storage => :s3,
                          :s3_credentials => YAML.load_file(Rails.root + 'config/s3.yml')
                        }

  case Rails.env
    when "development" then bucket = 'projectmgmt/projectmgmt_dev'
    when "staging"     then bucket = 'projectmgmt/projectmgmt_staging'
    when "production"  then bucket = 'projectmgmt/projectmgmt_prod'
  end

  paperclip_file_opts.merge! :bucket => bucket

  has_attached_file :upload, paperclip_file_opts

  validates_attachment_content_type :upload, content_type: /\Aimage\/.*\Z/
        # content_type: { content_type: ['image/jpeg', 'image/png', 'image/jpg', 'application/pdf', 'application/doc', 'application/docx'] }
        # :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'application/pdf', 'application/doc', 'application/docx'] }
        # :content_type => { :content_type => ['/\Aimage\/.*\Z/', '/\Aapplication\/.*\Z/'] }

  # def is_image?
  #   attachment.instance.attachment_content_type =~ %r(image)
  # end

  # def check_file_type
  #   if is_image_type?
  #     { :small => "x200>", :medium => "x300>", :large => "x400>" }
  #   else
  #     {}
  #   end
  # end

  # def is_image_type?
  #   file_content_type =~ %r(image)
  # end

end
