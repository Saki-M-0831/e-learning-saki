module CategoriesHelper
  def filter_learned
    @filter == "learned" ? 'btn-primary' : 'btn-outline-primary'
  end

  def filter_not_learned
    @filter == "not learned" ? 'btn-primary' : 'btn-outline-primary'
  end
   
  def filter_all
    @filter == "all" || @filter.nil? ? 'btn-primary' : 'btn-outline-primary'
  end
end
