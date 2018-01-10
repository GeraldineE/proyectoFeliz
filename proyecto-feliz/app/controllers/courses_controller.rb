class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all
    render :index
  end

  def new # estamos cranod un metodo para tener la vista del formulario nuevo
    @course = Course.new # creamos un nuevo curso y lo guardamos en la variable @course
    render :new # mostramos la vista new
  end

  # ya esta el metodo nuevo, pero falta el que guarda :)

  def create
    @course = Course.new(course_params) # crea un curso con todos los parametros que le envia el formulario
    @course.save
    @courses = Course.all
    render :index

  end

  # Ok, ahora hay un concepto complejo, se introdujo enrails 4
  # todo parametro debe ser protegido para evitar inyeccion de codigo?

  # es una forma de atacar una web :) cuando te coja el mouse asi es poruqe voy a escribirte
  # :D @}---
  # ahora no es imporatnte entender como funciona solo saber que lineas agregar

  # vamos a crear un metodo para buscar
  def search
    @courses = Course.where("title LIKE '%#{params[:query]}%' OR description LIKE '%#{params[:query]}%' OR Level LIKE '%#{params[:query]}%'  ")

    # Esto seria igual a SELECT * FROM Courses WHERE title LIKE '%boring%' OR description LIKE '%boring%'
    # se puede usar el where tambien por que permite ingresar todo el query como string, ideal para un buscador
    # cousrs va a guardar el resultado de la busqueda usando LIKE para decir
    # todos los cursos cuyo titulo contengan el valor del parametro query
    render :index
    # retulizaremos la misma vista
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :Level, :picture)
  end

end
