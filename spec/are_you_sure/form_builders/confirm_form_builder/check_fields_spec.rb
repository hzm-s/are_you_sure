require 'spec_helper'
require 'ostruct'

class TestHelper < ActionView::Base; end

module AreYouSure
  describe ConfirmFormBuilder do
    let(:helper) { TestHelper.new }
    let(:model) { OpenStruct.new }
    let(:f) { described_class.new(:resource, model, helper, {}, nil) }

    describe "#check_box" do
      subject { f.check_box_or_confirm :enabled }

      context "when checked" do
        before { model.enabled = true }
        it { expect(subject).to include("<p>checked</p>") }
      end

      context "when NOT checked" do
        before { model.enabled = false }
        it { expect(subject).to include("<p></p>") }
      end
    end
  end
end
