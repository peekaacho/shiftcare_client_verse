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
    context "query string is specified" do
      it "returns the clients with full_name partially matching the query string" do
        result = subject.call('q' => 'Wil')
        expect(result.count).to eq(3)

        matched_names = result.map(&:full_name)
        expect(matched_names).to include('James Wilson')
        expect(matched_names).to include('Michael Williams')
        expect(matched_names).to include('William Davis')
      end

      context "no client found with full_name partially matching the query string" do
        it "returns nothing" do
          result = subject.call('q' => 'Karen')
          expect(result).to be_empty
        end
      end
    end

    context "email is specified" do
      it "returns the clients with the given email" do
        email = 'jane.smith@yahoo.com'
        result = subject.call('email' => email)
        expect(result.count).to eq(2)
        result.each {|c| expect(c.email). to (eq(email)) }
      end

      context "no client found with the given email" do
        it "returns nothing" do
          result = subject.call('email' => 'none@gmail.com')
          expect(result).to be_empty
        end
      end
    end
  end
end
