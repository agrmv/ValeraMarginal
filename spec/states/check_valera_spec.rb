# frozen_string_literal: true

require 'rspec'
require_relative '../spec_helper'

describe GameStates::CheckValera do
  describe '#valera_is_dead?' do
    context 'checking of alive Valera' do
      let(:sub) { GameStates::CheckValera.new }
      it { expect(sub.valera_is_dead?).to be true }
    end
    context 'checking of dead Valera' do
      let(:val) { Valera.new(health: 0) }
      let(:sub) { GameStates::CheckValera.new(valera: val) }
      it { expect(sub.valera_is_dead?).to be true }
    end
  end
end