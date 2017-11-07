class SwarmCheckin

  attr_reader :json

  def initialize(json)
    @json = json
  end

  def id
    @json['id']
  end

  def created_at
    Time.at(@json['createdAt'].to_i)
  end

  def venue
    @json['venue']
  end

  def name
    venue['name']
  end

  def location
    venue['location']
  end

  def address
    location['address']
  end

  def city
    location['city']
  end

  def category
    venue['categories'].first['shortName']
  end

end



