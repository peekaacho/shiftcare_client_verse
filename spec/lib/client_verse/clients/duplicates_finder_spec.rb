# frozen_string_literal: true

describe ClientVerse::Clients::DuplicatesFinder do
  let(:clients) {
    JSON.parse(
      load_file_fixture('clients.json'),
      object_class: ClientVerse::Client,
      array_class: Set
    )
  }

  subject { described_class.new(clients) }

  describe "#call" do
    it "returns duplicate clients given an email address" do
      result = subject.call('email' => 'jane.smith@yahoo.com')
      expect(result.count).to eq(2)
    end

    context "only 1 client found with the given email address" do
      it "returns nothing" do
        result = subject.call('email' => 'john.doe@gmail.com')
        expect(result).to be_empty
      end
    end

    context "no client found with the given email address" do
      it "returns nothing" do
        result = subject.call('email' => 'none@gmail.com')
        expect(result).to be_empty
      end
    end
  end

end