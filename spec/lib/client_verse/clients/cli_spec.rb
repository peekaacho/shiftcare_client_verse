# frozen_string_literal: true

describe ClientVerse::Clients::CLI do
  subject { described_class.new }

  describe "#search" do
    it "requires query string -q option" do
      expect {
        subject.invoke(:search, [], { })
      }.to raise_error(
        Thor::RequiredArgumentMissingError,
        "No value provided for required options '-q'"
      )
    end

    let(:options) { { q: 'Wil' } }

    it "searches for clients with the given query string" do
      expect_any_instance_of(ClientVerse::Clients::Search).to receive(:call).
        with(hash_including(options))
      subject.invoke(:search, [], options)
    end

    it "prints the matched clients" do
      expect {
        subject.invoke(:search, [], options)
      }.to output(include(/James Wilson/, /Michael Williams/, /William Davis/)).to_stdout
    end
  end

  describe "#find_duplicates" do
    it "requires email option" do
      expect {
        subject.invoke(:find_duplicates, [], { })
      }.to raise_error(
        Thor::RequiredArgumentMissingError,
        "No value provided for required options '--email'"
      )
    end

    let(:options) { { email: 'jane.smith@yahoo.com' } }

    it "searches for duplicate clients with the given email" do
      expect_any_instance_of(ClientVerse::Clients::DuplicatesFinder).to receive(:call).
        with(hash_including(options))
      subject.invoke(:find_duplicates, [], options)
    end

    it "prints the duplicate clients" do
      expect {
        subject.invoke(:find_duplicates, [], options)
      }.to output(include(/Jane Smith/, /Another Jane Smith/)).to_stdout
    end
  end
end