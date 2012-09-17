Plone Awards
============

To run the buildout: 'make'.

Steps to set up the site:

- add a Plone site with 'ploneawards policy' profile
- create a 'nominations' normal folder, add nomination folders there per category
- create a collection that lists all items of type 'Nomination'
- on the siteroot (NOT on the first page), add a carousel portlet that sources that collection
- on the first page (NOT the siteroot) add a twitter portlet
