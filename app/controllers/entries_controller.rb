class EntriesController < ApplicationController
  before_action :set_tags, :set_category

  def index
    @entries = Entry.by_category(@category)
                    .by_tags(@tags)
                    .includes(:category)
  end

  def set_tags
    if params[:tags].nil?
      @tags = []
    else
      @tags = params[:tags]
    end
  end

  def set_category
    @category = params[:category]
  end
end
