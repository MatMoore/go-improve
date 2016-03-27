module ApplicationHelper
    def present_player(user)
        "#{user.display_name} #{user.rank}"
    end
end
