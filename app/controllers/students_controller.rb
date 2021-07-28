class StudentsController < ApplicationController

  def index
    # if params[:first_name].present?
    #   students = Student.all.find_by(first_name: params[:first_name])
    #   render json: students
    # elsif
    #   params[:last_name].present?
    #   students = Student.all.find_by(last_name: params[:last_name])
    #   render json: students
    # else
    #   students = Student.all
    #   render json: students
    # end
  end

  def index
    name = params[:name]
    students = if name 
      Student.by_name(name)
    else
      Student.all
    end
    render json: students
  end


  def self.by_name(name)
    students = self.arel_table
    self.where((students[:first_name].matches("%#{name}%")).or(students[:last_name].matches("%#{name}%")))
  end


  def show 
    student = Student.find(params[:id])
    render json: student 
  end

  def name_query 
    student = Student.find(params[:first_name])
    render json: student
  end

end
