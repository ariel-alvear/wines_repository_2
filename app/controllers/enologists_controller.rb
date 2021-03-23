class EnologistsController < ApplicationController
  before_action :set_enologist, only: %i[ show edit update destroy ]

  # GET /enologists or /enologists.json
  def index
    if User.is_admin(current_user.id)
      @enologists = Enologist.all
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # GET /enologists/1 or /enologists/1.json
  def show
    if User.is_admin(current_user.id)
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # GET /enologists/new
  def new
    if User.is_admin(current_user.id)
      @enologist = Enologist.new
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # GET /enologists/1/edit
  def edit
    if User.is_admin(current_user.id)
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # POST /enologists or /enologists.json
  def create
    if User.is_admin(current_user.id)
      @enologist = Enologist.new(enologist_params)

      respond_to do |format|
        if @enologist.save
          format.html { redirect_to @enologist, notice: "Enologist was successfully created." }
          format.json { render :show, status: :created, location: @enologist }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @enologist.errors, status: :unprocessable_entity }
        end
      end

    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # PATCH/PUT /enologists/1 or /enologists/1.json
  def update
    if User.is_admin(current_user.id)
      respond_to do |format|
        if @enologist.update(enologist_params)
          format.html { redirect_to @enologist, notice: "Enologist was successfully updated." }
          format.json { render :show, status: :ok, location: @enologist }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @enologist.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  # DELETE /enologists/1 or /enologists/1.json
  def destroy
    if User.is_admin(current_user.id)
      @enologist.destroy
      respond_to do |format|
        format.html { redirect_to enologists_url, notice: "Enologist was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      flash[:notice] = "You don't have permissions for this action"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enologist
      @enologist = Enologist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enologist_params
      params.require(:enologist).permit(:name, :age, :nacionality, {magazine_ids: []})
    end
end
