def path route
  return problem_path(@problem) if route == "this problem page"
  return problem_idea_path(@idea.problem, @idea) if route == "this idea page"
  raise "I don't know what '#{route}' means"
end

def link name
  return "auth-facebook" if name == "the Facebook login button"
end
