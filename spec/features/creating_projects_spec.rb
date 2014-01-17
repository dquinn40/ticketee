require 'spec_helper'

feature 'Creating Projects' do
    before do 
        visit '/'

        click_link 'New Project'
    end

    scenario 'can create a project' do
        fill_in 'Name', with: 'TextMate 2'
        fill_in 'Description', with: 'A text-editor for OS X'
        click_button 'Create Project'

        expect(page).to have_content('Project has been created')

        project = Project.where(name: "TextMate 2").first

        expect(page.current_url).to eql(project_url(project))

        title = "TextMate 2 - Projects - Ticketee"
        expect(page).to have_title(title)
    end
<<<<<<< HEAD
   
    scenrio 'can not create a project without a name' do
   	click_button 'Create Project'

	expect(page).to have_content('Project has not been created.')
 	expect(page).to have_content("Name can't be blank")
    end
=======

    scenario "can not create a project without a name" do
        click_button 'Create Project'

        expect(page).to have_content("Project has not been created.")
        expect(page).to have_content("Name can't be blank")
    end

>>>>>>> 413cb804427bf98214c0b86283dee82cbda3df4d
end
