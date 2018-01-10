class Course < ApplicationRecord

  # ahora le tenemos que decir al curso que tiene una imagen
  has_attached_file :picture # Esto le dice que tiene un campo de tipo imagen adjunta
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  # esto ultimo ahora no es importante :D
end
