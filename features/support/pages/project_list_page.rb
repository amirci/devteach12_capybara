class ProjectListPage
    include PageObject
    
    def navigate
      visit('/projects')
      self
    end
    
    def edit(project)
      project_context(project) do
        click_link("Edit")
      end
      ProjectEditPage.new
    end

    def delete(project)
      project_context(project) do
        evaluate_script('window.confirm = function() { return true; }')
        click_link("Delete")
      end
    end
    
    def active?(project)
      project_context(project) do
        find("td:nth-child(3)").text.should == 'true'
      end
    end
    
    def find_project_by_name(project_name)
      projects.select { |p| p.name == project_name }.first
    end
    
    def projects
      all(:css, "#projects tbody tr").
        map { |r| r.all(:css, 'td').map(&:text) }.
        map { |cells| {name: cells[0], description: cells[1], active: cells[2] == 'true'}}
    end
    
    def project_context(project, &block)
      within("tr[data-id='#{project.id}']", &block)
    end
end

