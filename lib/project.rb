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
        # binding.pry
        projectbackers = []
        ProjectBacker.all.each do |project|
            if project.project == self
                projectbackers << project.backer
            end
        end
        projectbackers
    end

end