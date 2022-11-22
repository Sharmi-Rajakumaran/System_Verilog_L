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
        join
      $display("Completed for thread A: @%0t", $time);
      #30 $display("Thread_4 with delay: @%0t", $time);
    end
endmodule


/*
Start time: 15:05:59 on Nov 22,2022
qverilog ../tb/test_threads.sv
-- Compiling module test_threads

Top level modules:
        test_threads
# vsim -lib work work.test_threads -c -do "run -all; quit -f" -appendlog -l qverilog.log -vopt
# ** Note: (vsim-3812) Design is being optimized...
# //  Questa Sim
# //  Version 2022.1 linux Jan 29 2022
# //
# //  Copyright 1991-2022 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  QuestaSim and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# Loading sv_std.std
# Loading work.test_threads(fast)
# run -all
# Thread_1 with delay : @0
# Thread_2 with delay : @20
# Thread_3 with delay : @25
# Thread B1 with delay : @25
# Thread A2 with delay : @30
# Thread B2 with delay : @35
# Thread A1 with delay : @60
# Completed fork thread A : @60
# Thread_4 with delay : @90
#  quit -f
# End time: 15:06:00 on Nov 22,2022, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
~                         
*/
          
