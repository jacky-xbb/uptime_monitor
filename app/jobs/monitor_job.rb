require 'domain_ping'

class MonitorJob < ApplicationJob
  queue_as :default

  def perform(domain)
    # Do something later
    return if domain.monitoring == false

    DomainPing.call(domain)
    MonitorJob.set(wait_until: 2.seconds.from_now).perform_later(domain)
  end
end
