
# KDHelp

KDHelp is a simple help utility installed on Koding VMs for the purpose of
helping users. It occupies the `help` and `kdhelp` namespaces and exposes
all of the content found within the `./help` directory as a series of commands.

The help content provided is specific to Koding VMs.

## Installation

```
npm -g install kdhelp
```

Note that you shouldn't need to install this.. it comes with the Koding VMs.

## How to Contribute

Each file in the `./help` directory is mapped to a "command" for the help bin.
Subcommands can be achieved by creating a directory and providing an index file
for the main folder command, and named modules within that directory for
subcommands.

Internally, each file is a CoffeeScript module. It exports a string, as the
export object, and this is used as the contents for the help command.

Logic can be executed to provide dynamic help before the export, such as finding
the current user name to display the user directory or the login details
for FTP.

### Userdata

A global object `userdata` is exposed to all Help documents when being
imported. Below is an example object.

```JSON
{
  "home"        : "/home/exampleuser",
  "username"    : "exampleuser",
  "hostname"    : "vm-0.exampleuser.koding.kd.io",
  "vm"          : "vm-0",
  "userDomain"  : "exampleuser.kd.io",
  "vmDomain"    : "vm-0.exampleuser.kd.io"
}
```

With the CoffeeScript `"#{userdata.hostname}"` you can access the data. An
example usage of this is below:

```CoffeeScript
module.exports = """
Hello #{userdata.username}!

To view the contents of your /home/#{userdata.home}/Web directory
visit: #{userdata.vmDomain}
"""
```

### Disclaimer

Remember that we are installing this on all user VMs, so the help provided must
relate to all users, as well as be presented in a way that *all* users will
understand.

Too much information is bad information, so this project must stay on scope.
