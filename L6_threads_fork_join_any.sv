module test_threads;
  initial
    begin
      $display("Thread_1 with dealy @ %0t" $time);
      #20 $display("Thread_2 with delay @ %0t", $time);
        fork: A
        // Thread A1 will be started at time t = 20
          #40 $display("Thread with delay @%t", $time); // longest thread
          
          begin: B // Thread B with a delay of 15
            #5 $display("Thread B1 with delay: @ %0t", $time);
            #10 $display("Thread B2 with dealy: @ %0t", $time);
          end: B
          #5 $display("Thread_3 with delay: @ %0t", $time);
          // Shortest thread
        join_any
      $display("Completed for thread A: @%0t", $time);
      #30 $display("Thread_4 with delay: @%0t", $time);
    end
endmodule
