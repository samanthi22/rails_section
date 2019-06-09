class Cat < ActiveRecord::Base
    validates :name, presence: true
    
    def index
        cats = Cat.all
        self.render json: cats
    end
    
    def show
        self.render json: Cat.find(self.params)
    end
end 