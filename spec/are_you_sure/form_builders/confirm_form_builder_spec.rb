require 'spec_helper'

module AreYouSure
  describe ConfirmFormBuilder do
    let(:resource) { Lens.new }
    let(:f) { described_class.new(:lens, resource, template, {}) }

    describe "#confirmation" do
      subject { f.confirmation(options) }

      context "given no options" do
        let(:options) { {} }
        it { expect(subject).to match(/type="hidden"/) }
        it { expect(subject).to match(/name="confirmed"/) }
        it { expect(subject).to match(/value="confirmed"/) }
        it { expect(subject).to match(Regexp.escape('<p>Are you sure?</p>')) }
      end

      context "given message" do
        let(:options) { { message: 'OK?' } }
        it { expect(subject).to match(/type="hidden"/) }
        it { expect(subject).to match(/name="confirmed"/) }
        it { expect(subject).to match(/value="confirmed"/) }
        it { expect(subject).to match(Regexp.escape('<p>OK?</p>')) }
      end
    end

    describe "#submit_or_confirm" do
      subject { f.submit_or_confirm(options) }
      
      let(:options) { { create: 'create', update: 'update', confirm: 'confirm' } }

      context "when resource is not persisted" do
        context "given no options" do
          let(:options) { {} }
          it { expect(subject).to match(/type="submit"/) }
          it { expect(subject).to match(/value="Create a Lens"/) }
        end

        context "given :create option" do
          it { expect(subject).to match(/type="submit"/) }
          it { expect(subject).to match(/value="create"/) }
        end
      end

      context "when resource is persisted" do
        before { allow(resource).to receive(:persisted?) { true } }

        context "given no options" do
          let(:options) { {} }
          it { expect(subject).to match(/type="submit"/) }
          it { expect(subject).to match(/value="Update a Lens"/) }
        end

        context "given :create option" do
          it { expect(subject).to match(/type="submit"/) }
          it { expect(subject).to match(/value="update"/) }
        end
      end
    end

    describe "#cancel" do
      subject { f.cancel(value, options) }

      before { allow(template).to receive(:polymorphic_path) { "cancel_path" } }

      context "given no value no options" do
        let(:value) { nil }
        let(:options) { {} }
        it { expect(subject).to eq("<a href=\"cancel_path\">Cancel</a>") }
      end

      context "given value" do
        let(:value) { "cancel_commit" }
        let(:options) { {} }
        it { expect(subject).to eq("<a href=\"cancel_path\">cancel_commit</a>") }
      end

      context "given to option" do
        let(:value) { nil }
        let(:options) { { to: 'other_path' } }
        it { expect(subject).to eq("<a href=\"other_path\">Cancel</a>") }
      end
    end
  end
end
