def path route
  return problem_path(@problem.reload)                    if route == "this problem page"
  return problem_idea_path(@idea.problem, @idea.reload)   if route == "this idea page"
  return root_path                                        if route == "the homepage"
  return about_path                                       if route == "the about page"
  return problem_idea_path(last_idea.problem, last_idea)  if route == "the new idea page"
  return new_problem_idea_path(@problem)                  if route == "the new idea page for this problem"
  return user_pending_contributions_path(current_user)    if route == "the pending contributions page"
  return problem_path(@idea.problem)                      if route == "the idea's problem page"
  return problem_path(last_problem)                       if route == "the new problem page"
  return problems_path                                    if route == "the problems page"
  return problem_path(@update.problem)                    if route == "the problem page of this update"
  raise "I don't know what '#{route}' means"
end

def link name
  return "auth-facebook" if name == "the Facebook login button"
end

def last_idea
  Idea.order("id DESC").first
end

def last_problem
  Problem.order("id DESC").first
end

def current_user
  @current_user ||= User.find_by_email("nicolas@engage.is")
end
