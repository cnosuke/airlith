module ApplicationHelper
  GLOBAL_SITE_TITLE = 'AirCheck'.freeze
  def global_site_title; GLOBAL_SITE_TITLE; end

  def favicon
    # TODO: Add favicon files
    file_src = Rails.env.production? ? image_url("favicon.ico") : image_url("favicon_#{Rails.env}.ico")
    tag(:link, rel: "shortcut icon", type: "image/vnd.microsoft.icon", href: file_src)
  end

  def title(t)
    - title = "#{t} | Aircheck"
    content_for(:title, h(title))
  end
end
