module test_polymorphism;


        class packet_c;

                task send();
                        $display("Sending Base Class Packet");
                endtask: send


                class badpacket_c extends packet_c
                        
                        task send();
                                $display("Sending Derived class packet");
                        endtask: send
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

