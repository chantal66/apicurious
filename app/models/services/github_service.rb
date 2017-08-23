class GithubService
  def initialize(login, token)
    @login = login
    @token = token
  end

  def current_user_info
    response = Faraday.get("https://api.github.com/users/#{login}?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names: true)
  end


  def self.current_user_info(login, token)
    new(login, token).current_user_info
  end
  
  private
  
  attr_reader :login,
              :token,
              :conn

  def default_filter
    {
        access_token: token,
        login: login
    }
  end
end