class Post
end

module Admin
  class Post
    class Name
    end
  end

  class User
    p Module.nesting
    p ::Post
  end
end

class Admin::User
  p Module.nesting
  p Admin::Post
  ::Post
end
