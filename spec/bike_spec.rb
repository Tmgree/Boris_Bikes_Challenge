require 'bike'

describe Bike do

  describe '#broken'do

    it'should initialize as false' do
      expect(subject.broken).to eq(false)
    end

  end

  describe '#report_broken' do

    it 'can be reported broken' do
      subject.report_broken
      expect(subject).to be_broken
    end

  end

  describe '#broken?' do

    it 'should return false if bike is working' do
      expect(subject.broken?).to eq(false)
    end

    it 'should return true if bike is broken' do
      subject.report_broken
      expect(subject.broken?).to eq(true)
    end

  end

end
