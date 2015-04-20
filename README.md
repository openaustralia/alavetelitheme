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

The table below show what tag you need to use for each jurisdiction. Don't
forget to also add the appropriate category tag, described in the section
below, for the authority you're adding.

| Jurisdiction | Tag       |
|--------------|-----------|
| Federal      | `federal` |
| ACT          | `ACT`     |
| NSW          | `NSW`     |
| NT           | `NT`      |
| QLD          | `QLD`     |
| SA           | `SA`      |
| TAS          | `TAS`     |
| VIC          | `VIC`     |
| WA           | `WA`      |

### Categories

Public authority categories are configured in the Alaveteli admin interface.
This how we want Right To Know's categories organised:

#### Federal

| Title | Description | Tag |
|-------|-------------|-----|
| Agriculture | part of the Agriculture portfolio | `agriculture`
| Attorney-General | part of the Attorney-General portfolio | `attorney_general`
| Communications | part of the Communications portfolio | `communications`
| Defence | part of the Defence portfolio | `defence`
| Education and Training | part of the Education and Training portfolio | `education_and_training`
| Employment | part of the Employment portfolio | `employment`
| Environment | part of the Environment portfolio | `environment`
| Finance | part of the Finance portfolio | `finance`
| Foreign Affairs and Trade | part of the Foreign Affairs and Trade portfolio | `foreign_affairs_and_trade`
| Health | part of the Health portfolio | `health`
| Immigration & Border Protection | part of the Immigration & Border Protection portfolio | `immigration_and_border_protection`
| Industry and Science | part of the Industry and Science portfolio | `industry_and_science`
| Infrastructure and Regional Development | part of the Infrastructure and Regional Development portfolio | `infrastructure_and_regional_development`
| Prime Minister | part of the Prime Minister portfolio | `prime_minister`
| Social Services | part of the Social Services portfolio | `social_services`
| Treasury | part of the Treasury portfolio | `treasury`
| Veterans' Affairs | part of the Veterans' Affairs portfolio | `veterans_affairs`
| All Federal authorities | a Federal authority | `federal`

#### State and Territory

| Title | Description | Tag |
|-------|-------------|-----|
| ACT | an ACT authority | `ACT_state`
| New South Wales | a NSW authority | `NSW_state`
| Northern Territory | a Northern Territory authority | `NT_state`
| Queensland | a Queensland authority | `QLD_state`
| South Australia | a South Australian authority | `SA_state`
| Tasmania | a Tasmanian authority | `TAS_state`
| Victoria | a Victorian authority | `VIC_state`
| Western Australia | a Western Australian authority | `WA_state`

#### Local

| Title | Description | Tag |
|-------|-------------|-----|
| New South Wales | a NSW Council | `NSW_council`
| Northern Territory | a Northern Territory Council | `NT_council`
| Queensland | a Queensland Council | `QLD_council`
| South Australia | a South Australian Council | `SA_council`
| Tasmania | a Tasmanian Council | `TAS_council`
| Victoria | a Victorian Council | `VIC_council`
| Western Australia | a Western Australian Council | `WA_council`

### Adding more jurisdictions

When adding authorities for jurisdictions we don't yet cover we need to:

* Upload the new authorities (with the correct tags, see above)
* Add categories (see above)
* Update help and other text:
  * [https://www.righttoknow.org.au/help/unhappy#complaining](https://github.com/openaustralia/righttoknow/blob/338b2d26891b81f326fb5e4dda9a26861f01d2d5/lib/views/help/unhappy.html.erb#L58-L67)
  * [https://www.righttoknow.org.au/help/requesting#missing_body](https://github.com/openaustralia/righttoknow/blob/338b2d26891b81f326fb5e4dda9a26861f01d2d5/lib/views/help/requesting.html.erb#L59-L70)
  * [https://www.righttoknow.org.au/help/requesting#ico_help](https://github.com/openaustralia/righttoknow/blob/338b2d26891b81f326fb5e4dda9a26861f01d2d5/lib/views/help/requesting.html.erb#L265-L287)
  * [https://www.righttoknow.org.au/body/list/all](https://github.com/openaustralia/righttoknow/blob/338b2d26891b81f326fb5e4dda9a26861f01d2d5/lib/views/public_body/_list_sidebar_extra.html.erb#L1-L3)
