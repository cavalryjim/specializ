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
      #iTotalRecords: User.where(:company_id => @company_id).count,
      iTotalRecords: Assignment.where(:topic_group_id => TopicGroup.where(:topic_id => @topic_id)).count,
      iTotalDisplayRecords: assignments.total_entries,
      aaData: data
    }
  end

private

  def data
    assignments.map do |assignment|
      [ 
        link_to(assignment.user, edit_topic_assignment_path(@topic_id, assignment)),
        assignment.topic_group,
        best_in_place(assignment, :manager, :type => :checkbox),
        link_to(image_tag('icons/cross.png'), topic_assignment_path(@topic, assignment), 
          :confirm => 'Remove this user from participating in this topic?', :method => :delete)
      ]
    end
  end

  def assignments
    @assignments ||= fetch_assignments
  end

  def fetch_assignments
    #assignments = TopicGroup.find(@topic_group_id).participating_users.order("#{sort_column} #{sort_direction}")
    assignments = Assignment.where(:topic_group_id => TopicGroup.where(:topic_id => @topic_id))
    assignments = assignments.page(page).per_page(per_page)
    #if params[:sSearch].present?
    #  participants = participants.where("last_name like :search or first_name like :search", search: "%#{params[:sSearch]}%")
    #end
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
