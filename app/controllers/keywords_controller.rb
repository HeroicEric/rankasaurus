class KeywordsController < ApplicationController

  def new
    @domain = Domain.find(params[:domain_id])
    @keyword = @domain.keywords.new
  end

  def create
    @domain = Domain.find(params[:domain_id])
    @keyword = @domain.keywords.create(params[:keyword])

    if @keyword.save
      redirect_to @domain, notice: 'Keyword added successfully.'
    else
      render :action => 'new'
    end
  end

  def destroy
    @domain = Domain.find(params[:domain_id])
    @keyword = @domain.keywords.find(params[:id])
    @keyword.destroy

    redirect_to :back, notice: "Keyword deleted successfully."
  end

end