require 'spec_helper'

module AreYouSure
  describe Confirmable do
    def confirm_for(model)
      model.extend(described_class).tap do |m|
        m.prepare_confirmation(confirmed, session)
        allow(m).to receive(:valid?) { valid }
        allow(m).to receive(:save) { save }
        allow(m).to receive(:update) { update }
      end
    end

    let(:session) { {} }

    describe 'Manage Session' do
      subject do
        session[:model_attributes]
      end

      context 'creation' do
        before do
          model = confirm_for Mount.new(name: 'name')
          model.save_if_confirmed
        end

        context 'when confirm' do
          let(:confirmed) { '' }

          context 'when invalid' do
            let(:valid) { false }
            it { expect(subject).to be_nil }
          end

          context 'when valid' do
            let(:valid) { true }
            it { expect(subject).not_to be_nil }
          end
        end

        context 'when commit' do
          let(:confirmed) { 'confirmed' }
          let(:valid) { true }

          context 'when saved' do
            let(:save) { true }
            it { expect(subject).to be_nil }
          end

          context 'when NOT saved' do
            let(:save) { false }
            it { expect(subject).to be_nil }
          end
        end
      end

      context 'updating' do
        before do
          Mount.create(name: 'name')
          model = confirm_for Mount.last
          model.update_if_confirmed(name: 'other name')
        end

        context 'when confirm' do
          let(:confirmed) { '' }

          context 'when invalid' do
            let(:valid) { false }
            it { expect(subject).to be_nil }
          end

          context 'when valid' do
            let(:valid) { true }
            it { expect(subject).not_to be_nil }
          end
        end

        context 'when commit' do
          let(:confirmed) { 'confirmed' }
          let(:valid) { true }

          context 'when updated' do
            let(:update) { true }
            it { expect(subject).to be_nil }
          end

          context 'when NOT updated' do
            let(:update) { false }
            it { expect(subject).to be_nil }
          end
        end
      end
    end
  end
end
