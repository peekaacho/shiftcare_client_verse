# frozen_string_literal: true

require 'thor'

module ClientVerse::Clients
  class CLI < Thor
    include Thor::Actions

    namespace :clients

    option :q, type: :string, required: true, desc: "Query string to match client full_name"
    desc "search", "Search clients by name"
    def search
      puts "Searching clients with name matching '#{options[:q]}'"
      puts '...'

      ClientVerse::Clients::Search.new(clients).call(options) do |result|
        puts "Client count: #{result.count}"
        puts result.map(&:pretty_inspect)
      end
    end

    option :email, type: :string, required: true, desc: "Email to find duplicates with"
    desc "find_duplicates", "Find duplicate clients"
    def find_duplicates
      puts "Finding duplicate clients with email: #{options[:email]}"
      puts '...'

      ClientVerse::Clients::DuplicatesFinder.new(clients).call(options) do |result|
        puts "Duplicates count: #{result.count}"
        puts result.map(&:pretty_inspect)
      end
    end

    private

      def clients(clients_file_path = 'var/data/clients.json')
        JSON.parse(
          File.read(clients_file_path),
          object_class: ClientVerse::Client,
          array_class: Set
        )
      end

  end
end