# rails-dice-dynamic

Target: https://dice-roll.matchthetarget.com/

Notes:

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
