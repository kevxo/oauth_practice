class AccessToken
  attr_reader :token
  def initialize(data)
    @token = data[:access_token]
  end
end