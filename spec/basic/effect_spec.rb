# frozen_string_literal: true

require_relative '../spec_helper'

describe Effect do
  describe '#initialize' do
    context 'check validation of operators' do
      it { expect { Effect.new(field: 'mana', operator: 0, value: 0) }.to raise_error(ValeraError) }
    end
  end

  describe '#apply' do
    let(:valera) { Valera.new(mana: 10, fun: 10, money: 10, fatigue: 10) }
    let(:effect) { Effect.new(field: 'mana', operator: '-', value: 1) }
    context 'check validation of field' do
      let(:invalid_effect) { Effect.new(field: 'power', operator: '-', value: 1) }
      it { expect { invalid_effect.apply valera }.to raise_error(ValeraError) }
      it { expect { effect.apply valera }.to_not raise_error(ValeraError) }
    end

    context 'apply effect' do
      it { expect { effect.apply valera }.to change(valid_valera, :mana).to(11) }
    end
  end
end
