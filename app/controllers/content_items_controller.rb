class ContentItemsController < ApplicationController
  before_action :set_content_item, only: [:show, :update, :destroy]

  # GET /content_items
  def index
    @content_items = ContentItem.published
    ContentItem.not_published.map {|c| PublishItemJob.perform_later(c.id)}
    ObjectSpace.define_finalizer(self, seed_before_close)
    render json: @content_items
  end

  # GET /content_items/1
  def show
    render json: @content_item
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

  # HELPER METHODS
  def seed_before_close
    Proc.new {
      ContentItem.limit(ContentItem.all.length / 2).each do |c|
        c.status = 'draft'
        c.save!
      end
    }
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

