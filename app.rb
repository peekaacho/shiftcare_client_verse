require 'pathname'
ROOT_PATH = Pathname.new(__dir__)
$LOAD_PATH.unshift ROOT_PATH.join('lib').to_s

require 'singleton'

class App
  include Singleton

  def self.boot!
    instance.boot!
  end

  def initialize
    @booted = false
  end

  def boot!
    return if @booted

    perform_requires
    @booted = true
  end

  def perform_requires
    require 'json'
    require 'set'

    require 'client_verse'
  end
end