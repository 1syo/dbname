require 'grit'
require "rails"
require "dbname_generator/version"
require "dbname_generator/railtie"

module DbnameGenerator
  extend self

  def generate
    lambda{|environment| [project_name, environment, branch_name].compact.join('_') }
  end

  def branch_name
    Grit::Repo.new(".").head.name rescue nil
  end

  def project_name
    Rails.application.class.parent.to_s.downcase
  end
end
