
module test_inheritance;

    
        class account_base;
    
                int balance = 2000;

                // In the function summary_base ,return balance
                function int summary_base();
                        return balance;
                endfunction: summary_base

    
                task deposit(input int pay);
                        balance = balance + pay;
                endtask: deposit

        endclass: account_base

        // Extend class account_extd from account_base;
        class account_extd extends account_base;
                int balance = 3000;
    
                function int summary_extd();
                        balance = super.balance + balance;
                        return balance;
                endfunction: summary_extd

        endclass: account_extd

    
        account_extd acc_h;

   initial
           begin
                   acc_h = new;

                   acc_h.deposit(8000);
                   $display("Total balance now is %0d", acc_h.summary_base());
    
                   $display("Total balance in the extended and base class together is %d", acc_h.summary_extd);
           end 
 
endmodule : test_inheritance


/*
Simulation Result:

Total balance now is 10000
# Total balance in the extended and base class together is       13000

*/
                                      
