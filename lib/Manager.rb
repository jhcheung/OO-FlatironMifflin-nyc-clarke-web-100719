class Manager
    attr_accessor :name, :department, :age

    @@all = []

    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        self.class.all << self
    end

    def employees
        Employee.all.select { |employee| employee.manager == self }
    end

    def hire_employee(name, salary)
        Employee.new(name, salary, self)
    end

    def self.all_departments
        self.all.map { |manager| manager.department }
    end

    def self.average_age
        self.all.reduce(0) { |total, manager| total + manager.age } / self.all.size.to_f
    end

    def self.all
        @@all
    end


end
