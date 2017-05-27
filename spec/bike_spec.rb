require 'bike'

describe Bike do

  describe '#broken'do

    it'should initialize as false' do
      expect(subject.broken).to eq(false)
    end

    it 'should return false if bike is working' do
      expect(subject.broken).to eq(false)
    end

    it 'should return true if bike is broken' do
      subject.report_broken
      expect(subject.broken).to eq(true)
    end

  end

  describe '#report_broken' do

    it 'can be reported broken' do
      expect(subject.report_broken).to eq true
    end

  end

  describe '#fix' do

    it 'can be fixed' do
      expect(subject.fix).to eq false
    end

  end


end
