class EntriesController < ApplicationController
  before_action :set_tags

  def index
    @entries = Entry.by_category(params[:category])
                    .by_tags(@tags)
                    .includes(:category)
  end

  def set_tags
    @tags = params[:tags]
  end
end
