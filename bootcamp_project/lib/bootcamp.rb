class Bootcamp
  attr_reader :name, :slogan, :teachers, :students
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def hire (teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.size < @student_capacity
      @students << student
      return true
    end
    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.size / @teachers.size
  end

  def add_grade(student, grade)
    if @students.include?(student)
      @grades[student] << grade
      return true
    end
    false
  end

  def num_grades(student)
    @grades[student].size if @students.include?(student)
  end

  def average_grade(student)
    return nil unless @students.include?(student)

    grades = @grades[student]
    grades.empty? ? nil : grades.sum / grades.size
  end
end
