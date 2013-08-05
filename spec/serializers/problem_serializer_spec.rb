require "spec_helper"

describe ProblemSerializer do
  let(:idea) { Idea.make! }
  let(:problem) { idea.problem }
  let(:serializer) { described_class.new(problem) }
  let!(:vote) { Vote.make! idea: idea }

  describe "#as_json" do
    subject { serializer.as_json }
    it { should include title: problem.title }
    it { should include votes_count: 1 }
    it { should include ideas_count: 1 }
    it { should include id: problem.id }
  end
end
