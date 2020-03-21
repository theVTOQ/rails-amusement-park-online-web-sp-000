module AttractionsHelper
  def prefix
    current_user_is_admin ? "Show" : "Go on"
  end

  #def show_interaction_handler
  #  if current_user_is_admin
  #    link_to "Edit Attraction", "attractions/edit"
  #  else
  #    form_tag url: rides_path  do |f|
  #      f.hidden_field :user_id, @user.id
  #      f.hidden_field :attraction_id, @attraction.id
#
#        f.submit "Go on this ride"
#      end
#    end
#  end

  def current_attraction
    Attraction.find_by(id: params[:attraction_id])
  end

  #def appropriate_path
  #  current_attraction.nil? ? attractions_path : attraction_path(current_attraction)
  #end

  def appropriate_submit_message
    return "Update Attraction" if params[:action] == "edit"
    return "Create Attraction" if params[:action] == "create"
  end
end
