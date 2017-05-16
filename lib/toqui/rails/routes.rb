module Toqui
	module Rails
		class Routes
      module Helper
        def toqui_lift_routes
          Toqui::Rails::Routes.new(self).build
        end
      end

      # Make the routes helper available to Rails
      def self.install!
        ActionDispatch::Routing::Mapper.send :include, Toqui::Rails::Routes::Helper  
      end

      attr_reader :routes

      def initialize routes
        @routes = routes
      end

      def build
        # This array should be deduced from user_class helper methods????
        # like Devise's devise :recoverable, :validatable
        resources = [:registrations, :sessions, :recoveries]
        resources.each do |resource|
          build_for resource
        end
        
        # build_for :sessions
        # build_for :recoveries
      end

      private

      def build_for resource
        case resource
        when :registrations
          build_registrations_routes
        when :sessions
          build_sessions_routes
        when :recoveries
          build_recoveries_routes
        end
      end

      def build_registrations_routes
        routes.resource(
          :registrations,
          path: 'account',
          only: [ :edit, :update, :destroy],
          controller: 'toqui/registrations'
        )
        routes.get 'sign_up', controller: 'toqui/registrations', action: :new
        routes.post 'sign_up', controller: 'toqui/registrations', action: :create
      end

      def build_sessions_routes
        routes.get 'sign_in', controller: 'toqui/sessions', action: :new
        routes.post 'sign_in', controller: 'toqui/sessions', action: :create
        routes.delete 'sign_out', controller: 'toqui/sessions', action: :destroy
      end

      def build_recoveries_routes
        # Routes for GET revovery, POST recovery, GET reset, PUT reset 
      end
		end
	end
end