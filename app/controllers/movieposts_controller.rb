class MoviepostsController < ApplicationController
  before_action :set_moviepost, only: [:show, :edit, :update, :destroy]

  # GET /movieposts
  # GET /movieposts.json
  def index
    @movieposts = Moviepost.all
  end

  # GET /movieposts/1
  # GET /movieposts/1.json
  def show
  end

  # GET /movieposts/new
  def new
    @moviepost = Moviepost.new
  end

  # GET /movieposts/1/edit
  def edit
  end

  # POST /movieposts
  # POST /movieposts.json
  def create
    @moviepost = Moviepost.new(moviepost_params)

    respond_to do |format|
      if @moviepost.save
        format.html { redirect_to root_path, notice: 'Moviepost was successfully created.' }
   #     format.html { redirect_to @moviepost, notice: 'Moviepost was successfully created.' }
        format.json { render :show, status: :created, location: @moviepost }
      else
        format.html { render :new }
        format.json { render json: @moviepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movieposts/1
  # PATCH/PUT /movieposts/1.json
  def update
    respond_to do |format|
      if @moviepost.update(moviepost_params)
        format.html { redirect_to @moviepost, notice: 'Moviepost was successfully updated.' }
        format.json { render :show, status: :ok, location: @moviepost }
      else
        format.html { render :edit }
        format.json { render json: @moviepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movieposts/1
  # DELETE /movieposts/1.json
  def destroy
    @moviepost.destroy
    respond_to do |format|
      format.html { redirect_to movieposts_url, notice: 'Moviepost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moviepost
      @moviepost = Moviepost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moviepost_params
      params.require(:moviepost).permit(:movieimage, :title, :content)
    end
end
