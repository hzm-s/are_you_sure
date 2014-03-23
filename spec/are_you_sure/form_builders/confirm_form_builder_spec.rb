require 'spec_helper'

class TestHelper < ActionView::Base; end

module AreYouSure
  describe ConfirmFormBuilder do
    let(:helper) { TestHelper.new }
    let(:resource) { Lens.new }
    let(:f) { described_class.new(:lens, resource, helper, {}, nil) }

    describe "#confirmation" do
      subject { f.confirmation(options) }

      context "given no options" do
        let(:options) { {} }
        it { expect(subject).to eq(
          "<input id=\"confirmed\" name=\"confirmed\" type=\"hidden\" value=\"confirmed\" /><p>Are you sure?</p>"
        ) }
      end

      context "given message" do
        let(:options) { { message: 'OK?' } }
        it { expect(subject).to eq(
          "<input id=\"confirmed\" name=\"confirmed\" type=\"hidden\" value=\"confirmed\" /><p>OK?</p>"
        ) }
      end
    end

    describe "#submit_or_confirm" do
      subject { f.submit_or_confirm(options) }
      
      let(:options) { { create: 'create', update: 'update', confirm: 'confirm' } }

      context "when resource is not persisted" do
        context "given no options" do
          let(:options) { {} }
          it { expect(subject).to eq("<input name=\"commit\" type=\"submit\" value=\"Create a Lens\" />") }
        end

        context "given :create option" do
          it { expect(subject).to eq("<input name=\"commit\" type=\"submit\" value=\"create\" />") }
        end
      end

      context "when resource is persisted" do
        before { resource.stub(:persisted?) { true } }

        context "given no options" do
          let(:options) { {} }
          it { expect(subject).to eq("<input name=\"commit\" type=\"submit\" value=\"Update a Lens\" />") }
        end

        context "given :create option" do
          it { expect(subject).to eq("<input name=\"commit\" type=\"submit\" value=\"update\" />") }
        end
      end
    end

    describe "#cancel" do
      subject { f.cancel(value, options) }

      before { helper.stub(:polymorphic_path) { "cancel_path" } }

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
