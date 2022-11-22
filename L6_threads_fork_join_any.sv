module test_threads;
  initial

    begin
      $display("Thread_1 with delay @ %0t", $time);
      #20 $display("Thread_2 with delay @ %0t", $time);
        fork: A
        // Thread A1 will be started at time t = 20
          #40 $display("Thread A1 with delay @%t",$time); // longest thread
              
          begin: B // Thread B with a delay of 15
            #5 $display("Thread B1 with delay: @ %0t", $time);
            #10 $display("Thread B2 with dealy: @ %0t", $time);
          end: B
          #5 $display("Thread_3 with delay: @ %0t", $time);
          // Shortest thread
        join_any
      
      // disable A;
      $display("Completed for thread A: @%0t", $time);
      #30 $display("Thread_4 with delay: @%0t", $time);
    end 
endmodule


/*

Output of fork join_any without disable 

# Thread_1 with delay @ 0
# Thread_2 with delay @ 20
# Thread B1 with delay: @ 25
# Thread_3 with delay: @ 25
# Completed for thread A: @25
# Thread B2 with dealy: @ 35
# Thread_4 with delay: @ 55
# Thread A1 with delay @ 60

Output of fork join_any with disable 
# Thread_1 with delay @ 0
# Thread_2 with delay @ 20
# Thread B1 with delay: @ 25
# Thread_3 with delay: @ 25
# Completed for thread A: @25
# Thread_4 with delay: @55

*/
