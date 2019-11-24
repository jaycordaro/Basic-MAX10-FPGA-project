module led (input logic clk,
            input logic reset_n,
            output logic led0,
	         output logic led1);

logic [24:0] counter;

 always_ff @ (posedge clk or negedge reset_n)
    begin
        if (~reset_n)
				begin
                counter <= 0;
                led0 <=0;
					 led1 <=1;
				end
        else if (counter == 24_000_000)
				begin
                led0 <= (~led0);
                counter <= 0;
					 led1 <= 0;
            end
        else
				begin
             counter <= counter + 1;
				 led1 <= 0;
				end
	end

endmodule:led