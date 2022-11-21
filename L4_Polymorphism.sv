module test_polymorphism;


        class packet_c;

                virtual task send();
                        $display("Sending Base Class Packet");
                endtask: send

        endclass: packet_c
                class badpacket_c extends packet_c;
    
                        task send();
                                $display("Sending Derived class packet");
                        endtask: send
       endclass: badpacket_c

         initial
                begin
                        badpacket_c bp_h =new;
                        packet_c pkt_h =new;
    
                        pkt_h.send();
                        bp_h.send();
    
                        pkt_h = bp_h;
                        pkt_h.send();
                end 
endmodule

/* Simulation Result with virtual keyword in parent class
# Sending Base Class Packet
# Sending Derived class packet
# Sending Derived class packet

Simulation Result with virtual keyword in parent class
# Sending Base Class Packet
# Sending Derived class packet
# Sending Base Class Packet

*/




