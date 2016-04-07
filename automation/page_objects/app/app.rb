require 'active_support/core_ext/string/inflections'
class App
  @current_page = nil

  class << self

    def set_current_page(page)
      @current_page = PageRegistry.get page
    end

    def current_page
      @current_page
    end

    def self.configure_shorthands dir
      Dir[dir].each do |f|
        file_name = File.basename(f, '.rb')
        define_method("#{file_name}_page") {
        PageRegistry.get(file_name.camelize.constantize)
        }
      end
    end

    configure_shorthands "#{$PROJECT_ROOT}/page_objects/pages/*.rb"
  end
end
