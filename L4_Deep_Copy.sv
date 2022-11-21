module test_deep_copy;
        class parity_calc_c;
                bit [7:0] parity = 30; // creating a property and allocating value
                
                function parity_calc_c copy();
                        copy = new;   
                        copy.parity = this.parity;
                endfunction: copy
                
                  // function copy is created with return type as class data type parity_calc_c
                  // copy object created in the function 
                  // The copy object contains the properties of parity_calc_c class. The property of the class parity_calc_c is assigned to the copy object
       
        endclass: parity_calc_c
        
        class packet_c;
                bit [7:0]header = 20;
                bit [7:0]data = 40;
                
                parity_calc_c par_h = new;      // an object of parity class is created in packet class with handle par_h
                
                function packet_c copy();
                        copy = new();
                        copy.header = this.header;
                        copy.data = this.data;
                        copy.par_h = this.par_h.copy();
                endfunction: packet_c
                
        endclass: packet_c
        
        packet_c pkt_h1;
        packet_c pkt_h2;
        
        
        initial
                begin
                        pkt_h1 = new;
                         // copy pkt_h1 to pkt_h2 using shallow copy method
                        pkt_h2 = new pkt_h1;
                        
                        $display("Performing Shallow Copy");
                        $display("Pkt_h1 after shallow copy {Header = %d, Data = %d, Parity = %d}", pkt_h1.header, pkt_h1.data, pkt_h1.par_h.parity);
                        $display("Pkt_h2 after shallow copy {Header = %d, Data = %d, Parity = %d}", pkt_h2.header, pkt_h2.data, pkt_h2.par_h.parity);
                        
                        pkt_h2.header = 50; // Random value is assigned to the Header, this is only for pkt_h2
                        
                        $display("CHANGING THE VALUE OF pkt_h2: pkt_h1 - header is not changes. Pkt_h1 and pkt_h2 are two different copies of packet_c objects");
                        $display("Pkt_h1 after updating header {Header = %d, Data = %d, Parity = %d}", pkt_h1.header, pkt_h1.data, pkt_h1.par_h.parity);
                        $display("Pkt_h2 after updating header {Header = %d, Data = %d, Parity = %d}", pkt_h2.header, pkt_h2.data, pkt_h2.par_h.parity);
                        
                        pkt_h2.par_h.parity = 19;
                        
                        $display("CHANGING THE VALUE OF pkt_h2: parity after shallow copy - parity of both pkt_h1 and pkt_h2 are changed since both copies are pointing to the same parity_calc_c object which implies shallow copy");
                        $display("Pkt_h1 after updating parity {Header = %d, Data = %d, Parity = %d}", pkt_h1.header, pkt_h1.data, pkt_h1.par_h.parity);
                        $display("Pkt_h2 after updating parity {Header = %d, Data = %d, Parity = %d}", pkt_h2.header, pkt_h2.data, pkt_h2.par_h.parity);
                        
                        
                        
                        
                        // Performing Deep Copy after calling parent class copy method
                        
                        pkt_h2 = pkt_h1.copy();
                        
                        // The properties of parent class and subclass properties of pkt_h1 and pkt_h2 are displayed
                        
                        $display("Performing Deep Copy");
                        $display("Pkt_h1 after deep copy {Header = %d, Data = %d, Parity = %d}", pkt_h1.header, pkt_h1.data, pkt_h1.par_h.parity);
                        $display("Pkt_h2 after deep copy {Header = %d, Data = %d, Parity = %d}", pkt_h2.header, pkt_h2.data, pkt_h2.par_h.parity);
                        
                     
                        pkt_h2.par_h.parity = 500;
                        
                        
                        $display("Displaying the properties of parent class and subclass properties of pkt_h1 and pkt_h2);
                        $display("Pkt_h1 after updating parity{Header = %d, Data = %d, Parity = %d}", pkt_h1.header, pkt_h1.data, pkt_h1.par_h.parity);
                        $display("Pkt_h2 after updating parity{Header = %d, Data = %d, Parity = %d}", pkt_h2.header, pkt_h2.data, pkt_h2.par_h.parity);
                        
                     
                
               end
       endmodule
                                 
                
