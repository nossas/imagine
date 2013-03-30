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
