Hi there! Welcome to AWS!

routes:
RESTful Routes:

```
Rails.application.routes.draw do 

resources :superheroes, only: [:index, :show, :create, :update, :destroy]

resources :superheroes do 
    resources :abilities, only: [:index] # collection route 
end

    get 'superheroes/2/abilities'
    
    resources :abilities, only: [:show, :update, :create, :destroy]
end
```

```get 'silly', to: 'silly#fun'``` # Hash # to: => 'silly#fun' # 'controller#method' # silly_controller.rb # fun/action method

```post 'silly', to: 'silly#time'```

```post "silly/:id", to: "silly#super"```

```class SillyController < ApplicationController
    def fun
        render text: "Hello"
    end
end

class SillyController < ApplicationController
    def fun
        render text: params[:message] # hash-like object given to the controller by the route # :text or :json
        # params[:message] # params hash is like a normal hash
    end
    
    def time
        render json: params # key, age value, 50 #params # request body
    end 
    
    def super 
        render json: params
    end
end
```

#params
#1) Query string
#2) Request body
#3) URL Params/route params (wildcards)

GET localhost:3000/silly?message=hi

results in...

json:
```
{
    "message" : "hi",
    "controller": "silly", 
    "action": "fun"
}
```

text: 

```
{
    "age": "50", 
    "message": "hi", 
    "controller": "silly",
    "action": "time"
}
```

wildcard
# silly/:id in routes
so silly/20/
:id is 20
wildcard is 20

```
{ 
    "id": 20
}
```


key - superhero[power], 200 # hash key value params

Rails API is to get your controllers to convert model objects to JSON and then return JSON.

select tag for cat toys type:

```
<select name="toy[ttype]" id="toy_ttype">
<option value="yarnball"
<%= "selected" if @toy.ttype == "yarnball" %>> Ball o'Yarn </option>
</select>
```


or ..
```
<% Toy:TYPES.each do |type| %>
<option value="<%= type %>"
<%= "selected" if @toy.ttype == type %>>
<%= type.upcase %>
</option>
<% end %>
```

how to know whether updating cat
``` 
<% action_url = @cat.persisted? %>
```
has the cat been updated to the database or not 
```
@cat.persisted? ? "PATCH" : "POST"
```