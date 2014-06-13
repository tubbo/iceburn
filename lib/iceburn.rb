require 'iceburn/version'
require 'iceburn/filters'
require 'iceburn/routes'

# A library for defining "blank" routes that are returned whenever HTML
# is requested from the Rails router.

module Iceburn
  # Logging util that defaults to the Rails logger.
  def self.logger
    Rails.logger
  end
end
