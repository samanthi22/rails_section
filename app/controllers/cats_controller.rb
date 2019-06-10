class CatsController < ApplicationController
    def index
        cats = Cat.all
        self.render json: cats
    end
    
    def show
        self.render json: Cat.find(self.params[:id])
    end
    
    def create
        #{ "cat" : { "name": "Sally" }, "dog": {"name":"Bertrand"}}
        cat = Cat.new(name: params[:cat][:name])
        if cat.save
            render json: cat
        else 
            render josn: cat.errors.full_message, status: :unprocessible_entity
        end
    end
end