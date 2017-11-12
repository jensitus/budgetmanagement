class HouseholdsController < ApplicationController

  before_action :set_household, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @households = current_user.households
  end

  def show
    @users = User.all
  end

  def new
    @household = Household.new
  end

  def edit
  end

  def create
    @household = Household.new(household_params)
    @household.users << current_user
    respond_to do |format|
      if @household.save
        format.html {redirect_to household_expenses_path(@household), notice: 'Household was successfully created.'}
        format.json {render :show, status: :created, location: @household}
      else
        format.html {render :new}
        format.json {render json: @household.errors, status: :unprocessable_entity}
      end
    end

  end

  def update
    u = User.find(update_params['add_user'])
    respond_to do |format|

      if @household.save(update_params)
        begin
          @household.users << u
          format.html { redirect_to household_path(@household), notice: 'yepp, you added the selected user successfully to your famous household'}
        rescue ActiveRecord::RecordNotUnique

          format.html { redirect_to household_path(@household), notice: 'Sorry, but it seems the selected user is already member of your famous household'}

          @users_by_household = @household.users
        end
      end
    end
  end

  def destroy
  end

  private

  def household_params
    params.require(:household).permit(:name, user_attributes: [:id, :username])
  end

  def update_params
    params.permit(:add_user)
  end

  def set_household
    @household = Household.find(params[:id])
  end

end
