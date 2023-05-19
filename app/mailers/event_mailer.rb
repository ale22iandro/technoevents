class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.name
    @event = event

    # Берём у юзер его email
    # Subject тоже можно переносить в локали
    mail to: event.user.user_email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый комментарий @ #{event.title}"
  end
end