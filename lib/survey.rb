module ::Kernel
  def rails_less_than_4?
    return defined?(Rails) && Rails::VERSION::MAJOR < 4
  end
  
  def in_rails_3(&block)
    yield if block_given? if rails_less_than_4?
  end
end

require 'survey/engine'
require 'survey/version'
require 'survey/active_record'

# Leave ActiveRecord::Base unloaded until the app's initializers have run,
# so their Active Record settings reach it.
ActiveSupport.on_load(:active_record) { include Survey::ActiveRecord }
