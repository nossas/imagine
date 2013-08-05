require 'spec_helper'

describe ProblemsController do
  describe "GET show" do
    let(:problem) { double "problem" }
    let(:serializer) { double "serializer" }

    before do
      Problem.should_receive(:find).with("1").and_return(problem)
      ProblemSerializer.should_receive(:new).with(problem).and_return(serializer)
      serializer.should_receive(:as_json).and_return([])
    end

    context "as json" do
      before do
        get :show, id: 1, format: :json
      end

      describe "response" do
        its("response.body") { should == "[]" }
      end
    end
  end
end
