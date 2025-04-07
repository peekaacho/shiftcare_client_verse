# frozen_string_literal: true

module ClientVerse::Clients
  class DuplicatesFinder
    attr_reader :clients

    # @param clients [Set<ClientVerse::Client>, Array<ClientVerse::Client>]
    #   A list of client objects
    def initialize(clients)
      @clients = clients
      @search = ClientVerse::Clients::Search.new(clients)
    end

    # Find duplicate clients based on a given attribute.
    # If 2 or more clients match the attribute, return those clients. Else, return nothing.
    # For now this only supports finding duplicates based on email attribute.
    # Note, this function does not check whether the given email is valid or not.
    # This function does not distinguish between uppercase and lowercase letters in the email as generally,
    #   email addresses are not case sensitive.
    #
    # @param [Hash] query Find duplicates options
    # @option query [String] :email Email value to find duplicate clients with
    # @return [Hash] [Set<ClientVerse::Client>, Array<ClientVerse::Client>]
    def call(query)
      @search.call('email' => query['email']) do |_result|
        result = _result.count > 1 ? _result : []
        block_given? ? yield(result) : result
      end
    end

  end
end