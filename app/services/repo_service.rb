class RepoService
  def self.all_repos(token)
    response = Faraday.get('https://api.github.com/user/repos', {}, {'Authorization': "token #{token}"})
    JSON.parse(response.body, symbolize_names: true)
  end
end