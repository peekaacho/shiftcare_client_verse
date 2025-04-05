# frozen_string_literal: true

module ClientVerse::Clients
  class CLI < Thor
    include Thor::Actions

    namespace :clients

    option :q, type: :string, desc: "Query string to match client full_name"
    desc "search", "Search clients by name"
    def search
      options[:q] ?
        (puts "Searching clients with name matching '#{options[:q]}'") :
        (puts "Searching clients")

      puts '...'

      opts = { 'q' => options[:q] }
      result = ClientVerse::Clients::Search.new(clients).call(opts)

      puts "Client count: #{result.count}\n"
      result.map(&:print_pretty_oneline)
    end

    private

      def clients
        @clients ||= JSON.parse(
          File.read('clients.json'),
          object_class: ClientVerse::Client,
          array_class: Set
        )
      end

  end
end