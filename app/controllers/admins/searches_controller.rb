class Admins::SearchesController < ApplicationController

  def index
    @word = params["search"]["word"]
    @customers = search_customer(@word)
    @products = search_product(@word)
  end

  private
  def search_customer(word)
    Customer.where('lastname LIKE ? or firstname LIKE ?', "%#{word}%", "%#{word}%")
  end

  def search_product(word)
    Product.where('name LIKE ?', "%#{word}%")
  end
end
