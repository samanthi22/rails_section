class CatsController < ApplicationController
    def index
        cats = Cat.all
        self.render json: cats
    end
    
    def show
        self.render json: Cat.find(self.params[:id])
    end
    
    def create
    
    end
end