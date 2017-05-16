require "toqui/engine"
require "toqui/exceptions"
require "toqui/che"

module Toqui
  mattr_accessor :user_class
  @user_class = "User"

  def user_class
    @@user_class.constantize    
  end

  # Default way to config Toqui on initializer
  def self.setup
    yield self
  end
end
