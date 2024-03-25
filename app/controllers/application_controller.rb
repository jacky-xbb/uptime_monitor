class ApplicationController < ActionController::Base
  before_action :domains

  # private

  def domains
    @domains ||= Domain.all
  end
end
