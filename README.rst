Plone Awards
============

To run the buildout: 'make devel' (or: 'make production').

Steps to set up the site:

- add a Plone site with 'ploneawards policy' profile

- Configure a mail host.

- Create a NominationFolder 'Nominations'.

- Create a Collection that lists all items of type 'Nomination'. Additional
  criterion: state published; Sort on creation date, reversed. Hide this
  collection from navigation.

- Create a Page and name it 'Front page'; make it the site root default view.

- On the site root (NOT on the front page), add a carousel portlet that
  sources the collection.

- On the front page (NOT the site root) add a twitter portlet

- On the front page (NOT the site root) add a static portlet with the
  following HTML::

    <p>
        Let's celebrate the people who make the Plone community so awesome!
        Please submit your nominations to award that crazy developer, awesome
        documentation guru, personable IRC helper, or somebody else who's
        doing something special that deserves attention.
    </p>
    <div class="anon">
        <p>Please <a href="@@register">register a user login</a> to create nominations.</p>
        <p><a class="register" href="@@register">register</a></p>
    </div>
    <div class="member">
        <p>Once you're registered, you can head over to <a href="nominations">nominations</a> and add new nominations.</p>
        <p><a class="nominate" href="nominations/++add++ploneawards.contenttypes.nomination">nominate</a></p>
    </div>
