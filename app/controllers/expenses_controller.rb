class ExpensesController < ApplicationController
  # before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_household, only: [:index, :new, :create, :edit, :update]
  before_action :authenticate_user!

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = @household.expenses.order(:id)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = @household.expenses.new
  end

  # GET /expenses/1/edit
  def edit
    @expense = @household.expenses.find(params[:id])
  end

  # POST /expenses
  # POST /expenses.json
  def create

    @expense = @household.expenses.new(expense_params)
    @expense.user_id = current_user.id
    puts @expense
    respond_to do |format|
      if @expense.save
        format.html {redirect_to household_expenses_path(@household), notice: 'Expense was successfully created.'}
        format.json {render :show, status: :created, location: @expense}
      else
        format.html {render :new}
        format.json {render json: @expense.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    @expense = @household.expenses.find(params[:id])
    respond_to do |format|
      if @expense.update(expense_params)
        format.html {redirect_to household_expenses_path(@household), notice: 'Expense was successfully updated.'}
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

  # Use callbacks to share common setup or constraints between actions.
  # def set_expense
  #   @expense = Expense.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:amount, :description, :spent_at)
  end

  def set_household
    @household = Household.find(params[:household_id])
  end

  def household_params
    params.require(:household).permit(:name)
  end

end
