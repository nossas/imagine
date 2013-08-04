class ProblemSerializer
  attr_reader :subject

  def initialize(subject)
    @subject = subject
  end

  def as_json(opts = {})
    {
      id: subject.id,
      name: subject.title,
      ideas_count: ideas_count,
      votes_count: votes_count
    }
  end

  def votes_count
    subject.ideas.sum { |i| i.votes.size }
  end

  def ideas_count
    subject.ideas.size
  end
end
