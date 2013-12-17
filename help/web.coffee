# 
# # Web
#
module.exports = """
Koding VMs come with a web server already running for you. Any files put in to
the following folder:

  #{userdata.home}/Web

Can be viewed by visiting the following URL:

  #{userdata.vmDomain}

Apache will serve HTML, PHP, Python, Perl, and Ruby by default. Just place
your file into the Web directory, and visit it in your browser. Easy!

As always, additional help can be found on Koding University at:
  http://learn.koding.com
"""
