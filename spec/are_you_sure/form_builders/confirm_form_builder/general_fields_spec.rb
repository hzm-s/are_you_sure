require 'spec_helper'
require 'ostruct'

class TestHelper < ActionView::Base; end

module AreYouSure
  describe ConfirmFormBuilder do
    let(:helper) { TestHelper.new }
    let(:model) { OpenStruct.new }
    let(:f) { described_class.new(:resource, model, helper, {}, nil) }

    describe "#text_field" do
      subject { f.text_field_or_confirm :name }
      before { model.name = 'value' }
      it { expect(subject).to include("<p>value</p>") }
    end

    describe "#password_field" do
      subject { f.password_field_or_confirm :password }
      before { model.name = 'the secret' }
      it { expect(subject).to include("<p>********</p>") }
    end
  end
end
