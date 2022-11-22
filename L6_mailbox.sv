module test_mailbox;
  
  
  class packet;
    rand bit [3:0] addr;
    rand bit [3:0] data;
    
    function void display(input string message);
      $display("..............................");
      $display("\t %s, message");
      $display(\t Data = %0d, Address = %0d, data, addr);
      $display("...............................");
    endfunction: display
    
    
    function void post_randomize();
      this.display("Randomized data");
    endfunction: post_randomize
    
  endclass: packet
  
  
  class generator;
    
    packet gen_pkt_h;
    
    mailbox #(packet) gen2drv;
    
    function new(mailbox #(packet) gen2drv);
      this.gen2drv = gen2drv;
    endfunction: new
    
    task start();
      fork
        repeat(10)
          begin
            gen_pkt_h = new;
            assert(gen_pkt_h.randomize());
            gen2drv.put(gen_pkt_h);
          end
      join
    endtask: start
    
  endclass: generator
  
  
  class driver;
    
    packet drv_pkt_h;
    
    mailbox #(packet) drv4gen;
    
    function new(mailbox #(packet) drv4gen);
      this.drv4gen = drv4gen;
    endfunction: new
    
    task start();
      fork
        repeat(10)
          begin
            drv4gen.get(drv_pkt_h);
            drv_pkt_h.display("DATA IN DRIVER");
          end
      join
    endtask: start
    
  endclass: driver
  
  
  
  class env;
    mailbox #(packet) gen_drv = new;
    
    generator gen_h;
    driver drv_h;
    
    task build();
      gen_h = new(gen_drv);
      drv_h = new(gen_drv);
    endtask: build
    
    
    task start();
      gen_h.start;
      drv_h.start;
    endtask: start
  endclass: env
    
    
    
    initial
      begin
        env env_h=new;
        env_h.build();
        env_h.start();
      end
    endmodule
