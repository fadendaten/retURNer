require 'spec_helper'

describe RetURNer do
  let(:params) do
    {
      type: :customer,
      id: 5
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

  describe '#splitted_params' do
    specify{ expect(subject.splitted_urn).not_to be nil }
  end

  describe '.for' do
    specify{ expect(RetURNer.for(params)).to be_a_kind_of(RetURNer) }
  end

  describe '#to_s' do
    specify{ expect(subject.to_s).to eq 'urn:fadendaten:customer:5' }
  end

  describe '.fetch' do
    it 'call Blizzard::Client::Customer' do
      expect(Blizzard::Client::Customer).to receive(:find)
      subject.fetch
    end
  end
end
