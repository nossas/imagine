# coding: utf-8

Given(/^there is a problem$/) do
  @problem = Problem.make!
end

Then(/^I should see that problem$/) do
  page.should have_css(".problem .title", :text => @problem.title)
end

Given(/^there is an idea for this problem$/) do
  @idea = Idea.make! :problem => @problem
end

Then(/^I should see that idea$/) do
  page.should have_css(".idea .title", :text => @idea.title)
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
