module test_deep_copy;


        // In class parity_calc_c

        class parity_calc_c;

                // Declare parity (bit type, size 8), initialize it with some random value
                  bit [7:0] parity = 40;
                // Write copy method that returns parity_calc_c class type
                function parity_calc_c copy();
                        // Create copy instance
                        copy = new;
                        // Copy all the current properties into copy object
                                copy.parity = this.parity;
                endfunction: copy

        endclass: parity_calc_c

        // In class packet_c

        class packet_c;

                // Declare header (bit type , size 8), initialize it with some random value
                 bit [7:0] header = 30;
                // Declare data (bit type , size 8), initialize it with some random value
                bit [7:0]data = 56;
                // Declare and create an instance of parity_calc_c
            parity_calc_c par_h = new;
                // Define copy method that returns packet_c class type
             function packet_c copy();
                        // Create copy instance
                        copy = new();
                        // Copy all the current class properties into copy object
                                copy.header = this.header;
               copy.data = this.data;
                                copy.par_h = this.par_h.copy();
            endfunction: copy
        endclass: packet_c
    // Declare 2 handles pkt_h1 & pkt_h2 for packet_c class 
        packet_c pkt_h1;
        packet_c pkt_h2;

        // Within initial
initial
        begin
                // Create pkt_h1 object
        pkt_h1 = new;
                // Use shallow copy method to copy pkt_h1 to pkt_h2 
        pkt_h2 = new pkt_h1;
                // Display the properties of parent class and sub class properties of pkt_h1 and pkt_h2
        $display("PERFORMING SHALLOW COPY");
        $display("pkt_h1 after shallow copy {Header = %d, Data = %d, parity = %d}", );
                // Assign random value to the header of pkt_h2

                // Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
                // observe pkt_h1.header does not change

                // Change parity of pkt_h2 using subclass handle from the parent class packet_c
                // Ex: pkt_h2.par.parity=19;

                // Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
                // observe that change reflected in pkt_h1 as the subclass handle in pkt_h1 and pkt_h2 are pointing to same subclass object

                // Perform deep copy by calling parent class copy method
                // Ex: pkt_h2=pkt_h1.copy;

                // Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
                // observe the parent and subclass properties

                // Change parity of pkt_h2
                // Ex: pkt_h2.par.parity=210;

                // Display the properties of parent class and sub-class properties of pkt_h1 and pkt_h2
                // observe that parity doesnot change for pkt_h1 as they are two different subclass objects


endmodule
