class ToysController < ApplicationController
    def index
        # cats/:cat_id/toys
        cat = Cat.find(params[:cat_id])
        render json: cat.toys #Toy.all
    end
    
    def show
        # /cats/:cat_id/toys/:id
        # toys/:id
        render json: Toy.find[params[:id]]
    end
    
    #def edit
        # form partials
        
    #end 
    
    def create
        # POST /cats/:cat_id/toys
        # POST /toys
        #self.params method => returns an object of parameters
        #HashWithIndiffentAccess < Hash
        # whitelist
        # strong parameters
        # toy = Toy.new(params[:toy].permit(:cat_id, :name, :ttype))
        # because protected method
        @toy = Toy.new(self.toy_params)
        @cat = @toy.cat
        # can also say Cat.find(params[:toy][:cat_id]) #=> @toy.cat
        # toy.cat_id = params[:cat_id]
            #cat_id: params[:toy][:cat_id],
            #name: params[:toy][:name],
            #ttype: params[:toy][:ttype]
            #)
            
        if @toy.save
            redirect_to cat_url(@cat)
            
        else
            render :new
            #raise "Hell"
            # HTTP 422 Error
            #render json: toy.errors.full_messages, status: unprocessable_entity
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
    
    def new
        @cat = Cat.find(params[:cat_id])
        @toy = Toy.new
        render :new
    end

# because it's a private method 
# I can't say self.params
# but I can say protected
    protected
    
        def toy_params
            # removed 
            # 
        # toy.cat_id = params[:cat_id]
        # from def create
        # will need permit(:cat_id)
            self.params[:toy].permit(:cat_id, :name, :ttype)
        end
    
end