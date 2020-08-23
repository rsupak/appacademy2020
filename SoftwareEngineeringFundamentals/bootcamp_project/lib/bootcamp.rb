class Bootcamp
  attr_accessor :name, :slogan, :teachers, :students

  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    return false unless @students.size < @student_capacity

    @students << student
    true
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.size / @teachers.size
  end

  def add_grade(student, grade)
    return false unless enrolled?(student)

    @grades[student] << grade
    true
  end

  def num_grades(student)
    @grades[student].size
  end

  def average_grade(student)
    return unless enrolled?(student) && num_grades(student).positive?

    @grades[student].sum / @grades[student].size
  end
end
