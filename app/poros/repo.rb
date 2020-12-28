class Repo
  attr_reader :name, :private
  def initialize(repo_data)
    @name = repo_data[:name]
    @private = repo_data[:private]
  end
end
