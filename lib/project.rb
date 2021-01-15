require 'pry'

class Project
    attr_accessor :title

    @@all = []
    def initialize (title)
        @title = title
        # binding.pry
        @@all << self
    end

    def self.save
        @@all<<self
    end

    def add_backer(backer_instance)
        ProjectBacker.new(self,backer_instance)
    end

    def backers


        ProjectBacker.all.each_with_object([]) do |project, array|
            if project.project == self
                array << project.backer
            end
        end

        #other approaches 

        #this one works

        # projectbackers = []
        # ProjectBacker.all.each do |project|
        #     if project.project == self
        #         projectbackers << project.backer
        #     end
        # end
        # projectbackers

        #does not work
        # PorjectBacker.all.chunk{|project| project.project == self}

        #does not work
        # backed_projects = ProjectBacker.all.select {|project| project.project==self}
        # backed_projects.backer
    end

end