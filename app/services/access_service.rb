class AccessService
  def self.conn
    Faraday.new(url: 'https://github.com', headers: { 'Accept': 'application/json' })
  end

  def self.response(code)
    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = ENV['CLIENT_ID']
      req.params['client_secret'] = ENV['CLIENT_SECRET']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.access_user_data(access_token)
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{access_token}"
      }
    )

    response = conn.get('/user')
    JSON.parse(response.body, symbolize_names: true)
  end
end
