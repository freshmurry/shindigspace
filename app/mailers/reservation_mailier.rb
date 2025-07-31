class ReservationMailer < ApplicationMailer
  def send_email_to_guest(guest, venue)
    @recipient = guest
    @venue = venue
    mail(to: @recipient.email, subject: "Thank you and enjoy!💯")
  end
end