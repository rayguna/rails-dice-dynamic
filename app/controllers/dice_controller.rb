class DiceController < ApplicationController
  def index
    render({:template => "dice/index"})
  end

  def flexible
    render({:template => "dice/flexible"})
  end
end
