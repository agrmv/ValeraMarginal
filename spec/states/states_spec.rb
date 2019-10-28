require_relative "../spec_helper"

describe States do
  let(:file) { "test_states.yml" }
  subject do
    States.new(file)
  end
  describe "#save" do
    context "check saving of Valera state" do
      before { File.write("tes_states.yml", "") }
      let(:valera) { Valera.new(mana: 10, fun: 10, money: 10, fatigue: 10) }
      it "save state in file" do
        subject.save(valera)
        expect(File.size?("test_states.yml")).not_to be nil
      end
    end
  end
end
