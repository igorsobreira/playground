

def main(filename)
  file = File.new(filename)
  n = file.readline.to_i
  out = []

  (1..n).each do |ncase|
    exist, create = file.readline.split.collect! { |s| s.to_i }

    existing = []
    (1..exist).each do
      existing += split_paths file.readline.strip
    end
    
    created = 0
    (1..create).each do
      split_paths(file.readline.strip).each do |path|
        if not existing.include? path
          existing.push path
          created += 1
        end
      end
    end
    
    out << "Case ##{ncase}: #{created}"
    
  end

  file.close
  out.join "\n"

end

#
# Given a string like "/home/gcj/finals" return an array
# like ["/home", "/home/gcj", "/home/gcf/finals"
#
def split_paths(path)
  dir_list = path.split('/').drop(1) # drops the "" because of the first "/"
  path_list = ['/'+dir_list.first]
  dir_list.drop(1).each do |dir|
    path = path_list.last + '/' + dir
    path_list.push path
  end
  path_list
end

puts main 'example.in' if $0 == __FILE__
