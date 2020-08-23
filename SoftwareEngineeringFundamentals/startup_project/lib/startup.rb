require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  attr_writer :salaries
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.key?(title)
  end

  def >(other_startup)
    @funding > other_startup.funding
  end

  def hire(name, title)
    raise unless valid_title?(title)

    @employees << Employee.new(name, title)
  end

  def size
    @employees.size
  end

  def pay_employee(employee)
    payment = @salaries[employee.title]
    raise if payment > @funding

    employee.pay(payment)
    @funding -= payment
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    total_salaries = @employees.reduce(0) { |acc, employee| acc + @salaries[employee.title] }
    total_salaries / @employees.size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each do |title, salary|
      @salaries[title] = salary unless @salaries[title]
    end
    @employees += other_startup.employees
    other_startup.close
  end
end
