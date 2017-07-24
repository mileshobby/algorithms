def sleep_two_seconds
  puts "starting funct1 at #{Time.now}"
  sleep(3)
  puts "done with funct1 at #{Time.now}"
end

def sleep_one_second
  puts "starting funct2 at #{Time.now}"
  sleep(1)
  puts "done with funct2 at #{Time.now}"
end


# t1 = Thread.new { sleep_two_seconds }
# t2 = Thread.new { sleep_one_second }
# t1.join
# t2.join

sleep_two_seconds
sleep_one_second
