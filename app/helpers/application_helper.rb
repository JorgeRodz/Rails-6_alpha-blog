module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow")
  end

  def render_flash_messages(name, msg)
    content = ""

    if name == "notice"
      content << "
        <div class='alert alert-success custom__alert-error alert-dismissible fade show' role='alert'>
        #{msg}
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
          <span aria-hidden='true'>&times;</span>
        </button>
      </div>"
    end

    if name == "alert"
      content << "
        <div class='alert alert-warning custom__alert-error alert-dismissible fade show' role='alert'>
        #{msg}
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
          <span aria-hidden='true'>&times;</span>
        </button>
      </div>"
    end

    content.html_safe
  end

  # To verify if a user is logged in

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
