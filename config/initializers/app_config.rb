Whisper::Application.config.blog = Blog.new
blog_info = YAML.load_file( Rails.root.join('config', 'blog.yml') )
blog_info.each_pair{ |key, value| Whisper::Application.config.blog.send("#{key}=", value) }

# -*- coding: utf-8 -*-
require 'yaml'
require 'ostruct'

app_config = YAML::load(
  ERB.new(
    IO.read(Rails.root.join('config', 'config.yml'))
  ).result
)[Rails.env]

::AppConfig = OpenStruct.new(app_config)
