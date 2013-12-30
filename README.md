Right To Know
=============

Right To Know lets you make and browse Freedom of Information (FOI) requests in
Australia. It is powered by the open source FOI request platform
[Alaveteli](http://www.alaveteli.org/).

This repository contains the the theme package for Alaveteli for the Australian
deployment. If you find a problem with Right to Know, please report it to this
repository's
[issue tracker](https://github.com/openaustralia/righttoknow/issues).

Development
-----------

To get the most benefits from open source and be good open source citizens we
use [upstream Alaveteli](https://github.com/mysociety/alaveteli) and not a fork.
If there is a bug in the core software that can be shared by all we will make
the fix in our repository and open a pull request. In the vast majority of cases
we will not deploy a fix until it's been accepted upstream. This ensures we're
all using the same code as much as possible.

However if you'd like to adjust the look and feel of Right To Know, or to update
copy like that found on the help pages, this is the place to make those changes.

### Alaveteli Themes

The intention of Alaveteli's theming system is to support simple overlaying of
templates and resources without the need to touch the core Alaveteli software.

Typical usage should be limited to:

 * Putting CSS-based customisations in `public/stylesheets/custom.css`

 * Creating your own versions of non-functional pages (like "about
   us", at `lib/views/help/about.html.erb` -- and/or localised versions at
   lib/views/help/about.es.html.erb)

To install:

  ./script/plugin install git://github.com/openaustralia/righttoknow.git

Look in the lib/ folder of the plugin to see how the overrides happen.

Note that the `install.rb` plugin point sets up a symlink to include
local resource files within the Rails `public/` directory.

Contributing
------------

If you want to contribute an enhancement or a fix:

* Fork the project on GitHub.
* Make a topic branch from the production branch.
* Make your changes and test.
* Commit the changes without making changes to any files that aren't related to your enhancement or fix.
* Send a pull request against the production branch.
