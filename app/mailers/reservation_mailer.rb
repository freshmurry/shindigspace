class ReservationMailer < ApplicationMailer
  def send_email_to_guest(reservation)
    @reservation = reservation
    @venue = reservation.venue
    @guest = reservation.user
    
    mail(
      to: @guest.email,
      subject: "Reservation Confirmation for #{@venue.name}"
    )
  end
end 