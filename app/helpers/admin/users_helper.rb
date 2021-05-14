module Admin::UsersHelper
    def get_bg(user)
        user.is_admin ? "admin-bg" : "non-admin-bg"
    end
end
