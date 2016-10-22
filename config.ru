class Pet
  @@status_bar_template_example = '<br> Health: 100' # this is 'class vaiable'
  # template to share it among all pages (do not repeat yourself) ;)
  
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when /feed/
      # do something with your Pet
      # store updated data to file || table || database || session
      # and render to the web:
      [200, {"Content-Type" => "text/html"}, ["<a href='/feed'>Feed Pet</a>#{@@status_bar_template_example}"]]
    else
      [404, {"Content-Type" => "text/html"}, ["I'm Lost!"]]
    end
  end
end

run Pet.new
# to run server 'rackup config.ru' in terminal