class ToysController < ApplicationController
    def index
        render json: Toy.all
    end
    
    def show
        render json: Toy.find[params[:id]]
    end
    
    def create
        #self.params method => returns an object of parameters
        #HashWithIndiffentAccess < Hash
        # whitelist
        # strong parameters
        toy = Toy.new(params[:toy].permit(:cat_id, :name, :ttype))
            #cat_id: params[:toy][:cat_id],
            #name: params[:toy][:name],
            #ttype: params[:toy][:ttype]
            #)
            
        if toy.save
            render json: toy
            
        else
            # HTTP 422 Error
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
        success = toy.update(params[:toy].permit(:name)) # ignores ttype, and string key/values 
        # will have all keys uploaded.
        # if no value for key ttype then it won't try to updated ttype
        # ForbiddenAttributesError
        if success
        render json: toy
        else
            render json: toy.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    private
    
        def toy_params
            self.params[:toy].permit(:name)
        end
    
end