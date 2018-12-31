module DashboardHelper
  def dog_face(hour)
    if hour.nil?
      image_tag("face6.png", width: "50px")
    elsif hour < 2
      image_tag("face1.png", width: "50px")
    elsif hour < 3
      image_tag("face2.png", width: "50px")
    elsif hour < 4
      image_tag("face3.png", width: "50px")
    elsif hour < 5
      image_tag("face4.png", width: "50px")
    elsif hour < 6
      image_tag("face5.png", width: "50px")
    else
      image_tag("face6.png", width: "50px")
    end
  end
end
