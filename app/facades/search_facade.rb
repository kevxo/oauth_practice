class SearchFacade
  def self.repos(token)
    all_repos = RepoService.all_repos(token)
    @repos = all_repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def self.access(code)
    AccessService.response(code)
  end

  def self.user_data(access_token)
    AccessService.access_user_data(access_token)
  end
end