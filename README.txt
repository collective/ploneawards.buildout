Plone Awards
============

To run the buildout: 'make'.

Steps to set up the site:

- add a Plone site with 'ploneawards policy' profile

- configure a mail host

- Create a nominationfolder 'nominations'

- Create a collection that lists all items of type 'Nomination'. Additional criterion: state published. Hide this collection from navigation.

- On the siteroot (NOT on the first page), add a carousel portlet that sources that collection

- On the first page (NOT the siteroot) add a twitter portlet

- On the first page (NOT the siteroot) add a static portlet with the following html:

<p>Please <a href="@@register">register a user login</a> to create nominations.</p>
<p><a class="register" href="@@register">register</a></p>
<p>Once you're registered, you can head over to <a href="nominations">nominations</a> and add new nominations.</p>
<p><a class="nominate" href="nominations/++add++ploneawards.contenttypes.nomination">nominate</a></p>
