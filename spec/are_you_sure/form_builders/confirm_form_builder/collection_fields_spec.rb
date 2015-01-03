require 'spec_helper'

class Choice
  attr_accessor :value, :text

  def initialize(value, text)
    @value, @text = value, text
  end
end

module AreYouSure
  describe ConfirmFormBuilder do
    let(:model) { open_model }
    let(:f) { described_class.new(:resource, model, template, {}) }

    let(:choices) do
      [
        ['value', 'VALUE CHOICE'],
        [true, 'TRUE CHOICE'],
        [false, 'FALSE CHOICE'],
      ].collect {|e| Choice.new(*e) }
    end

    describe "#collection_select" do
      subject { f.collection_select_or_confirm :choice, choices, :value, :text }

      context "when value selected" do
        before { model.choice = choices[0].value }
        it { expect(subject).to include("<p>#{choices[0].text}</p>") }
      end

      context "when true selected" do
        before { model.choice = choices[1].value }
        it { expect(subject).to include("<p>#{choices[1].text}</p>") }
      end

      context "when false selected" do
        before { model.choice = choices[2].value }
        it { expect(subject).to include("<p>#{choices[2].text}</p>") }
      end

      context "when NOT selected" do
        it { expect(subject).to include("<p></p>") }
      end
    end

    describe "#collection_check_boxes" do
      subject { f.collection_check_boxes_or_confirm :choice, choices, :value, :text }

      context "when single checked" do
        before { model.choice = choices[0].value }
        it { expect(subject).to include("<p>#{choices[0].text}</p>") }
      end

      context "when true selected" do
        before { model.choice = choices[1].value }
        it { expect(subject).to include("<p>#{choices[1].text}</p>") }
      end

      context "when false selected" do
        before { model.choice = choices[2].value }
        it { expect(subject).to include("<p>#{choices[2].text}</p>") }
      end

      context "when NOT checked" do
        it { expect(subject).to include("<p></p>") }
      end
    end
  end
end
