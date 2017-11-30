class ExpensesController < ApplicationController
  before_action :set_household, only: [:index, :new, :create, :edit, :update, :monthlystatementoutput, :monthlyinput]
  before_action :authenticate_user!
  before_action :require_household_user, only: [:index]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = @household.expenses.order(spent_at: :desc)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  def monthlystatementoutput

    @monthly = Monthly.new(params[:month], params[:year])
    @household.expenses.monthly_statement(params[:month], params[:year]).each do |e|
      @monthly.bill += e.amount
    end
    respond_to do |format|
      format.js
    end
  end

  def monthlyinput

  end

  # GET /expenses/new
  def new
    @expense = @household.expenses.new
    @household_categories = @household.categories
  end

  # GET /expenses/1/edit
  def edit
    @expense = @household.expenses.find(params[:id])
    if current_user != @expense.user
      flash[:danger] = 'you have no permission to do this'
      redirect_to root_url
    end
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = @household.expenses.new(expense_params)
    @expense.user_id = current_user.id
    if @expense.save
      flash[:success] = 'Expense was successfully created.'

      c = Category.find cat_params[:category].to_i
      @expense.categories << c

      ActionCable.server.broadcast "household_#{@household.id}_expenses",
                                   household: @household.id,
                                   amount: @expense.amount,
                                   description: @expense.description,
                                   user: @expense.user.username
      # head :ok

      redirect_to household_expenses_path(@household)
    else
      flash[:alert] = "That wasn't what you expected, right?"
      redirect_to root_url
    end

  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    @expense = @household.expenses.find(params[:id])
    respond_to do |format|
      if @expense.update(expense_params)

        # c = Category.find cat_params[:category].to_i
        #
        # if @expense.categories << c
        #   puts 'SUPER'
        # else
        #   puts 'SCHEIßE'
        # end

        flash[:alert] = 'Expense was successfully updated.'
        format.html {redirect_to household_expenses_path(@household)}
        format.json {render :show, status: :ok, location: @expense}
      else
        format.html {render :edit}
        format.json {render json: @expense.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html {redirect_to expenses_url, notice: 'Expense was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:amount, :description, :spent_at)
  end

  def cat_params
    params.permit(:category)
  end

  def set_household
    @household = Household.find(params[:household_id])
  end

  def household_params
    params.require(:household).permit(:name)
  end

end
