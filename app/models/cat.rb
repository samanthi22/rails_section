class Cat < ActiveRecord::Base
    validates :name, presence: true
    
    def index
    
    end
end 