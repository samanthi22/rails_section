class CatsController < ApplicationController
    def index
        # instance variable
        @cats = Cat.all
        #self.render json: cats
        #render "index.html"
        render :index
    end
    
    def show
        @cat = Cat.find(params[:id])
        render :show
        #self.render json: Cat.find(self.params[:id])
    end
    
    def create
        #{ "cat" : { "name": "Sally" }, "dog": {"name":"Bertrand"}}
        @cat = Cat.new(name: params[:cat].permit(:name))
        #cat.admin = false
        if @cat.save
            render :show
            # render json: cat
        else 
            render json: cat.errors.full_message, status: :unprocessable_entity
        end
    end
    
    def new
       # show a form to create a new object
       # /cats/new
       render :new
    end
    # 
    
    def update
        cat = Cat.find(params[:id])
        # .permit()) 
        # attributes not on this list will be ignored
        cat.update(params[:cat].permit(:name))
    end 
    
    #def edit
        # /cats/:id/edit
        # show a form to edit
    #end 
    
    def destroy
        #if !current_cat_user.admin
         #   raise "error"
        #end
    end
end