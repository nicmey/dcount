class Walk < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user

  def bonus?
    ['drizzle', 'rain', 'snow'].include? weather
  end

  def bonus_pct_value
    case weather.downcase
      when 'drizzle'
        return "Bruine +15%!"
      when 'rain'
        return "Pluie +30%!"
      when 'snow'
        return "Neige +50%!"
    end
  end

  def add_weather_bonus
    bonus = 1
    case weather.downcase
      when 'drizzle'
        bonus = 1.15
      when 'rain'
        bonus = 1.3
      when 'snow'
        bonus = 1.5
    end
    self.update(duration: (duration*bonus).round) if bonus > 1
  end

end
