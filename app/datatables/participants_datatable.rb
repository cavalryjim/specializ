# JDavis: This is a class to manage the json for the participants_table.
#         See http://railscasts.com/episodes/340-datatables for an explanation of the code.
class ParticipantsDatatable
  delegate :params, :h, :link_to, :image_tag, :topic_group_assignment_path, :submission_status_image, :assignment, to: :@view

  def initialize(view, topic_group_id, iteration_id)
    @view = view
    @topic_group_id = topic_group_id
    @iteration_id = iteration_id
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      #iTotalRecords: User.where(:company_id => @company_id).count,
      iTotalRecords: TopicGroup.find(@topic_group_id).participating_users.count,
      iTotalDisplayRecords: participants.total_entries,
      aaData: data
    }
  end

private

  def data
    participants.map do |participant|
      [
        
        #image_tag('icons/tick.png') if participant.submitted_list?(@iteration_id),
        submission_status_image(@iteration_id, participant),
        participant.first_name + " " + participant.last_name,
        participant.email,
        #if can? :manage, topic_group %>
        link_to(image_tag('icons/cross.png'), topic_group_assignment_path(@topic_group_id, assignment(@topic_group_id, participant)), 
          :confirm => 'Remove this user from participating in this topic?', :method => :delete)
      ]
    end
  end

  def participants
    @participants ||= fetch_participants
  end

  def fetch_participants
    participants = TopicGroup.find(@topic_group_id).participating_users.order("#{sort_column} #{sort_direction}")
    participants = participants.page(page).per_page(per_page)
    if params[:sSearch].present?
      participants = participants.where("last_name like :search or first_name like :search", search: "%#{params[:sSearch]}%")
    end
    participants
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
