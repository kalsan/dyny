module Dyny
  class Railtie < Rails::Railtie
    initializer 'dyny.define_helpers' do
      ActiveSupport.on_load :action_view do
        include Dyny::Helper
      end
    end
  end
end
