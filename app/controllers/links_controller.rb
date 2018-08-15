class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link, notice: 'Link created successfully!'
    else
      flash.now[:error] = 'There was an error on the form please retry.'
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      redirect_to @link, notice: 'Link updated successfully!'
    else
      flash.now[:error] = 'There was an error on the form please retry.'
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])

    if @link.destroy
      redirect_to links_path, notice: 'Link deleted successfully!'
    else
      redirect_to :back, error: 'Link could not be deleted please try again.'
    end
  end

  def redirect
    @link = Link.find_by_name(params[:name])

    if @link
      redirect_to @link.url
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def link_params
    params.require(:link).permit(:name, :url)
  end
end
