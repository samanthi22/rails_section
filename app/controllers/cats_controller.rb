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
        # @cat - instance variable
        @cat = Cat.new(cat_params)
        #cat.admin = false
        if @cat.save
            #render :show
            # /cats/{#id}
            redirect_to cat_url(@cat)
            # render json: cat
        else 
            render :new
            # cannot redirect_to
            #render json: @cat.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def new
       # show a form to create a new object
       # /cats/new
       @cat = Cat.new
       render :new
    end
    # 
    
    def update
        @cat = Cat.find(params[:id])
        # .permit()) 
        # attributes not on this list will be ignored
        if @cat.update(cat_params)
        redirect_to cat_url(@cat)
        else
            render :edit
        end
    end 
    
    def edit
        # /cats/:id/edit
        # show a form to edit
        @cat = Cat.find(params[:id])
        render :edit
    end 
    
    def destroy
        # DELETE /cats/:id
       cat = Cat.find(params[:id])
       cat.destroy
       redirect_to cats_url
       
       # 1. GET /cats
       # 2. click delete button
       # 3. sends POST _method="DELETE"
       # 4. Deletes cat then redirects 
       # 5. Client gets /cats/ again
    end
    
    private
    def cat_params
       params[:cat].permit(:name, :skill) 
    end
end