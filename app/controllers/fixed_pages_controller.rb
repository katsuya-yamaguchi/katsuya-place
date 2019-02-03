class FixedPagesController < ApplicationController

  # GET /categories
  def category
    @categories = Category.order(:updated_at)
  end

  # GET /profile
  def profile
  end
end
