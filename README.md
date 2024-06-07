# rails-dice-dynamic

Target: https://dice-roll.matchthetarget.com/

Sinatra tutorial: https://learn.firstdraft.com/lessons/111-sinatra-dice-dynamic-routes

Notes:

In Sinatra, the main files are app.rb and views/*.erb. 

1. First, define the routes in the config/routes.rb file.
```
Rails.application.routes.draw do
  Rails.application.routes.draw do
    get("/", {:controller => "dice", :action => "index"})
  end
end
```

2. Second, define the class that direct the routes in app/controller/dice_controller.rb.
```
class DiceController < ApplicationController
  def index
    render({:template => "game_templates/index"})
  end
end
``` 

3. Third, create the html.erb page in views/game_templates/index.html.erb. Check to make sure the folder structure is correct for it to work.
```
<!DOCTYPE html>
<html>
  <head>
    <title>Target: Dice Roll</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <style>
      .navbar {
        display: flex;
      	justify-content: space-around;
      }
    </style>
    
  </head>

  <body>
  
    <h1>Dice Roll</h1>

<ul>
  <li><a href="/dice/2/6">Roll two 6-sided dice</a></li>
  <li><a href="/dice/2/10">Roll two 10-sided dice</a></li>
  <li><a href="/dice/1/20">Roll one 20-sided die</a></li>
  <li><a href="/dice/5/4">Roll five 4-sided dice</a></li>
</ul>


  </body>
</html>
```
4. By default, the views/layouts/application.html.erb page already contains the header, which should be excluded:
```
  <div class="navbar">
      <div><a href="/">Home</a></div>
      <div><a href="/dice/2/6">2d6</a></div>
      <div><a href="/dice/2/10">2d10</a></div>
      <div><a href="/dice/1/20">1d20</a></div>
      <div><a href="/dice/5/4">5d4</a></div>
    </div>
```

5. Create the respective dice pages within app/views/game_templates folder: two_six, two_ten, one_twenty, and five_four. Use the contents from the sinatra project. The extensions are html.erb.

6. Mimic the contents of app.rb file in the sinatra project (https://github.com/rayguna/sinatra-dice-dynamic/tree/main) to link to each of the html.erb pages. 

7. Pass parameters from the route to the web-page:
- Specify the dynamic route within config/routes.rb, as follows -- R:

```
Rails.application.routes.draw do
  get("/", {:controller => "dice", :action => "index"})

  get("/dice/:num_dice/:sides", { :controller => "dice", :action => "flexible" })
end
```

- Define the class and method that is called from routes.rb within controllers/dice_controller.rb -- C
```
class DiceController < ApplicationController
  def index
    render({:template => "dice/index"})
  end

  def flexible
    render({:template => "dice/flexible"})
  end
end
```

- Within the controllers/views/flexible.html.erb, you can call the dictionary values using the command <%=params%>. You can call specific dictionary value by its key using the command param.fetch("key"). -- V
```
<!-- /views/flexible.erb -->

<%=params%>

<h1><%=params.fetch("num_dice")%>d<%=params.fetch("sides")%></h1>
```

8. You can manipulate the dynamic route within the html page as follows. Remember to convert the parameter from string to integer.:
```
<!-- /views/flexible.erb -->

<h1><%=params.fetch("num_dice")%>d<%=params.fetch("sides")%></h1>

<% @rolls = [] %>

<%@num_dice = params.fetch("num_dice").to_i%>
<%@sides = params.fetch("sides").to_i%>

<% @num_dice.times do %>
  <% die = rand(1..@sides) %>

  <% @rolls.push(die) %>
<% end %>

<ul>
  <% @rolls.each do |a_roll| %>
    <li>
      <%= a_roll %>
    </li>
  <% end %>
</ul>
```
9. Doubt: How do I embed the code into config/routes.rb (see below), rather than embedding directly into /views/flexible.erb? How do I pass the parameters? I tried @num_dice = params["num_dice"], but the new key-value pair does not show up on the html page when it is called with <%=params%>
```
Rails.application.routes.draw do
  get("/", {:controller => "dice", :action => "index"})

  get("/dice/:num_dice/:sides", { :controller => "dice", :action => "flexible" }) 
end
```
