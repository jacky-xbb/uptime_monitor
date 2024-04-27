require 'net/http'

class DomainPing
  def self.call(domain)
    uri = URI.parse("http://#{domain.name}") # Consider checking if HTTPS is needed
    alive = false
    response_time = nil

    begin
      start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      response = Net::HTTP.get_response(uri)
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      response_time = ((end_time - start_time) * 1000).round

      alive = response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, Errno::EHOSTUNREACH,
           Errno::ECONNREFUSED, EOFError, Net::HTTPBadResponse,
           Net::HTTPHeaderSyntaxError, Net::ProtocolError, SocketError => e

      Rails.logger.error "Ping failed: #{e.message}"
    ensure
      # Create ping record in the database
      domain.pings.create(response_time:, alive:)
    end
  end
end
