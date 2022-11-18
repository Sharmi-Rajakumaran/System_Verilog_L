module test_polymorphism;


        // In class packet_c

                // In task send
                        // Display message "Sending base class packet"



        // Extend badpacket_c from packet_c

                // Override task send
                        // Display message "Sending derived class packet"



        // Within initial
                // Create instances for badpacket_c and packet_c 

                // Call send tasks using base and extended class handles

                // Assign extended class handle to base class handle

                // Call send task using base class object




endmodule
