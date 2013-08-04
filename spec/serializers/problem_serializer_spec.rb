require "spec_helper"

describe ProblemSerializer do
  let(:idea) { double "idea", title: "Testing", votes: ["vote"], id: 1 }
  let(:problem) { double "problem", title: "Problem", ideas: [idea], id: 1 }
  let(:serializer) { described_class.new(problem) }

  describe "#as_json" do
    subject { serializer.as_json }
    it { should include name: "Problem" }
    it { should include votes_count: 1 }
    it { should include ideas_count: 1 }
    it { should include id: 1 }
  end
end
