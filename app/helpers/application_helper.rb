module ApplicationHelper

  def multi_sortable(column, label)
    sorts = Array(params[:sort]).dup
    dirs = Array(params[:dir]).dup

    index = sorts.index(column)

    if index
      dirs[index] = dirs[index] == "asc" ? "desc" : "asc"
    else
      sorts << column
      dirs << "asc"
    end

    link_to label,
      user_pet_logs_path(
        params[:user_id],
        params[:pet_id],
        sort: sorts,
        dir: dirs
      )

  end
end
