def a(*args)
  p args
end

a(1)
a("test", "test")
a("test", hash: :hello)
a(hash: :hello)

def b(bar: nil, **options)
  p bar
  p options
end

b
# b(1)
# b("test", "test")
# b("test", hash: :hello)
b(hash: :hello)
b(hash: :hello, bar: :foo)

def c(a, b, **options)
  p a, b, options
end

# c(1,2,3)
c(1, 2, hello: :world)

def div(content, **options)
  attributes = options.map { |k, v| "#{k}='#{v}'" }.join(" ")
  "<div #{attributes}>#{content}</div>"
end

p div("hello")
p div("hello", class: "text-blue")
p div("hello", class: "text-blue", "data-id": 1)
