require 'grit'
require "rails"
require "dbname_generator/version"
require "dbname_generator/railtie"

module DbnameGenerator
  extend self

  def generate
    lambda{|environment| [project, environment, repository].compact.join('_') }
  end

  def repository
    Grit::Repo.new(".").head.name rescue nil
  end

  def project
    Rails.application.class.parent.to_s.downcase
  end
end
