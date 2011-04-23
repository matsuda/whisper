module BlogHelper
  # alias Blog class
  # see app/models/blog.rb
  # This may be deprecated in future...
  def blog
    Whisper::Application.config.blog
  end
end
