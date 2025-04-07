# frozen_string_literal: true

module ClientVerse
  autoload :Client, "client_verse/client"

  module Clients
    autoload :CLI, "client_verse/clients/cli"
    autoload :DuplicatesFinder, "client_verse/clients/duplicates_finder"
    autoload :Search, "client_verse/clients/search"
  end
end