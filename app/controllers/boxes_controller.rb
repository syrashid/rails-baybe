class BoxesController < ApplicationController
  def index
    @boxes = Box.where("user_id=?", current_user.id)
  end
end
