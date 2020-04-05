home automation
(commands for ubuntu)

1. Install GPG key 
   gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

2. Download the ruby version manager using following commands
   sudo apt-get install software-properties-common
   sudo apt-add-repository -y ppa:rael-gc/rvm
   sudo apt-get update
   sudo apt-get install rvm
   echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc

//A lot of changes were made (scripts that needs to be reloaded, you're now member of rvm group) and in order to properly get all them working, you need to reboot (in most cases a logout/login is enough, but in some Ubuntu derivatives or some terminal emulators, a shell login is not performed, so adviced to reboot).

   rvm install ruby

3. You need to check wether rvm is installed or not
rvm -v

4. Now we need to install ruby(2.7.0) using rvm
   rvm install ruby-2.7.0
   rvm --default use ruby-2.7.0
   rvm gemset use global

//check if ruby is installed 
   ruby -v

5. You first need to add the project(home_automation) at a path something like "/home/ruby/home_automation"
   gem install bundler:2.1.4 --default

6. Now we need to install all the gems required to support our application
   bundle install

7. Now you need to update the project path in projects file(en.yml). 
  7.1 You need to go to the project folder.
      home_automation -> config -> locales -> en.yml
  7.2 Update path_start of the file.
      ruby /your_path/home_automation/automatic_controller.rb start
  7.3 Update path_stop of the file.
      ruby /your_path/home_automation/automatic_controller.rb start
  7.4 Update env of the file.
      /your_path/home_automation/config/environment

8. Now we need to set up and start our Database i.e MySql due to its following features - Data Security, on-Demand Scalability, High Performance, Round-the-clock Uptime, Comprehensive Transactional Support,  The Flexibility of Open Source.
   mysql -u root -p
   // when password is popped add 12345 as password
   //we need to start mySql server now 
   mysql.server start

9. Now we need to create a database and migrate it 
   rake db:create
   rake db:seed

10. Now you need to have a admin user to login
    rake db:seed

    //This will create a admin user with credentials
    Username - Signzyuser
    Password - Signzy

11. Now we need to start rails server 
    rails s

12. To see database entries you can do 
    rails c

    //you can take a look at created enteries as (Control.all, AdminUser.first)

13. Your web console will be running on "localhost:3000" in browser window 

14. For checking test case we can do following
    sudo apt install ruby-railties
    rake db:create RAILS_ENV=test
    rake db:migrate RAILS_ENV=test
    rails test

    //all test cased will run

15. You can check logs for background jobs which will tell wether any device is in on state at this time
    process -> automatic.rb.output
