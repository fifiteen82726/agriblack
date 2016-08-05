# app/api/fruit_api/api.rb

require 'grape'

module FruitAPI
  class API < Grape::API
    
    version 'v1', using: :header, vendor: 'fruit_api'
    format :json
    prefix :api
    content_type :json, 'application/json;charset=UTF-8'
    resource :nutrition do
      desc 'Return a fruit.'
      get :haha do
        Fruit.find_by_name(params[:name])
      end
    end

    add_swagger_documentation(
      basd_path: "/v1",  #Swagger的base url

      mount_path: 'doc', #代表我們要去 v1/doc

      info: {
        title: 'Fruit API', 
        description: "A description of the API."
        },
        hide_documentation_path: true,
        hide_format: true,
        include_base_url: true
        )

  end
end