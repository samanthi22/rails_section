class ToysController < ApplicationController
    def index
        render json: Toy.all
    end
    
    def show
        render json: Toy.find[params[:id]]
    end
    
    def create
        toy = Toy.new(params[:toy].permit(:cat, :name, :ttype))
            #cat_id: params[:toy][:cat_id],
            #name: params[:toy][:name],
            #ttype: params[:toy][:ttype]
            #)
            
        if toy.save
            render json: toy
            
        else
            render json: toy.errors.full_messages, status: unprocessable_entity
        end  
    end
    
    def destroy
        toy = Toy.find(params[:id])
        toy.destroy
        render json: toy
    end
    
    def update
        toy = Toy.find(params[:id])
        success = toy.update(params[:toy])
        # will have all keys uploaded.
        # if no value for key ttype then it won't try to updated ttype
        # ForbiddenAttributesError
        if success
        render json: toy
        else
            render json: toy.errors.full_messages, status: :unprocessable_entity
        end
    end
    
end