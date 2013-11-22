require 'spec_helper'

describe User do
  describe "#voted_on?" do
    let(:idea)  { Idea.make! }
    subject     { User.make! }

    context "when the user didn't voded on the idea" do
      it "should return false" do
        subject.voted_on?(idea).should be_false
      end
    end

    context "when the user already voded on the idea" do
      before { Vote.make! idea: idea, user: subject }
      it "should return true" do
        subject.voted_on?(idea).should be_true
      end
    end
  end
end
