rjelierse.github.io
===================

Installation
------------
Check out the `build` branch:

    $ git clone git@github.com:rjelierse/rjelierse.github.io -b build

Install the NodeJS dependencies:

    $ npm install

Publishing
----------
On the `build` branch, generate the files for the GitHub Pages site:

    $ make release
    $ git commit release

Update the `master` branch by issuing a `git subtree push`:

    $ git subtree push -P release --squash origin master
    $ git push origin master
