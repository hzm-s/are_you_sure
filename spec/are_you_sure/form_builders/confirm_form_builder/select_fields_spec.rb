require 'spec_helper'

module AreYouSure
  describe ConfirmFormBuilder do
    let(:model) { open_model }
    let(:f) { described_class.new(:resource, model, template, {}) }

    let(:choices) do
      [
        ['VALUE CHOICE', 'value'],
        ['TRUE CHOICE', true],
        ['FALSE CHOICE', false],
      ]
    end

    describe "#select" do
      subject { f.select_or_confirm :choice, choices }

      context "when value selected" do
        before { model.choice = choices[0][1] }
        it { expect(subject).to include("<p>#{choices[0][0]}</p>") }
      end

      context "when true selected" do
        before { model.choice = choices[1][1] }
        it { expect(subject).to include("<p>#{choices[1][0]}</p>") }
      end

      context "when false selected" do
        before { model.choice = choices[2][1] }
        it { expect(subject).to include("<p>#{choices[2][0]}</p>") }
      end
    end
  end
end
