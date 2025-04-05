# frozen_string_literal: true

module ClientVerse
  autoload :Client, "client_verse/client"

  module Clients
    autoload :Search, "client_verse/clients/search"
  end
end