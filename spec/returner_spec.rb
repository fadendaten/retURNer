require 'spec_helper'

describe RetURNer do
  let(:params) do
    {
      type: :order,
      id: 5,
      other_id: 'NILE'
    }
  end

  let(:params_without_other_id) do
    {
      type: :customer,
      id: 5
    }
  end

  let(:subject) { RetURNer.for(params) }
  let(:subject_without_other_id) { RetURNer.for(params_without_other_id) }

  it 'has a version number' do
    expect(RetURNer::VERSION).not_to be nil
  end

  describe '#id' do
    specify{ expect(subject.id).to eq(params[:id]) }
  end

  describe '#type' do
    specify{ expect(subject.type).to eq(params[:type]) }
  end

  describe '#other_id' do
    context 'with other_id' do
      specify{ expect(subject.other_id).to eq(params[:other_id]) }
    end

    context 'without other_id' do
      specify{ expect(subject_without_other_id.other_id).to be_a_kind_of(NilClass) }
    end
  end

  describe '#splitted_params' do
    specify{ expect(subject.splitted_urn).not_to be nil }
  end

  describe 'for' do
    specify{ expect(RetURNer.for(params)).to be_a_kind_of(RetURNer) }
  end

  describe '.fetch' do
    context 'with_other_id' do
      it 'call Blizzard::Client::Transaction' do
        expect(Blizzard::Client::Transaction).to receive(:by_customer)
        subject.fetch
      end
    end

    context 'without_other_id' do
      it 'call Blizzard::Client::Customer' do
        expect(Blizzard::Client::Customer).to receive(:find)
        subject_without_other_id.fetch
      end
    end
  end
end
