class DomainsController < ApplicationController
  before_action :set_domain, only: %i[show update]

  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.create(domain_params)
    if @domain.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @domain.update(monitoring: !@domain.monitoring)
    MonitorJob.perform_later(@domain)
  end

  def show; end

  private

  def domain_params
    params.require(:domain).permit(:name)
  end

  def set_domain
    @domain = Domain.find(params[:id])
  end
end
