# CSE_Dashboard

Web application dashboard for TAMU CSE Students, Student Bodies and Administrators

> A Running Instance can be seen at [CSE-DashBoard](https://polar-harbor-52142.herokuapp.com/)

To get started:

1. [Setup a Cloud9
environment](https://github.com/saasbook/courseware/wiki/Setting-up-Cloud9)

2. Fork this repo to your GitHub account, then in your Cloud9 terminal, type the following command to clone your fork to your development workspace: `git clone git@github.com:your_github_username/cse-dashboard.git`
  
3. Then `cd cse-dashboard/` to change to the app's
directory.

4. Run the command `bundle install --without production` to make sure all the gems
(libraries) used by the app are in place.

5. Run `bundle exec rake db:setup` to create the initial database.

6. Run `rails server -p $PORT -b $IP` to start the app.  Cloud9 will pop
up a window showing the URL to visit in your browser to interact with
the running app.

> The Documentation can be found [here](https://github.com/pranoy-k/cse-dashboard/tree/master/docs)

> The Iterations Reports can be found [here](https://github.com/pranoy-k/cse-dashboard/tree/master/iterationReports)
## Deployment to Heroku

> The Code Climate analysis can be found [here](https://codeclimate.com/github/pranoy-k/cse-dashboard) 

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


## Deployment to CSE Servers

> Information is taken from the website: [CSE Web Pages](https://wiki.cse.tamu.edu/index.php/CSE_Web_Pages#Web_Project_Pages)

The following page provides detailed instructions on how to deploy to CSE Project Web Server.

Anyone with a CSE computer account has the ability to create a web site on the CSE project web server. Like your personal home page, the files for your site will be stored in your home directory on the departmental filer, and will count against your quota. The difference is that the project server allows dynamic dontent. You can activate this web site by creating a directory called web_project inside your home directory. Your home direcory must be world executable, so the web server can look through it, and the web_projectdirectory must be world readable and executable, and all files in it must be world readable:

cd ~
chmod o+x .
mkdir web_project
chmod 755 web_project
cd web_project
''...make files...''
chmod 744 *
chmod 755 *.pl

Once you create the directory, any files you place there will be accessible online at the following URL: http://projects.cse.tamu.edu/username/

This server has the following capabilities:

PHP: PHP is provided as an Apache module.
Perl: Perl scripts are executed using mod_perl.
SSI/HTML: Server-side includes and standard HTML files are served on the Apache webserver.
The following restrictions are placed on the project servers:

CSG may impose limits on project activities which affect system performance and/or restrict excessive traffic. These limits may be imposed without prior notice if needed to ensure server integrity. Users expecting high loads should coordinate their requirements with CSG .
Web server configurations are subject to change between semesters. While our goal is to provide stability throughout a semester, technology evolution means some changes should be expected. Security and other critical issues may mandate changes at any time. CSG will notify current users as soon as practical about changes.
These servers will not be poked through TAMU's firewall, so users wanting to access their pages outside of the tamu.edu domain will either need to use VPN software, or use a different server.

## Web hosting in TAMU Web Servers
Refer this page for more information, although this is not free
[Web Hosting and Mastering](http://it.tamu.edu/Websites_Applications_and_Software/Design_Development_and_Administration/Web_Hosting_and_Mastering/index.php)
