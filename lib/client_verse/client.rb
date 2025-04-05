# # frozen_string_literal: true

module ClientVerse
  Client = Struct.new(:id, :full_name, :email, keyword_init: true) do
    def initialize(id:, full_name:, email:)
      super
    end
  end
end