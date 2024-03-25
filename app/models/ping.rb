class Ping < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :domain

  after_create_commit do
    broadcast_append_to(dom_id(domain), partial: 'pings/ping', locals:
      { ping: self, domain: }, target: 'pings')
  end
end
