namespace :projects do

  desc "Display projects and their current open tasks"
  task display: :environment do
    Project.all.each do |x|
      puts x.title
      x.items.each do |y| 
        puts "- [#{y.done && 'X' || ''}] #{y.action}"
      end
    end
  end

end
