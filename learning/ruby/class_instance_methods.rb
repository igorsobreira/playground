
module DogMixin
  def self.included(base)
    base.extend DogMixinClassMethods
  end
end

module DogMixinClassMethods
  def assign(*names)
    @names = names
  end

  def dog_names
    @names
  end
end

class Owner
  include DogMixin
end

class Sailor < Owner
  assign :spock, :wind
end

class Nerd < Owner
  assign :sheldon
end

p Sailor.dog_names
p Nerd.dog_names
