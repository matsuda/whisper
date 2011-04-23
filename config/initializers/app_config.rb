Whisper::Application.config.blog = Blog.new
blog_info = YAML.load_file( Rails.root.join('config', 'blog.yml') )
blog_info.each_pair{ |key, value| Whisper::Application.config.blog.send("#{key}=", value) }
