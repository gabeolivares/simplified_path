#!/usr/bin/env ruby

# Given a string path, which is a relative path (starting with a slash '/') to a file or directory in a Unix-style file system, convert it to the simplified canonical path.

# In a Unix-style file system, a period '.' refers to the current directory, a double period '..' refers to the directory up a level, and any multiple consecutive slashes (i.e. '//') are treated as a single slash '/'. For this problem, any other format of periods such as '...' are treated as file/directory names.

#  The canonical path should have the following format:

#  - The path starts with a single slash '/'.
#  - Any two directories are separated by a single slash '/'.
#  - The path does not end with a trailing '/'.
#  - The output path only contains the directories on the path from the root directory to the target file or directory (i.e., no period '.' or double period '..')

#  Return the simplified canonical path.

# "..//x/y/z/" => /x/y/z
# "...//./../x/" => /x
# “/x//y/../z” => /x/z
# "..//x/y/z/" => /x/y/z
# "/x/y/../z" => /x/z
# "...//./../x/" => /x
# "...//./x/" => /.../x

# .. pop
# . do nothing
# // - turn these into /
# ... treat as file name

def simplified_path(path_string)
 simplified_path = []
 array_split = path_string.split('/')

 array_split.each do |char|
   next if char == '.' || char == ""

   if char == ".." && simplified_path.last != nil
     if simplified_path.last != '' && char == '..'
       simplified_path.pop
     else
       simplified_path << char
     end
   else char == "..."
      simplified_path << "/#{char}" if char != ".."
   end

 end


 puts simplified_path.join("")
end

simplified_path("...//./x/")
