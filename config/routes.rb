# config/routes.rb

Rails.application.routes.draw do
  get 'pipeline_elements', to: 'pipeline_elements#index'
  root to: 'pipeline_elements#index'
end