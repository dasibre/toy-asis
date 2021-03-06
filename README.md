toy-asis
========

Toy Author Status Inquiry System - A coding exercise for software developer candidates

### Requirements

* A running MongoDB Server (http://www.mongodb.org) - Install if necessary.
* RVM (http://rvm.io)

### Setup Instructions

* Clone the repo
* Use RVM to switch to ruby 1.9.3
* Install the bundle (bundler)
* Seed the database ```rake db:setup``` - The database is populated with the following manuscript from ```db/seeds.rb``` via Mongoid.
  <pre>
    Manuscript.create(code: 'AA1001', title: 'My awesome paper', status: 'WITH_AUTHOR', :status_date => Date.parse('01Jan2014')) do |m|
      m.authors << Author.new(publish_name: 'Smith,Joe')
      m.authors << Author.new(publish_name: 'Li,Wen')
      m.authors << Author.new(publish_name: 'Jones,Ben')
    end
  </pre>

### Specifications

We want to implement a simple author inquiry system for authors to view the status of their submitted manuscripts.
Fix the link on the welcome page so that when clicked, the author sees a form that allows him/her to input a code and an author
name. When submitted, if the name matches an acceptable author on the specified manuscript, they should be shown a page that displays
the title, status, and authors of the manuscript. If the inputs are invalid, the form page should be re-rendered (inputs intact)
with a "No match" message.

The specified author name must match the last name of one of the first 3 authors on the specified manuscript to be accepted.

The project already includes ```Manuscript``` and ```Author``` models. Use ```Manuscript.find_by_code``` and
```Author#last_name``` to implement the above.

Below are the specifications/rules for the name matching:

* ignore surrounding whitespace and case
* accept match on first 3 chars (e.g. Jon for Jones)
* reject match on less than 3 chars (e.g. Jo for Jones)
* accept exact match for 2 char author name (e.g. Li for Li)
* reject exact match on 1 char author name
* reject mismatch on chars beyond 3 (e.g. reject Jonis for Jones)


