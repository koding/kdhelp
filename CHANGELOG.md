# 0.1.6 /

- Added Troubleshoot Framework
- Added Async Support for Exports. You can still export a string like normal,
  but if you export a function it will be called, with the expectation of a
  it being called back with a string. As an example:

  ```CoffeeScript
  module.exports = (print) ->
    setTimeout (-> print 'Some Help'), 1000
  ```
- Added apache status checking to troubleshooting.
- Added MySQL Troubleshooting
- Added FTPd Troubleshooting

# 0.1.5 / 2013-12-19

- Added Web Help
- Added Mining "Help"
- Added Privacy and TOS Help
- Added Help List
- Added SSH Help Item
- Added Cron Help
- Linked to Github for the latest version of Copy. -- Why? Well, copy-mode is
  important, and it's sort of a mess right now. This is a temporary fix.

# 0.1.4 / 2013-12-02

- Added phpmyadmin help.

# 0.1.3 / 2013-12-01

- One word typo. Grr

# 0.1.2 / 2013-12-01

- Changed the wording a bit in preparation for going live.

# 0.1.1 / 2013-11-28

- Added some early drafts for various help topics.
- Adjusted Suggest to iterate through all of the available choices to produce
  better results.
- Added Placeholders
- Fixed Padding

# 0.1.0 / 2013-11-27

- Added userdata, see README#Userdata for additional information.

# 0.0.3 / 2013-11-27

- Added npmignore

# 0.0.2 / 2013-11-27

- Added kdhelp to npm
