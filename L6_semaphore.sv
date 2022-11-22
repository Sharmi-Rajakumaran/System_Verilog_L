module test_semaphore;
  
  class driver;
    
    task send(input string var1);
      //Get key using sema handle
      sem.get(1);
      $display(" %s GOT KEY", var1)
      // put key using sem handle
      sem.put(1);
      $display("%s DROPPED KEY", var1);
    endtask: send
    
  endclass: driver
  
  driver drv[2];
  
  // Declare a handle for semaphore
  
  semaphore sem;
  
  initial
    begin
      drv[0] = new();
      drv[1] = new();
      
      sem = new(1);
      
      repeat (5)
        begin
          fork
            drv[0].send("DRIVER --1");
            drv[1].send("DRIVER --2");
          join
        end
    end
endmodule
  
      
      
      
