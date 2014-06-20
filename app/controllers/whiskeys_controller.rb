class WhiskeysController < ApplicationController
  before_action :set_whiskey, only: [:show, :edit, :update, :destroy]

  # GET /whiskeys
  # GET /whiskeys.json
  def index
    @whiskeys = Whiskey.all
  end

  # GET /whiskeys/1
  # GET /whiskeys/1.json
  def show
  end

  # GET /whiskeys/new
  def new
    @whiskey = Whiskey.new
  end

  # GET /whiskeys/1/edit
  def edit
  end

  # POST /whiskeys
  # POST /whiskeys.json
  def create
    @whiskey = Whiskey.new(whiskey_params)

    respond_to do |format|
      if @whiskey.save
        format.html { redirect_to @whiskey, notice: 'Whiskey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @whiskey }
      else
        format.html { render action: 'new' }
        format.json { render json: @whiskey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whiskeys/1
  # PATCH/PUT /whiskeys/1.json
  def update
    respond_to do |format|
      if @whiskey.update(whiskey_params)
        format.html { redirect_to @whiskey, notice: 'Whiskey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @whiskey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whiskeys/1
  # DELETE /whiskeys/1.json
  def destroy
    @whiskey.destroy
    respond_to do |format|
      format.html { redirect_to whiskeys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whiskey
      @whiskey = Whiskey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whiskey_params
      params.require(:whiskey).permit(:type, :tags, :distillery, :name, :description, :image)
    end
end
