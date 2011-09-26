class DomainsController < ApplicationController
  def index
    @domains = Domain.all
  end
  
  def show
    @domain = Domain.find(params[:id])
    @keywords = @domain.keywords
  end

  def new
    @domain = Domain.new
  end

  def edit
    @domain = Domain.find(params[:id])
  end

  def create
    @domain = Domain.new(params[:domain])
    if @domain.save
      redirect_to @domain, notice: 'Domain was added successfully.'
    else
      render :action => 'new'
    end
  end

  def update
    @domain = Domain.find(params[:id])

    if @domain.update_attributes(params[:domain])
      redirect_to @domain, notice: 'Domain was saved successfully.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    redirect_to domains_url, notice: 'Domain was deleted successfully.'
  end
end
