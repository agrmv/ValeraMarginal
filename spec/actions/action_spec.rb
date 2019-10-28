# frozen_string_literal: true

require_relative "../spec_helper"

describe Action do
  subject do
    cond1 = Condition.new(field: "health", operator: "<", value: 50)
    cond2 = Condition.new(field: "mana", operator: "==", value: 50)
    cond3 = Condition.new(field: "money", operator: ">", value: 50)

    effect1 = Effect.new(field: "health", operator: "+", value: 30)

    event1 = Event.new(effect: effect1)

    Action.new(name: "test", events: [event1], conditions: [cond1, cond2, cond3])
  end
  describe "#valid?" do
    let(:valera) { Valera.new(health: 30, mana: 50, money: 70) }
    let(:invalid_valera) { Valera.new(health: 30, mana: 50, money: 30) }

    context "invalid VALERA with inappropriate stats" do
      it { expect(subject.valid?(invalid_valera)).to be false }
    end

    context "valid VALERA with appropriate stats" do
      it { expect(subject.valid?(valera)).to be true }
      it "Valera's stats should be changed after action" do
        expect { subject.run(valera) }.to change(valera, :health).from(30).to(60)
      end
    end
  end
end