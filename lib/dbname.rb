require 'grit'
require "rails"
require "dbname/version"

module Dbname
  extend self

  def env
    lambda{|environment| [project_name, environment, branch_name].compact.join('_') }
  end

  def branch_name
    Grit::Repo.new(".").head.name rescue nil
  end

  def project_name
    Rails.application.class.parent.to_s.downcase
  end
end
