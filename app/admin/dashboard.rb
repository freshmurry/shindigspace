ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    content do
      columns do
        column do
          panel "Site Statistics" do
            para "Total Users: #{User.count}"
            para "Total Venues: #{Venue.count}"
            para "Total Reservations: #{Reservation.count}"
            para "Total Reviews: #{Review.count}"
          end
        end
      end
    end

    # Debugging outputs
    para "User count: #{User.count.inspect}"
    para "Venue count: #{Venue.count.inspect}"
    para "Reservation count: #{Reservation.count.inspect}"
    para "Review count: #{Review.count.inspect}"
  end # content
end
