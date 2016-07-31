require 'spec_helper'

describe RetURNer do
  let(:params) do
    {
      type: :customer,
      id: 5,
      other_id: 'NILE'
    }
  end

  let(:subject) { RetURNer.for(params) }

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
    specify{ expect(subject.other_id).to eq(params[:other_id]) }
  end

  describe '#splitted_params' do
    specify{ expect(subject.splitted_urn).not_to be nil }
  end

  describe 'for' do
    specify{ expect(RetURNer.for(params)).to be_a_kind_of(RetURNer) }
  end

  describe '.fetch' do
    let(:service_double) { class_double(Blizzard::Client::Transaction) }

    before do
      allow(subject).to receive(:fetch).and_return(:result)
    end

    specify{ expect(subject.fetch).to eq(:result) }
  end
end
