#
# # File related Commands
#
module.exports = """
List files and directories in the current directory. Includes hidden files.

  ls -la FOLDERNAME

See how much disk space this VM has left.

  df -h

Find files on your VM.

  locate FILENAME

Find phrases within files, on your vm.

  grep -r PHRASE

See the permissions of the given file or folder.

  stat -c %a FILE OR FOLDER
"""
