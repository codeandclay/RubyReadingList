class EntriesController < ApplicationController
  before_action :set_tags, :set_category

  def index
    @entries = Entry.by_category(@category).includes(:category)
                    .by_tags(@tags).includes(:category)

    # report stuff
    category = params[:category] || 'entries'
    count = @entries.size

    category_part = "Listing #{@entries.size} #{category}"
    entry_part = "tagged #{params[:tags].first}" if params[:tags]

    @report = "#{category_part} #{entry_part}".strip << "."
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
