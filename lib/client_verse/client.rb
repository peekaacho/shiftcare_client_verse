# frozen_string_literal: true

module ClientVerse
  Client = Struct.new(
    :id,
    :full_name,
    :email,
    keyword_init: true) do

    def pretty_inspect
      "Client(id: %s, full_name: \"%s\", email: \"%s\")" %
        [self.id, self.full_name, self.email]
    end
  end
end
