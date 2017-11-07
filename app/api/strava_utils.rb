class StravaUtils

  attr_accessor :strava_activity

  def initialize(strava_activity)
    @strava_activity = strava_activity
  end

  def payload
    strava_activity
  end

  def id
    strava_activity['id']
  end

  def name
    strava_activity['name']
  end

  def miles
    (strava_activity['distance'] * 0.000621371).round(1)
  end

  def elapsed_time
    Time.at(strava_activity['elapsed_time']).utc.strftime('%H:%M:%S')
  end

  def date
    Date.parse(strava_activity['start_date_local']).strftime('%B %d, %Y')
  end

end