# JDavis: This is a class to manage the json for the assignments_table.
#         See http://railscasts.com/episodes/340-datatables for an explanation of the code.
class AssignmentsDatatable
  delegate :params, :h, :link_to, :image_tag, :topic_assignment_path, :edit_topic_assignment_path, :best_in_place, to: :@view

  def initialize(view, topic_id)
    @view = view
    @topic_id = topic_id
    
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Topic.find(@topic_id).assignments.count,
      #iTotalDisplayRecords: assignments.total_entries,
      iTotalDisplayRecords: Topic.find(@topic_id).assignments.count,
      aaData: data
    }
  end

private

  def data
    assignments.map do |assignment|
      [
        (assignment[0] + " " + assignment[1]), 
        assignment[2],
        (best_in_place Assignment.find(assignment[4]), :manager, :type => :checkbox),
        link_to(image_tag('icons/cross.png'), topic_assignment_path(@topic_id, assignment[4]), 
          :confirm => 'Remove this user from participating in this topic?', :method => :delete)
        
      ]
    end
  end

  def assignments
    @assignments ||= fetch_assignments
  end

  def fetch_assignments
    sql = "select u.first_name as first_name, u.last_name as last_name, tg.name as name, a.manager as manager, a.id as assignment_id from users as u, topic_groups as tg, assignments as a where tg.topic_id = " + @topic_id.to_s + " and u.id = a.user_id and tg.id = a.topic_group_id order by u.last_name;"
    assignments = ActiveRecord::Base.connection.execute(sql)
    assignments = assignments.to_a
    assignments = Kaminari.paginate_array(assignments).page(page).per(per_page)
    
    if params[:sSearch].present?
      assignments = assignments.where("assignment[0] like :search or assignment[1] like :search", search: "%#{params[:sSearch]}%")
    end
    assignments
    
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[ last_name first_name email]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
