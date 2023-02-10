class CountResetter
  def self.run
    Category.all.each do |cat|
      Category.reset_counters(cat.id, :entries)
    end
  end
end