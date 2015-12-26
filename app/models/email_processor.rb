class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Email.create(
      to: @email.to[0][:email],
      from: @email.from[:email],
      subject: @email.subject,
      raw_text: @email.raw_text,
      raw_html: @email.raw_html,
      raw_body: @email.raw_body,
      body: @email.body,
      # headers: @email.headers,
      # forwarded: @email["X-Forwarded-To"],
    )
    pry
    puts "Done"
  end
end
