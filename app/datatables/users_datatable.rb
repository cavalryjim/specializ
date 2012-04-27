# JDavis: This is a class to manage the json for the user_table.
#         See http://railscasts.com/episodes/340-datatables for an explanation of the code.
class UsersDatatable
  delegate :params, :h, :link_to, :image_tag, :edit_user_path, :check_box_tag, to: :@view

  def initialize(view, company_id)
    @view = view
    @company_id = company_id
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.where(:company_id => @company_id).count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

private

  def data
    users.map do |user|
      [
        check_box_tag(user.id, 1, user.active, { :disabled => true }),
        link_to(user.first_name, edit_user_path(user)),
        link_to(user.last_name, edit_user_path(user)),
        link_to(user.email, edit_user_path(user)),
        link_to(image_tag('icons/cross.png'), user, :confirm => 'Remove this user from the system?', :method => :delete)
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.where(:company_id => @company_id).order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:sSearch].present?
      users = users.where("last_name like :search or first_name like :search", search: "%#{params[:sSearch]}%")
    end
    users
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[active first_name last_name email]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
