class PdfsController < ApplicationController
  before_action :set_pdf, only: [:show, :update, :destroy]

  # GET /pdfs
  def index
    @pdfs = Pdf.all
  end

  # GET /pdfs/1
  def show
    render json: @pdf
  end

  # POST /pdfs
  def create
    @pdf = Pdf.new(pdf_params)

    if @pdf.save
      render json: @pdf, status: :created, location: @pdf
    else
      render json: @pdf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pdfs/1
  def update
    if @pdf.update(pdf_params)
      render json: @pdf
    else
      render json: @pdf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pdfs/1
  def destroy
    @pdf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf
      @pdf = Pdf.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pdf_params
      params.require(:pdf).permit(:ip, :sistema_operativo, :version, :contraseña)
    end
end
