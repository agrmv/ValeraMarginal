# frozen_string_literal: true

require_relative '../spec_helper'

describe Event do
  let(:valid_valera) { Valera.new(health: 30, mana: 50, money: 70) }
  let(:invalid_valera) { Valera.new(health: 30, mana: 50, money: 30) }
  subject do
    cond1 = Condition.new(field: 'health', operator: '<', value: 50)
    cond2 = Condition.new(field: 'mana', operator: '==', value: 50)
    cond3 = Condition.new(field: 'money', operator: '>', value: 50)

    effect = Effect.new(field: 'health', operator: '+', value: 30)

    Event.new(effect: effect, conditions: [cond1, cond2, cond3])
  end
  describe '#valid?' do
    context 'validation of VALERA' do
      it { expect(subject.valid?(valid_valera)).to be true }
      it { expect(subject.valid?(invalid_valera)).to be false }
    end
  end

  describe '#apply' do
    context 'applying of VALERA' do
      it { expect { subject.apply(valid_valera) }.to change(valid_valera, :health).to(60) }
      it { expect { subject.apply(invalid_valera) }.to_not change(valid_valera, :health).to(60) }
    end
  end
end
