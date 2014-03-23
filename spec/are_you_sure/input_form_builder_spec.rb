require 'spec_helper'

class TestHelper < ActionView::Base; end

module AreYouSure
  describe InputFormBuilder do
    let(:helper) { TestHelper.new }
    let(:resource) { Lens.new }
    let(:f) { described_class.new(:lens, resource, helper, {}, nil) }

    describe "#confirmation" do
      subject { f.confirmation }
      it { expect(subject).to eq("<input id=\"confirmed\" name=\"confirmed\" type=\"hidden\" value=\"\" />") }
    end

    describe "#submit_or_confirm" do
      subject { f.submit_or_confirm(options) }

      context "given no options" do
        let(:options) { {} }
        it { expect(subject).to eq("<input name=\"commit\" type=\"submit\" value=\"Confirm\" />") }
      end

      context "given options" do
        let(:options) { { confirm: 'confirm' } }
        it { expect(subject).to eq("<input name=\"commit\" type=\"submit\" value=\"confirm\" />") }
      end
    end

    describe "#cancel" do
      subject { f.cancel }
      it { expect(subject).to eq("") }
    end

    describe "#text_field" do
      subject { f.text_field :name }
      it { expect(subject).to eq("<input id=\"lens_name\" name=\"lens[name]\" type=\"text\" />") }
    end
  end
end
