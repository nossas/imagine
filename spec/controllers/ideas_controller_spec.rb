require 'spec_helper'

describe IdeasController do
  describe "GET index" do
    before { Problem.stub(:find) }
    context "when it's a json format request" do
      context "when the token is not provided" do
        subject { get :index, format: :json, problem_id: 1 }
        its(:status) { should be_== 302 }
      end

      context "when the token is provided" do
        subject { get :index, format: :json, token: ENV['API_TOKEN'], problem_id: 1 }
        its(:status) { should be_== 200 }
      end
    end
  end
end
