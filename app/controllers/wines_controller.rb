class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wine, only: %i[ show edit update destroy ]

  # GET /wines or /wines.json
  def index
    @wines = Wine.all
  end

  # GET /wines/1 or /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    if User.is_admin(current_user.id)
      @wine = Wine.new
      @wine.wine_strains.build
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # GET /wines/1/edit
  def edit
    if User.is_admin(current_user.id)
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # POST /wines or /wines.json
  def create
    if User.is_admin(current_user.id)
      @wine = Wine.new(wine_params)

      respond_to do |format|
        if @wine.save
          format.html { redirect_to @wine, notice: "Wine was successfully created." }
          format.json { render :show, status: :created, location: @wine }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @wine.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    if User.is_admin(current_user.id)
      respond_to do |format|
        if @wine.update(wine_params)
          format.html { redirect_to @wine, notice: "Wine was successfully updated." }
          format.json { render :show, status: :ok, location: @wine }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @wine.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    if User.is_admin(current_user.id)
      @wine.destroy
      respond_to do |format|
        format.html { redirect_to wines_url, notice: "Wine was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      flash[:alert] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name, wine_strains_attributes: [:id, :strain_id, :percentage, :_destroy])
    end
end
