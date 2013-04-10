# coding: utf-8

Given(/^there is a problem$/) do
  @problem = Problem.make!
end

Given(/^there is an idea$/) do
  @idea = Idea.make!
end

Given(/^there is an idea for this problem$/) do
  @idea = Idea.make! :problem => @problem
end

Then(/^I should see that idea$/) do
  page.should have_css(".idea .title", :text => @idea.title)
end

Then(/^I should see that problem$/) do
  page.should have_css(".problem .title", :text => @problem.title)
end

When(/^I'm in "(.*?)"$/) do |arg1|
  visit path(arg1)
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_link link(arg1)
end

Then(/^I should be logged in$/) do
  page.should have_css(".login", text: "Nícolas Iensen")
end

Then(/^I should be in "(.*?)"$/) do |arg1|
  page.current_path.should be_== path(arg1)
end

When(/^I click on the idea$/) do
  click_link @idea.title
end

Given(/^I'm logged in$/) do
  visit "/auth/facebook"
end

When(/^click to vote for this idea$/) do
  click_link "vote"
end

Then(/^I should see the message of thanks for voting$/) do
  page.should have_css(".thanks_for_voting")
end

Then(/^I should have one vote for this idea$/) do
  User.find_by_email("nicolas@engage.is").votes.where(:idea_id => @idea.id).count.should be_== 1
end

Given(/^I already voted for this idea$/) do
  Vote.make! idea_id: @idea.id, user_id: User.find_by_email("nicolas@engage.is").id
end

Then(/^I should see you alredy voted for this idea$/) do
  page.should have_css("a.vote.already_voted")
end

Given(/^there is a problem with a expired voting deadline$/) do
  @problem = Problem.make! voting_deadline: Time.now
end

Then(/^the voting button should be disabled$/) do
  page.should have_css("a.vote[href='#']", text: "votações encerradas")
end

Given(/^there are some problems$/) do
  (rand*10).to_i.times { Problem.make! }
end

Then(/^I should see all the problems$/) do
  page.should have_css(".problem", count: Problem.count)
end
