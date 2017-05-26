require "toqui/engine"
require "toqui/exceptions"
require "toqui/che"

require "toqui/rails/routes"

module Toqui
  mattr_accessor :user_class
  @@user_class ||= "User"

  def self.user_class
    @@user_class.constantize    
  end

  # def self.user_class=(klass)
  #   @@user_class = klass
  # end

  # Default way to config Toqui on initializer
  def self.setup
    yield self
  end
end
