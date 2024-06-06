Rails.application.routes.draw do
  get("/", {:controller => "dice", :action => "index"})

  get("/dice/:param_one/:param_two", { :controller => "dice", :action => "flex" })
end
