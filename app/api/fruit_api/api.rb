# app/api/fruit_api/api.rb

require 'grape'

module FruitAPI
  class API < Grape::API
    version 'v1', using: :header, vendor: 'fruit_api'
    format :json
    prefix :api
    content_type :json, 'application/json;charset=UTF-8'
    resource :nutrition do
      desc 'Return a nutrition of fruit.'
      get :public_timeline do
        # Status.limit(20)

        {:say => 'hahaha'}
      end

    desc 'Return a fruit.'
      # params do
      #   requires :id, type: Integer, desc: 'Status id.'
      # end
      # route_param :id do
        get :haha do
          Fruit.find_by_name(params[:name])
        end
      # end
    end
  end
end