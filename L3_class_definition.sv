 
module test_class_defn;


        // Declare class account_c
        class account_c;
                // Within class account_c
    
                // Declare variable balance as int type
                int balance;

                // Write a function summary that returns balance from it
                 function int summary();
                        return balance;
                 endfunction: summary

                // Write a task deposit with pay (type int) as the input argument and add pay with the balance
               task deposit(input int pay);
                       balance = balance + pay;
               endtask:deposit 
endclass: account_c

                account_c acnt_h;
          initial
                begin
int k;
                acnt_h = new();
    
                acnt_h.deposit(5000);
                k = acnt_h.summary();   
                 $display("The balance is %d", acnt_h.summary());
                 $display("The balance is %d", acnt_h.balance);
                // Call method deposit and pass pay value as the input argument and call method summary to display balance
                end    
endmodule
          
          
          /*
          
          Simulation Result:
          # The balance is        5000
          # The balance is        5000
          */
