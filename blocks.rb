def benchmark
  start_time = Time.now
  
  if block_given?
    results = yield
  else
    results = nil
  end

  end_time = Time.now
  puts "Took #{end_time - start_time} seconds and returned #{results}"
end 

benchmark do |start_time|
  sleep 1
end

def div(content)
  "<div>#{content}</div>"
end

def link_to(title, url = nil)
  if block_given?
    url = title
    title = yield
  end
  "<a href=\"#{url}\">#{title}</a>"
end 

title = div("GoRails")
puts link_to(title, "https://gorails.com")

link = link_to "https://gorails.com" do
  div "GoRails"
end
puts link

def calculate(x, y, &block)
  puts block.call(x, y)
end 

calculate(2, 3) do
  2 ** 3
end
