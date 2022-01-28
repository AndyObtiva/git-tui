# Copyright (c) 2022 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

puts "== git-tui version #{File.read(File.expand_path('../../VERSION', __FILE__)).strip} =="

require 'tty-prompt'

def clean_branch_name(branch_name)
  branch_name.sub('* ', '').strip
end

git_branch_names = `git branch`.split("\n")
current_branch = clean_branch_name(git_branch_names.find {|l| l.start_with?('* ')})
puts "Current Git Branch: #{current_branch}"

begin
  prompt = TTY::Prompt.new
  git_branch = prompt.select("Choose Git Branch: ", git_branch_names, cycle: true, per_page: 40, filter: true)
  git_branch = clean_branch_name(git_branch)
  
  command = "git checkout #{git_branch}"
  
  File.write("#{Dir.home}/.git_command", command)
rescue TTY::Reader::InputInterrupt => e
  # No Op
  puts # a new line is needed
  puts "Staying at current (abort detected): #{CURRENT_RVM}"
end
