require 'spec_helper'

class TestHelper < ActionView::Base; end

module AreYouSure
  describe InputFormBuilder do
    let(:helper) { TestHelper.new }
    let(:resource) { Lens.new }
    let(:f) { described_class.new(:lens, resource, helper, {}) }

    describe "#confirmation" do
      subject { f.confirmation }
      it { expect(subject).to match(/name="confirmed"/) }
      it { expect(subject).to match(/type="hidden"/) }
    end

    describe "#submit_or_confirm" do
      subject { f.submit_or_confirm(options) }

      context "given no options" do
        let(:options) { {} }
        it { expect(subject).to match(/type="submit"/) }
        it { expect(subject).to match(/value="Confirm"/) }
      end

      context "given options" do
        let(:options) { { confirm: 'confirm' } }
        it { expect(subject).to match(/type="submit"/) }
        it { expect(subject).to match(/value="confirm"/) }
      end
    end

    describe "#cancel" do
      subject { f.cancel }
      it { expect(subject).to eq("") }
    end

    describe "#text_field" do
      subject { f.text_field :name }
      it { expect(subject).to match(/id="lens_name"/) }
      it { expect(subject).to match(/name="lens\[name\]"/) }
      it { expect(subject).to match(/type="text"/) }
    end
  end
end
