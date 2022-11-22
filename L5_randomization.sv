module test_trans;
  
  class alu_trans_c;
    
    typedef enum {ARITH, SHIFT, LOGIC}OPERATION;
    
    rand logic [3:0] alu_sel_in;
    rand OPERATION rand_opr;
    
   // Conditional constraint 
    
    constraint SEL {rand_opr == LOGIC -> alu_sel_in inside {[0:5]};
                    rand_opr == SHIFT -> alu_sel_in inside {[6:9]};
                    rand_opr == ARITH -> alu_sel_in inside {[10:15]};}
    
    // distribution constraint - weight 2 to arithmetic operation
    
    constraint OPER{rand_opr dist{[ARITH:=2, SHIFT:=1, LOGIC:=1]};}

    function void post_randomize();
      $display("The randomized value of the enum data type rand_oper and alu_sel_in is %s and %d", rand_opr, alu_sel_in);
    endfunction
    
  endclass: alu_trans_c
  
  alu_trans_c trans_h;
    
  initial
    begin
      trans_h = new;
      
      for(int i =0; i < 10; i = i+1)
        begin
          assert(trans_h.randomize());
        end
    end
endmodule 
      
    
