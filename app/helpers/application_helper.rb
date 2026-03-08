module ApplicationHelper

  def multi_sortable(column, label)
    sorts = Array(params[:sort]).dup
    dirs = Array(params[:dir]).dup

    index = sorts.index(column)

    # - > ↑ > ↓ ⇅
  if index
    if column == "date"
      dirs[index] = dirs[index] == "asc" ? "desc" : "asc"
    else
      case dirs[index]
      when "asc"
        dirs[index] = "desc"
      when "desc"
        sorts.delete_at(index)
        dirs.delete_at(index)
      end
    end
  else
    sorts.unshift(column)
    dirs.unshift("asc")
  end

    current_index = Array(params[:sort]).index(column)
    arrow = "⇅"
    css_class = "sort-none"

    if current_index
      direction = params[:dir][current_index]

      if direction == "asc"
        arrow = " ↑"
        css_class = "sort-asc"
      else
        arrow = " ↓"
        css_class = "sort-desc"
      end
    end

    link_to "#{label}#{arrow}".html_safe,
      params.permit(:user_id, :pet_id, sort: [], dir: [])
            .merge(sort: sorts, dir: dirs),
      class: css_class

  end
end
