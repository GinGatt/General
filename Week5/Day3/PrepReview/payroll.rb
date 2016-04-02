class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      #returns weekly salary
      @hourly_rate * @hours_worked
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, yearly_salary)
        @name = name
        @email = email
        @yearly_salary = yearly_salary
    end

    def calculate_salary
      @yearly_salary/52
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, base_salary, overtime_rate, total_hours)
        @name = name
        @email = email
        @base_salary = base_salary
        @overtime_rate = overtime_rate
        @total_hours = total_hours
    end

    def calculate_salary
      @base_salary/52 + @overtime_rate*(@total_hours-40)
    end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end

  def pay_employees
      #Each weekly pay and the total amount spent on payroll this week. 
      #tax rate = 18%
      employees.each do ||
  end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
gin = HourlyEmployee.new('Gin', 'yumyum@example.com', 15, 50)
karen = HourlyEmployee.new('Karen', 'boom@example.com', 15, 50)

nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)

ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

employees = [josh, nizar, ted, gin, karen]
payroll = Payroll.new(employees)
payroll.pay_employees








