class Blog
  attr_accessor :title, :description, :keywords, :author

  def self.method_missing(method, *args, &block)
    blog = Whisper::Application.config.blog
    if blog.respond_to?(method)
      blog.__send__(method, *args, &block)
    else
      super
    end
  end
end
