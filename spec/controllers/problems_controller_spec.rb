require 'spec_helper'

describe ProblemsController do
  describe "GET show" do
    let(:idea) { double "idea", title: "Testing", votes: ["vote"], id: 1 }
    let(:problem) { double "problem", title: "Problem", ideas: [idea], id: 1 }

    before do
      Problem.should_receive(:find).with("1").and_return(problem)
    end

    context "as json" do
      before do
        get :show, id: 1, format: :json
      end

      describe "response" do
        subject { JSON.parse(response.body) }
        it { should include "name" => "Problem" }
        it { should include "id" => 1 }
        it { should include "votes_count" => 1 }
        it { should include "ideas_count" => 1 }
      end
    end
  end
end
