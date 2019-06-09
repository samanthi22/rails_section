# app/controllers/clients_controller.rb
class ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def show
    render json: Client.find(params[:id])
  end
end

# config/routes.rb
MyLittleProject::Application.routes.draw do
  resources :clients, only: [:index, :show]
end

pluralize the name of the model, and tack on "Controller"
model Client
controller ClientsController

