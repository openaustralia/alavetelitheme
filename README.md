# Right To Know [![Stories in Ready](https://badge.waffle.io/openaustralia/righttoknow.svg?label=ready&title=Ready)](http://waffle.io/openaustralia/righttoknow)

[Right To Know](https://www.righttoknow.org.au/) lets you make and browse
Freedom of Information (FOI) requests in Australia. It is powered by the open
source FOI request platform [Alaveteli](http://www.alaveteli.org/).

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

To get a development copy up-and-running, follow the
[Alaveteli installation instructions](http://alaveteli.org/docs/installing/)
and then install this theme. You can read more about themes and how to install
them in the [Alaveteli documentation](http://alaveteli.org/docs/customising/themes/).

Contributing
------------

If you want to modify the customised look and feel of Right To Know then you
should edit this repository however if it's something more general you probably
want to edit the upstream
[core Alaveteli software](https://github.com/mysociety/alaveteli/).

To contribute an enhancement or a fix to this theme:

* Fork the project on GitHub.
* Make a topic branch from the `production` branch.
* Make your changes and test.
* Commit the changes without making changes to any files that aren't related to your enhancement or fix.
* Send a pull request against the `production` branch.

Authorities
-----------

A unique aspect of Right To Know compared to other Alaveteli installations is
that we're in the process of supporting 9 different jurisdictions - Federal and
all the states and territories.

We have customisations in this theme to adjust the length of time authorities
have to respond to a request and the law names depending on what jurisdiction
an authority is covered by. These customisations rely on the use of Alaveteli's
tags to work out what jurisdiction an authority is covered by.

This means you need to be careful when adding new authorities or they won't
correctly reflect the laws governing them. Not to worry though - it's just a
simple process of ensuring the
[correct tag](https://github.com/openaustralia/righttoknow/blob/ffa58902a01d5ddd3092c8ced533395668502f6d/lib/model_patches.rb#L9-L29)
from the table below is present on the authority:

| Jurisdiction | Tag                          |
|--------------|------------------------------|
| ACT          | `ACT_state`                  |
| NSW          | `NSW_state` or `NSW_council` |
| NT           | `NT_state` or `NT_council`   |
| QLD          | `QLD_state` or `QLD_council` |
| SA           | `SA_state` or `SA_council`   |
| TAS          | `TAS_state` or `TAS_council` |
| VIC          | `VIC_state` or `VIC_council` |
| WA           | `WA_state` or `WA_council`   |
