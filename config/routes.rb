Rails.application.routes.draw do
  get("/", {:controller => "dice", :action => "index"})

  get("/dice/:num_dice/:sides", { :controller => "dice", :action => "flexible" }) 
end
