module test_array();
    int data_da[], data_da1[];
    int data_q[$], addr_q[$];
    int data_mem[bit[7:0]];
    int result, idx;
    int i;

    initial
        begin
            data_da = new[10];
            foreach(data_da[i])
                data_da[i] = {$random} % 20;
            foreach(data_da[i])
                $display("Dynamic Array Elements of data_da[%0d] = %0d", i, data_da[i]);

            $display("\n \n \n \n Array Reduction Methods -- sum, product, and, exor");
           
            result = data_da.sum();
                $display("Sum of Dynamic Array Elements is %p",  result);
            result = data_da.product();
                $display("product of Dynamic Array Elements is  %p", result);
            result = data_da.and();
                $display("And of Dynamic Array Elements is  %p", result);
            result = data_da.or();
                $display("Or of Dynamic Array Elements is  %p", result);
            result = data_da.xor();
                $display("Xor of Dynamic Array Elements is  %p",result);
    
    
           $display("\n \n \n \n Array Reduction Methods with \"with\" clause");
            
             result = data_da.sum with (int'(item >7));
              $display("Sum of Dynamic Array Elements with items greater than 7 is  %p",  result);
    
             result = data_da.sum with (item == 8);
              $display("Sum of Dynamic Array Elements with items equal to 8 is  %p",  result);

             result = data_da.product with (item < 7);
             $display("Sum of Dynamic Array Elements with items greater than 7 is  %p",  result);

             result = data_da.product with (item ==7);
             $display("Sum of Dynamic Array Elements with items equal to 7 is  %p",  result);

            result = data_da.xor with (item >7);
             $display("Sum of Dynamic Array Elements with items greater than 7 is  %p",  result);

            result = data_da.xor with (item ==7);
             $display("Xor of Dynamic Array Elements with items equal to 7 is  %p",  result);

            result = data_da.or with (item < 7);
             $display("Or of Dynamic Array Elements with items less than 7 is  %p",  result);

            result = data_da.or with (item ==10);
             $display("Or of Dynamic Array Elements with items equal to 10 is  %p",  result);

            result = data_da.and with (item > 10);
            $display("Or of Dynamic Array Elements with items equal to 10 is  %p",  result);

            result = data_da.and with (item == 10);
             $display("Or of Dynamic Array Elements with items equal to 10 is  %p",  result);

                $display("\n\n\n Basic dynamic array operations");

             $display("Size of the new array data_da is %d", data_da.size());

             data_da1 = new[30](data_da);
             $display("Dynamic Array Elements  - (appending 30 new elements and including the data_da) array of data_da1[%0d] = %0d", i, data_da1[i]);

             $display("Size of the new array data_da1 is %d", data_da1.size());

             data_da1 = new[100];
             $display("Dynamic Array Elements of data_da[%0d] = %0d", i, data_da1[i]);

             data_da1.delete();



              $display("\n\n\n Basic array sorting methods -- reverse, sort, rsort, shuffle");

            data_da.reverse();
            $display(" Reversal of Dynamic Array Elements  %p",  data_da);

             data_da.sort();
            $display(" RAscending order of Dynamic Array Elements  %p",  data_da);

            data_da.rsort();
            $display(" Descending order of Dynamic Array Elements  %p",  data_da);

            data_da.shuffle();
            $display(" Shuffling of Dynamic Array Elements  %p",  data_da);


              $display("\n\n\n Basic array Locator methods -- min, max, unique, unique_index, find, find_index, find_first, find_first_index, find_last, find_last_index");

            data_q = data_da.min();
            $display(" Minimum of Dynamic Array Elements %p",  data_q);

             data_q = data_da.max();
            $display(" Maximum order of Dynamic Array Elements %p",  data_q);

            data_q= data_da.unique();
            $display(" Unique elements of Dynamic Array Elements %p", data_q); /*     data_q= data_da.find(7);
            $display(" Find 7 from Dynamic Array Elements  %p", data_q);
            Error: This array Manipulator Method requires a with clause*/

                data_q= data_da.find_first with (int'(item >5));
            $display(" Find first item  >5  in Dynamic Array Elements %p",  data_q);

            data_q = data_da. find_first_index with (item >2);
            $display(" Find first item  >5  in Dynamic Array Elements %p",  data_q);

            data_q = data_da. find_last with (item >5);
            $display(" Find first item  >5  in Dynamic Array Elements %p", data_q);

            data_q= data_da. find_first_index with (item >10);
            $display(" Find first item  >5  in Dynamic Array Elements %p",  data_q);

            // Push 10 random address less than 100 into the queue

        repeat(10)
            begin
                    result = {$random}%100;
                    addr_q.push_back(result);
            end

            foreach(addr_q[i])
                    $display("The elements of the queue are %0p", addr_q[i]);
// idx = size(addr_q);  
$display("The elements of the queue are %0p", idx);


            $display("\n\n\nUpdate the associative array with random data less than 200 based on the address stored in the queue - Get the address using pop method");

            for (i = 0; i <10 ; i ++)     // doubt
            begin
                data_mem[addr_q.pop_front] = {$random}%200;
            end

            foreach(data_mem[i])
            $display("data_mem[%0d]", i, data_mem[i]);

            $display("\n\n\n Dispay the contents of associative array using foreach loop");

            if(data_mem.first(idx))
                $display("The first index of the associative array is %p", idx);  // doubt

                 $display("The element of first index of the associative array is %p", data_mem[idx]);

                    if(data_mem.last(idx))
                 $display("The first index of the associative array is %p", idx);

                  $display("The element of first index of the associative array  is %p", data_mem[idx]);
          
/*

 $display("The first index of the associative array is %p", data_mem.find_first_index);

            $display("The last index of the associative array is %p", data_mem.find_last_index);

            $display("The last element of the associative array is %p", data_mem.last);

            $display("The first element of the associative array is %p", data_mem.first);

            $display("The next element of the associative array is %p", data_mem.next);
*/
            $display("The number of elements in the  associative array is %p", data_mem.num);

$display("The size of the associative array is %0p",data_mem.size);
        end



endmodule
                                                                                                                                                                                          72,1          47%

