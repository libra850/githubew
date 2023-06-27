module Githubew
  class Github
    API_ENDPOINT = "https://api.github.com"

    def initialize(github_token)
      @github_token = github_token
    end

    def repositories
      json = RestClient.get("#{API_ENDPOINT}/user/repos", "Authorization" => "token #{@github_token}", accept: :json).body
      JSON.parse(json, symbolize_names: true).map { |repository| repository[:name] }
    end
  end
end
