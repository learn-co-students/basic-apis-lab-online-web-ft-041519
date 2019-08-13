class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |res|
      res.params['q'] = params[:query]
  end

    new_resp = JSON.parse(@resp.body)
    @repositories = new_resp["items"]

    render :search
  end
end
