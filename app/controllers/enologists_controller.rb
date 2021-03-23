class EnologistsController < ApplicationController
  before_action :set_enologist, only: %i[ show edit update destroy ]

  # GET /enologists or /enologists.json
  def index
    @enologists = Enologist.all
  end

  # GET /enologists/1 or /enologists/1.json
  def show
  end

  # GET /enologists/new
  def new
    @enologist = Enologist.new
  end

  # GET /enologists/1/edit
  def edit
  end

  # POST /enologists or /enologists.json
  def create
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
  end

  # PATCH/PUT /enologists/1 or /enologists/1.json
  def update
    respond_to do |format|
      if @enologist.update(enologist_params)
        format.html { redirect_to @enologist, notice: "Enologist was successfully updated." }
        format.json { render :show, status: :ok, location: @enologist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enologists/1 or /enologists/1.json
  def destroy
    @enologist.destroy
    respond_to do |format|
      format.html { redirect_to enologists_url, notice: "Enologist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enologist
      @enologist = Enologist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enologist_params
      params.require(:enologist).permit(:name,, :age, :nacionality)
    end
end
