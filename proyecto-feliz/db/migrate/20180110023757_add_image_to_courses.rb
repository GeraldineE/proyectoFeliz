class AddImageToCourses < ActiveRecord::Migration[5.1]
  def up
    add_attachment :courses, :picture
  end
end

# Esto agregara las columnas necesarias para tener la columna y el campo imagen
