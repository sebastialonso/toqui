module Toqui
	module Rails
		class Routes
      module Helper
        def toqui_lift(opts={})
          Toqui::Rails::Routes.new(self, opts).build
        end
      end

      # Make the routes helper available to Rails to be calledfrom routes.rn
      def self.import
        ActionDispatch::Routing::Mapper.send :include, Toqui::Rails::Routes::Helper  
      end

      attr_reader :routes
      attr_reader :options

      def initialize routes, opts 
        @routes = routes
        @options = opts
      end

      def build
        # This array should be deduced from user_class helper methods????
        # like Devise's devise :recoverable, :validatable
        resources = [:registrations, :sessions, :recoveries]
        if options.key? :as
          if options[:as] == :api
            resources.each do |resource|
              build_for resource, as: :api
            end
          else
            raise Toqui::OptionNotRecognizedError
          end
        else
          resources.each do |resource|
            build_for resource, as: :app
          end
          
          # build_for :sessions
          # build_for :recoveries
        end
      end

      private

      def build_for resource, opts
        case resource
        when :registrations
          build_registrations_routes opts
        when :sessions
          build_sessions_routes opts
        when :recoveries
          build_recoveries_routes opts
        end
      end

      def build_registrations_routes opts

        # Check opts[:as]
        # If :api, only build API routes
        routes.resource(
          :registrations,
          path: 'account',
          only: [ :edit, :update, :destroy],
          controller: 'toqui/registrations'
        )
        routes.get 'sign_up', controller: 'toqui/registrations', action: :new
        routes.post 'sign_up', controller: 'toqui/registrations', action: :create
      end

      def build_sessions_routes opts
        routes.get 'sign_in', controller: 'toqui/sessions', action: :new
        routes.post 'sign_in', controller: 'toqui/sessions', action: :create
        routes.delete 'sign_out', controller: 'toqui/sessions', action: :destroy
      end

      def build_recoveries_routes opts
        # Routes for GET revovery, POST recovery, GET reset, PUT reset 
      end
		end
	end
end