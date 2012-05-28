class ProjectListPage
    include PageObject
    
    def navigate
      visit('/projects')
      self
    end
    
    def edit(project)
      row = find(:xpath, "//td[.='#{project.name}']")
      row.parent.click_link('Edit')
      ProjectEditPage.new
    end
    
    def find_project_by_name(project_name)
      projects.select { |p| p.name == project_name }.first
    end
    
    def projects
      all(:css, "#projects tr").
        drop(1). #drop the header
        map { |r| r.all(:css, 'td').map(&:text) }.
        map { |r| Project.new(name: r[0], description: r[1], active: r[2] == 'true') }
    end
end

