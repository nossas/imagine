require 'spec_helper'

describe ProblemsController do
  describe "GET index" do
    context "when it's a json format request" do
      context "when the token is not provided" do
        subject { get :index, format: :json }
        its(:status) { should be_== 302 }
      end

      context "when the token is provided" do
        subject { get :index, format: :json, token: ENV['API_TOKEN'] }
        its(:status) { should be_== 200 }
      end
    end
  end
end
