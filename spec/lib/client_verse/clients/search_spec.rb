# frozen_string_literal: true

describe ClientVerse::Clients::Search do
  let(:clients) {
    JSON.parse(
      load_file_fixture('clients.json'),
      object_class: ClientVerse::Client,
      array_class: Set
    )
  }

  subject { described_class.new(clients) }

  describe "#call" do
    context "query string option is blank" do
      it "returns all the clients" do
        expect(subject.call.count).to eq(clients.count)
        expect(subject.call('q' => '').count).to eq(clients.count)
      end
    end

    context "query string option is specified" do
      it "returns the clients with full_name partially matching the query string" do
        result = subject.call('q' => 'Wil')
        expect(result.count).to eq(3)

        matched_names = result.map(&:full_name)
        expect(matched_names).to include('James Wilson')
        expect(matched_names).to include('Michael Williams')
        expect(matched_names).to include('William Davis')
      end
    end
  end
end