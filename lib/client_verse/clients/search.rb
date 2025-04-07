# frozen_string_literal: true

module ClientVerse::Clients
  class Search
    attr_reader :clients

    InvalidQuery = Class.new(StandardError)

    QUERY_MAP = { 'q' => 'full_name', 'email' => 'email' }

    # @param clients [Set<ClientVerse::Client>, Array<ClientVerse::Client>]
    #   A list of client objects
    def initialize(clients)
      @clients = clients
    end

    # Search clients.
    # Supports search by full_name or email (or both)
    # If a query string is given, it filters in clients with name partially matching the string.
    # If email is given, it filters in clients with exact email match.
    #
    # @param [Hash] query Search options
    # @option query [String] :q Query string to partially match client.full_name with
    # @option query [String] :email Email address to match client.email with
    # @return [Set<ClientVerse::Client>, Array<ClientVerse::Client>]
    def call(query)
      result = (
        query.keys.inject(clients) do |_result, k|
          send("search_by_%s" % QUERY_MAP[k], _result, query[k])
        end
      )

      block_given? ? yield(result) : result
    end

    private

      def search_by_full_name(_clients, q)
        q = q&.strip&.downcase
        result = _clients.select { |c| c.full_name.downcase.include?(q) }
        block_given? ? yield(result) : result
      end

      def search_by_email(_clients, email)
        email = email&.strip&.downcase
        result = _clients.select { |c| c.email.downcase == email }
        block_given? ? yield(result) : result
      end

  end
end