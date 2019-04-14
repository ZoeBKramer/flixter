Click [here](https://flixter-zoe-kramer.herokuapp.com/) to visit Flixter. 

# Flixter

### Overview

A web application, built with Ruby on Rails, that uses the Stripe API to allow users to enroll in courses. Users are also able to upload their own courses/lessons as well as photos and videos. This application utilizes jQuery so users are able to rearrange their courses without having to refresh the page. 

### Code Structure

**Models**: 

*Course Model* - This can be found in [`app\models\course.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/models/course.rb). This model handles the validations for entering in a new course. It also ties the course to the user that created it and allows it to have many sections and enrollments. We use the Carrierwave gem to handle the actual photo uploading, using AWS as our storage.

*Section Model* - This can be found in [`app\models\section.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/models/section.rb). This model ties the section to the course it was created under and allows it to have many lessons. We use the RankedModel gem to store the sections in the order that the user places them in. This creates the `next_section` method that is used within the lesson model. 

*Lesson Model* - This can be found in [`app\models\lesson.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/models/lesson.rb). This model ties the lesson to the section it was created under and uses the Carrierwave gem to handle video uploading, using AWS as our storage. We use the RankedModel gem to store the lessons in the order that the user places them in. This model uses the `next_section` method in the `next_lesson` method that it created. This allows the user to click onto the next lesson, if there is one. If there isn't another lesson in that section, it allows the user to click onto the next section, if there is one. 

*User Model* - This can be found in [`app\models\user.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/models/user.rb). This model allows the user to have many courses, images, enrollments, and enrolled courses. We use the devise gem in this model to handle user authentication. This model creates the `enrolled_in?` method to verify whether or not the user is enrolled in a specific course.

*Enrollment Model* - This can be found in [`app\models\enrollment.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/models/enrollment.rb). This model ties enrollment to a user and a course.

**Views**:

**Controllers**: 

*Courses Controller* - [`app\controllers\courses_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/courses_controller.rb)

* Index Method: Displays all the courses on the page.

* Show Method: Finds the course by ID.

*Lessons Controller* - [`app\controllers\lessons_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/lessons_controller.rb)

* `require_current_user_enrolled` Method: Authorizes that the current user logged in is enrolled in the course that the lesson is in. 

* Show Method: This method exsists so that the lessons show page can be rendered.  

*Enrollments Controller* - [`app\controllersenrollments_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/enrollments_controller.rb)

* Create Method: Enrolls a user into a course. If the course that the user is enrolling in is premium (costs money), it will bring up the Stripe payment screen.  

*Dashboards Controller* - [`app\controllers\dashboards_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/dashboards_controller.rb)

* Show Method: This method exists so that the dashboards show page can be rendered.  

*Static Pages Controller* - [`app\controllers\static_pages_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/static_pages_controller.rb)

* Index Method: Displays a random course on the index page. 

* Privacy Method: This method exists so that the privacy page can be rendered.

* Team Method: This method exists so that the team page can be rendered.

* Careers Method: This method exists so that the careers page can be rendered.

*Instructor Courses Controller* - [`app\controllers\instructor\courses_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/instructor/courses_controller.rb)

* New Method: Initializes the course object.

* Create Method: Adds a new course, if valid, into the database.

* Show Method: Initializes the section and lesson object.

* `require_authorized_for_current_course` Method: Authorizes that the current user logged in is the same user that created the course.

*Instructor Sections Controller* - [`app\controllers\instructor\sections_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/instructor/sections_controller.rb)

* Create Method: Adds a new section to the course, if valid, into the database.

* Update Method: Updates the section if the data entered is valid.

* `require_authorized_for_current_section` Method: Authorizes that the current user logged in is the same user that created the  section.

* `require_authorized_for_current_course` Method: Authorizes that the current user logged in is the same user that created the couse that the section is in. 

*Instructor Lessons Controller* - [`app\controllers\instructor\lessons_controller.rb`](https://github.com/ZoeBKramer/flixter/blob/master/app/controllers/instructor/lessons_controller.rb)

* Create Method: Adds a new lesson to the section in the course, if valid, into the database

* Update Method: Updates the lesson if the data entered is valid. 

* `require_authorized_for_current_lesson` Method: Authorizes that the current user logged in is the same user that created the lesson.

* `current_lesson` Method: Finds the lesson by ID.

* `require_authorized_for_current_section` Method: Authorizes that the current user logged in is the same user that created the section that the lesson is in.

**Gemfiles**:

[bootstrap gem](https://github.com/twbs/bootstrap-rubygem) - helps format the page

[simple-form gem](https://github.com/plataformatec/simple_form) - creates the form in which data can be entered into

[devise gem](https://github.com/plataformatec/devise) - we used this gem for the authentication of users

[carrierwave gem](https://github.com/carrierwaveuploader/carrierwave) - provides a simple and extremely flexible way to upload files from Ruby applications

[mini-magick gem](https://github.com/minimagick/minimagick) - MiniMagick gives you access to all the command line options ImageMagick has (found [here](http://www.imagemagick.org/script/command-line-options.php))

[figaro gem](https://github.com/laserlemon/figaro) - this gem secures sensitive information (ie. secret keys) by not pushing it to Github, only production 

[fog-aws gem](https://github.com/fog/fog-aws) - supports Amazon Web Services

[carrierwave-aws gem](https://github.com/sorentwo/carrierwave-aws) - officially supported AWS-SDK library for S3 storage rather than relying on fog

[stripe gem](https://github.com/stripe/stripe-ruby) - provides convenient access to the Stripe API from applications written in the Ruby language

[ranked-model gem](https://github.com/mixonic/ranked-model) - row sorting library built for Rails 3, 4 and 5

[jquery-ui-rails gem](https://github.com/jquery-ui-rails/jquery-ui-rails) - jQuery UI assets (JavaScripts, stylesheets, and images) for the Rails asset pipeline

[font-awesome-rails](https://github.com/bokmann/font-awesome-rails) - adds a library of icons that can be used in the application

# Set Up Vagrant

Click [here](https://github.com/university-bootcamp/coding-environment/blob/master/windows-vagrant.md) to find the instructions for setting up Vagrant.

### Vagrant

Between each of the coding sessions you do, especially if you restart your machine, you will need to run the following command to start your vagrant environment prior to connecting:

`vagrant up`

When this command completes, run the vagrant ssh command to log in to Vagrant.

After this completes, you will be taken to a coding environment inside your virtual machine, and your terminal should contain the green [ENV].

Running the `killall ruby` command in your terminal should quit all running Rails servers.

**To ensure that your server is not running** -— If you visit the URL [http://localhost:3030](http://localhost:3030) in your browser, you should not see a web page load. You should ensure that your server is not running before starting new server windows.

**If you want to preview the application that is running within your coding environment**—Visiting the [http://localhost:3030](http://localhost:3030) from your web browser will allow you to do this.

All the files within this folder inside the Vagrant environment will be automatically synced outside the Vagrant environment to folder inside the `coding-environment/src` folder that is located outside the virtual machine, usually on your Desktop.

# Set Up Flixter

### Checking Out the Repo

Check this repository out into your `coding-environment/src` folder. 

### Create the Initial Database

Connect to your Vagrant instance, change the directory `cd /vagrant/src/flixter`

Run `rake db:create`

### Starting Up Your Server

In a separate terminal, change the directory `cd /vagrant/src/flixter`

Start your server by running `rails server -b 0.0.0.0 -p 3000`

