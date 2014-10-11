module ProfilesHelper
  def displayed_user
    if @profile
      @profile.user
    else
      current_user
    end
  end
end
