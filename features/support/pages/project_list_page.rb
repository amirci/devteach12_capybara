class ProjectListPage
    include PageObject
    
    def navigate
      visit('/projects')
      self
    end
    
    def edit(project)
      row = find(:xpath, "//td[.='#{project.name}']")
      row = click_link('Edit')
      ProjectEditPage.new
    end
    
    def projects
      all(:css, "#projects tr").
        drop(1). #drop the header
        map { |r| r.all(:css, 'td').map { |node| node.text } }.
        map { |r| { name: r[0], description: r[1], active?: r[2] == 'true' } }
    end
end
