#
# # File related Commands
#
{c} = require '../../lib/colors'

module.exports = """
List files and directories in the current directory. Includes hidden files.

 #{c.b} ls -la FOLDERNAME#{c.x}

See how much disk space this VM has left.

  #{c.b}df -h#{c.x}

Find files on your VM.

  #{c.b}locate FILENAME#{c.x}

Find phrases within files, on your vm.

  #{c.b}grep -r PHRASE#{c.x}

See the permissions of the given file or folder.

  #{c.b}stat -c %a FILE OR FOLDER#{c.x}
"""
