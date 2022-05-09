# hello_world.rb

require_relative 'advice'

class HelloWorld
  def call(env)
    status_200_response = ['200', {'Content-Type' => 'text/html'} ]
    status_404_response = [
      '404',{"Content-Type" => 'text/html', "Content-Length" => '48'},
      ["<html><body><h4>404 Not Found</h4></body></html>"] ]

    case env['REQUEST_PATH']
    when '/'
      template = File.read('views/index.erb')
      content = ERB.new(template)
      status_200_response << [content.result]
    when '/advice' then status_200_response << 
      ["<html><body><em><strong>#{Advice.new.generate}</strong></em></body></html>"]
    else status_404_response
    end

  end
end