
module test_inheritance;

        // In class account_base;
        class account_base;
                // Declare property balance int type and initialize with value 2000

                // In the function summary_base ,return balance




                // In the task deposit, 
                // Pass an input argument 'pay' of int type 
                // Add pay with previous balance

        endclass: account_base

        // Extend class account_extd from account_base;


        class account_extd extends account_base;
                // Declare property balance of int type and initialize with value 3000



                // In function summary_extd, return balance from extended class
                // the new value returned should be summation of base class balance and extended class balance 
                // Hint: use super to access the base class balance

        endclass: account_extd

        // Declare a handle for account_extd class as acc_h

        // Within initial block,

                        // Create an object for acc_h

                        // Pass the amount for the method deposit and 
                        // Call the method summary_base to display the base class balance





                        // Call method summary_extd to display balance
                        // Observe that the super.balance returns the base class balance




endmodule : test_inheritance
                                      
