module DbnameGenerator
  class Railtie < ::Rails::Railtie
    config.before_configuration do
      Rails.class_eval do
        def self.dbname
          DbnameGenerator.generate
        end
      end
    end
  end
end
