class SearchFacade
  def self.repos(token)
    all_repos = RepoService.all_repos(token)
    @repos = all_repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end
end