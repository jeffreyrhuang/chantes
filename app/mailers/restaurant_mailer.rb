class RestaurantMailer < ApplicationMailer
  def notification(review)
    @review = review
    mail to: 'user@example.com', subject: 'Notification'
  end
end
