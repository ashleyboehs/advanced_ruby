class Subscription
  def canceled?
    false
  end

  alias cancelled? canceled?
  alias_method :cancelled?, :canceled?
end


p Subscription.new.cancelled?

class User
  def name
    "Ashley"
  end

  def full_name
    name
  end

class Admin < User
  def name
    "Admin"
  end

  def full_name
    name
  end
end

p Admin.new.full_name
