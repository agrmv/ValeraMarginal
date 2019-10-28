require_relative '../spec_helper'

describe Config do
  let(:file) { 'spec/config/test_config.yml' }
  subject do
    Config.new(file)
  end
  describe '#save' do
    context 'check saving of Config' do
      before { File.write('spec/config/test_config.yml', '') }
      let(:valera) { Valera.new(mana: 10, fun: 10, money: 10, fatigue: 10) }
      it 'save state in file' do
        subject.save(valera)
        expect(File.size?('spec/config/test_config.yml')).not_to be nil
      end
    end
  end
end