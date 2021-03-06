defmodule SetupPhoenix.UserMailer do
  @moduledoc """
    Mailer module for user specific mails
  """
  use SetupPhoenixWeb, :email

  alias SetupPhoenix.Accounts.User
  alias SetupPhoenix.Mailer

  def welcome_mail(conn, u = %User{email: email}) do
    Mailer.send_email_async(email, gettext("Welcome to SetupPhoenix"), "welcome.html", %{user: u})
    conn
  end

end
