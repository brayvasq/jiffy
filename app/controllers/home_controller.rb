class HomeController < ApplicationController
  def index
    redis = Redis.new(host: 'redis', port: 6379)
    redis.incr 'visits'

    @visits = redis.get 'visits'
  end
end
