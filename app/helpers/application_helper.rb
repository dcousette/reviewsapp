module ApplicationHelper
  def clean_date_format(object)
    object.created_at.strftime('Reviewed on %a %b %e at I:%M%p')
  end
  
  def rating_options
    (1..5).map { |num| ["#{pluralize( num, "Star")}", num] }
  end
end
