require 'logger'
require 'json'

File.open('log/test.log','a') do |f|
  10.times do |i|
    f.puts JSON.generate(
      a: {b: 1*i},
      c: 2*i
    )
    f.flush
    sleep 1
  end
end
