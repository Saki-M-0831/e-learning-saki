module CategoriesHelper
  def filter_class(status)
    @filter == status ? 'btn-primary' : 'btn-outline-primary'
  end
end
