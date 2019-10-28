require_relative "../spec_helper"

describe SimpleEffect do
  subject do
  end
  describe "#ok?" do
    let(:valid_valera) { Valera.new(mana: 100, fun: 100, money: 10) }
    let(:invalid_valera) { Valera.new }
    context "validation of VALERA" do
      # it { expect(subject.valid?(valid_valera)).to be true }
      # it { expect(subject.valid?(invalid_valera)).to be false }
    end
  end
end
