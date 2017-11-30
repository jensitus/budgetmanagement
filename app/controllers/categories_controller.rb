class CategoriesController < ApplicationController
  before_action :set_household, only: [:index, :create, :add_to_household]

  def index

  end

  def create

    @category = @household.categories.new(category_params)
    puts @category.name
    begin
      @category.save
      @household.categories << @category
      @message = 'Category successfully . . . '
    rescue ActiveRecord::RecordNotUnique => e
      puts e.to_s
      @message = ' The desired category is already available'
    end
    respond_to do |format|
      format.js
    end
  end

  def add_to_household
    puts '~~~~~~~~~~~~~~~~~~~~'
    puts add_category_params
    puts add_category_params[:category_id].to_i.class
    i = add_category_params[:category_id]
    i = i.to_i
    puts i
    puts i.class
    c = Category.find i
    puts 'c:'
    puts c.name
    puts c.id
    puts '~~~~~~~~~~~~~~~~~~~~'
    @household.categories << c
    @c = c
  end

  def add_to_expense

    i = add_category_params[:category_id]
    i = i.to_i
    e = add_category_params[:expense_id]
    e = e.to_i
    category = Category.find i
    expense = Expense.find e
    if expense.categories << category
      @category = category
    else
      puts 'no no no'
    end
  end

  def delete_from_expense
    cat_id = add_category_params[:category_id]
    cat_id = cat_id.to_i
    ex_id = add_category_params[:expense_id]
    ex_id = ex_id.to_i
    e = Expense.find(ex_id)
    e.categories.delete(cat_id)
    @e = e
    @cat_id = cat_id
  end

  def update
  end

  def destroy
  end

  private

  def set_household
    @household = Household.find(params[:household_id])
  end

  def category_params
    params.permit(:name)
  end

  def add_category_params
    params.permit(:name, :household_id, :category_id, :expense_id)
  end

end
