class ContentItemsController < ApplicationController
  before_action :set_content_item, only: [:show, :update, :destroy]

  # GET /content_items
  def index
    @content_items = ContentItem.all

    render json: @content_items
  end

  # GET /content_items/1
  def show
    render json: @content_item.published
  end

  # POST /content_items
  def create
    @content_item = ContentItem.new(content_item_params)

    if @content_item.save
      render json: @content_item, status: :created, location: @content_item
    else
      render json: @content_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /content_items/1
  def update
    if @content_item.update(content_item_params)
      render json: @content_item
    else
      render json: @content_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /content_items/1
  def destroy
    @content_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_item
      @content_item = ContentItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def content_item_params
      params.require(:content_item).permit(:title, :published_date, :author, :summary, :content)
    end
end
