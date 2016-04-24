class StaticPagesController < ApplicationController
  def home
    @welcome = "Hello! world"
  end
end
