require 'domain_ping'

class PingsController < ApplicationController
  def create
    @domain = Domain.find(params[:domain_id])

    DomainPing.call(@domain)
  end
end
