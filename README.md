# CSE_Dashboard

Web application dashboard for TAMU CSE Students, Student Bodies and Administrators

> A Running Instance can be seen at [CSE-DashBoard](https://polar-harbor-52142.herokuapp.com/)

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


## Deployment to Heroku

If you have deployed to Heroku before, just create a new app container with `heroku create`.  If this is your first time deploying to Heroku, you will need to do two things.  First, sign up for a free [Heroku account](http://heroku.com).  Then set up `ssh` keys to securely communicate with Heroku for app deployments.  The three basic commands you need are the following, but see the [Heroku page](https://devcenter.heroku.com/articles/heroku-cli) for more details.

```sh
$ ssh-keygen -t rsa
$ heroku login
$ heroku keys:add
```

Once your keys are set up (a one-time process), you should be able to create an "app container" on Heroku into which you'll deploy RottenPotatoes:

```sh
$ heroku create
```

Heroku will assign your app a whimsical name such as `luminous-coconut-237`; once your app is deployed, you would access it at `http://luminous-coconut-237.herokuapp.com`.  You can login to the Heroku website if you want to change the name of your app.

Finally, we deploy our app to Heroku:

```sh
$ git push heroku master
```

(You may see the  following warning the first time - it's fine---answer
"yes", and in the future you shouldn't see it anymore:)

    The authenticity of host 'heroku.com (50.19.85.132)' can't be established.
    RSA key fingerprint is 8b:48:5e:67:0e:c9:16:47:32:f2:87:0c:1f:c8:60:ad.
    Are you sure you want to continue connecting (yes/no)? 
    Please type 'yes' or 'no':

Is the app running on Heroku?  If you navigate to the heroku URL that is printed at the end of the results from `git push heroku master` you'll get a "We're sorry, but something went wrong." error in the browser.  

We can get a hint as to why by running the following command:

```sh
$ heroku logs
```

which will show an error like:

```
ActionView::Template::Error (PG::UndefinedTable: ERROR:  relation "movies" does not exist
```

Just as we ran `rake db:migrate` and `rake db:seed` to do first-time database creation locally, we must also cause a database to be created on the Heroku side:

```sh
$ heroku run rake db:migrate
```

and

```sh
$ heroku run rake db:seed
```

Now you should be able to navigate to your app's URL.  `heroku open` opens your browser to that URL in case you forgot it, however this command does not work on c9, where you will need to navigate to the relevant URL.
