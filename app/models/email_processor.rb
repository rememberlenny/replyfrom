class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    to = @email.to[0][:email]
    original_to = nil
    if @email.headers && !@email.headers["X-Forwarded-To"].nil?
      original_to = to
      to = @email.headers["X-Forwarded-To"]
    end
    if to
      email_params['to'] = to
    end
    if original_to
      email_params['original_to'] = original_to
    end
    if @email.from[:email]
      email_params['from'] = @email.from[:email]
    end
    if @email.subject
      email_params['subject'] = @email.subject
    end
    if @email.raw_text
      email_params['raw_text'] = @email.raw_text
    end
    if @email.raw_html
      email_params['raw_html'] = @email.raw_html
    end
    if @email.raw_body
      email_params['raw_body'] = @email.raw_body
    end
    if @email.body
      email_params['body'] = @email.body
    end
    if @email.headers.to_json
      email_params['headers'] = @email.headers.to_json
    end
    Email.create(email_params)
    # pry
    puts "Done"
  end
end
