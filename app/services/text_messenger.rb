class TextMessenger
  def initialize(number, url)
    @number = format_phone(number)
    @url = url
  end

  def deliver
    client = Twilio::REST::Client.new
    client.messages.create({
      from: '+15128293862',
      to: @number,
      body: "Hi, check out this awesome website: #{@url}"
    })
  end

  private

  def format_phone(number)
    Phony.normalize(number)
  end
end
