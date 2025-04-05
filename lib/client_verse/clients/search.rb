# frozen_string_literal: true

module ClientVerse::Clients
  class Search
    attr_reader :clients

    # @param clients [Set<ClientVerse::Client>, Array<ClientVerse::Client>]
    #   A list of client objects
    def initialize(clients)
      @clients = clients
    end

    # Search clients.
    # For now this only supports search by full_name.
    # So, if a query string is given, it returns all clients with name partially matching the string.
    # If no string is given, it returns all the clients.
    #
    # @param [Hash] query Search options
    # @option query [String] :q Query string to search the full_name with
    # @return [Set<ClientVerse::Client>, Array<ClientVerse::Client>]
    def call(query = { 'q' => nil })
      return clients if query['q'].nil? || query['q'].empty?

      q = query['q'].downcase
      clients.select { |c| c.full_name.downcase.include?(q) }
    end

  end
end