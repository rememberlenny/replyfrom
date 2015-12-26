class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    to = @email.to[0][:email]
    if @email.headers && !@email.headers["X-Forwarded-To"].nil?
      to = @email.headers["X-Forwarded-To"]
    end
    Email.create(
      to: to,
      from: @email.from[:email],
      subject: @email.subject,
      raw_text: @email.raw_text,
      raw_html: @email.raw_html,
      raw_body: @email.raw_body,
      body: @email.body,
      headers: @email.headers.to_json,
      # forwarded: @email["X-Forwarded-To"],
    )
    # pry
    puts "Done"
  end
end
