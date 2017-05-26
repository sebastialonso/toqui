module Toqui
  class Engine < ::Rails::Engine
    # isolate_namespace Toqui

    initializer "toqui.routes" do
      Toqui::Rails::Routes.import
    end
  end
end
