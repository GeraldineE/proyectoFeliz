class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all
    render :index
  end

  # vamos a crear un metodo para buscar
  def search
    @courses = Course.where("title LIKE '%#{params[:query]}%' OR description LIKE '%#{params[:query]}%' ")

    # Esto seria igual a SELECT * FROM Courses WHERE title LIKE '%boring%' OR description LIKE '%boring%'
    # se puede usar el where tambien por que permite ingresar todo el query como string, ideal para un buscador
    # cousrs va a guardar el resultado de la busqueda usando LIKE para decir
    # todos los cursos cuyo titulo contengan el valor del parametro query
    render :index
    # retulizaremos la misma vista
  end

end
