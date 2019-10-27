require_relative '../spec_helper'

describe Action do
  subject do
    cond = Condition.new(field: 'health', operator: '>', value: 50)
    cond2 = Condition.new(field: 'mana', operator: '>', value: 29)

    effect = SimpleEffect.new('health', '+', 20)
    effect2 = SimpleEffect.new('mana', '+', 10)

    Action.new(name: 'test', effects: [effect, effect2], conditions: [cond, cond2])
  end
  describe '#valid?' do
    let(:valid_valera) { Valera.new(mana: 100, fun: 100, money: 10) }
    let(:invalid_valera) {  Valera.new() }
    context 'validation of VALERA' do
      it { expect(subject.valid?(valid_valera)).to be true }
      it { expect(subject.valid?(invalid_valera)).to be false }
    end
  end
end