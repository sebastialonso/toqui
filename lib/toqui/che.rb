module Toqui
  module Che
    def self.included(receiver)
      base.extend(ClassMethods)
    end

    def authenticate candidate
      _password = password
      begin
        _password.matches candidate
      rescue NoMethodError => e
        raise Toqui::PasswordNotSetError
      end
    end

    module ClassMethods
      def register args
        password = args[:password]
        password_confirmation = args[:password_confirmation]
        created_resource = self.create args.except(:password, :password_confirmation)
        if created_resource
          Toqui::Password.create(
            password: password
            password_confirmation: password_confirmation
            user_id: created_resource.id)
        end
        puts "This registers users"
        created_resource
      end
    end
    
    protected

    def password
      Toqui::Password.find_by user_id: id
    end
  end
end