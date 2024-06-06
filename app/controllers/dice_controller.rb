class DiceController < ApplicationController
  def index
    render({:template => "dice/index"})
  end

  def flex
    render({:template => "dice/2/6"})
  end
end
