# CSE_Dashboard

Web application dashboard for TAMU CSE Students, Student Bodies and Administrators

To get started:

0. [Setup a Cloud9
environment](https://github.com/saasbook/courseware/wiki/Setting-up-Cloud9)

0. Fork this repo to your GitHub account, then in your Cloud9 terminal, type the following command to clone your fork to your development workspace: `git clone git@github.com:your_github_username/cse-dashboard.git`
  
0. Then `cd cse-dashboard/` to change to the app's
directory.

0. Run the command `bundle install --without production` to make sure all the gems
(libraries) used by the app are in place.

0. Run `bundle exec rake db:setup` to create the initial database.

0. Run `rails server -p $PORT -b $IP` to start the app.  Cloud9 will pop
up a window showing the URL to visit in your browser to interact with
the running app.
