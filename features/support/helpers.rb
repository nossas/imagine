def path route
  return problem_path(@problem) if route == "this problem page"
end

def link name
  return "auth-facebook" if name == "the Facebook login button"
end
