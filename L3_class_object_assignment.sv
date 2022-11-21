



module test_obj_assignment;


        // Declare class packet
class packet;
                // Within the class packet
                // Declare the below class properties
                // data (bit type, size 4)
                // addr (bit type, size 16) 
                // mem  (bit type, size 16)

bit [3:0]data;
bit [15:0]addr;
bit [15:0]mem;

        endclass: packet

        // Declare two handles for the packet class "pkt_h1" and "pkt_h2"

packet pkt_h1,pkt_h2;
        // Within initial block
        initial
                begin
                  pkt_h1 =new();
                // Construct pkt_h1 object

                // Assign random values to the addr, data and mem of pkt_h1 object
                pkt_h1.addr = 500;
                pkt_h1.data = 1000;
                pkt_h1.mem = 1000;
                // Display the object pkt_h1
                 $display("\n PACKET_1  %p", pkt_h1);
                // Assign pkt_h1 to pkt_h2
                pkt_h2 = pkt_h1;
                $display("\nAfter assigning one object to the other,");




                $display("After changing the values of properties with one handle,");
                $display("\t PACKET_1 %p", pkt_h1);

                $display("\t PACKET_1 %p", pkt_h2);
                // Display the objects pkt_h1 & pkt_h2

/// Make changes to address and data using handle pkt_h2
pkt_h2.addr = 300;
pkt_h2.data=1000;
                // Display the object pkt_h1 & pkt_h2
                $display("\t PACKET_1 %p", pkt_h1);
                $display("\t PACKET_2 %p", pkt_h2);

                // observe that pkth1 and pkth2 will display the same contents because,
                // both the handles point to the same object
        end
endmodule


/*
Simulation Result:

#  PACKET_1  '{data:8, addr:500, mem:1000}
# 
# After assigning one object to the other,
# After changing the values of properties with one handle,
# 	 PACKET_1 '{data:8, addr:500, mem:1000}
# 	 PACKET_1 '{data:8, addr:500, mem:1000}
# 	 PACKET_1 '{data:8, addr:300, mem:1000}
# 	 PACKET_2 '{data:8, addr:300, mem:1000}
*/
