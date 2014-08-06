This is a simple Social Recipe Sharing App taken from the <b>Rails 4 Application Development book</b>.

Compared with the original tutorial, this version features improved design with Bootstrap and additional controller and model tests with MiniTest.

To run:
<code>bundle install</code>
<code>rake db:create</code>
<code>rake db:migrate</code>
<code>rake db:seed</code>

The project is built with Rails 4.1.1 version and PostgreSQL database. The <code>rake db:seed</code> command is needed to populate the database with the prebuilt food types, as current version of the app does not allow to generate those programmatically.
