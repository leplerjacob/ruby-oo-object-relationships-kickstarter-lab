require 'pry'

class Backer

    attr_reader :name
    
    def initialize(name)
        @name = name
    end

    def back_project (project_instance)
        ProjectBacker.new(project_instance, self)
    end

    def backed_projects
        # binding.pry
        backedprojects = []
        ProjectBacker.all.each do |project|
            if project.backer == self
                backedprojects << project.project
            end
        end
        backedprojects
    end

end