#encoding: utf-8
desc "Restart app"
task :update_feed => :environment do
    puts "Start"
      partner = Partner.all
    puts "Partners: #{partner.count}"
end
