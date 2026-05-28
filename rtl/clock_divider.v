module clock_divider(

    input clk,
    input reset,
    output reg slow_clk

);

//====================================================
// 100 MHz CLOCK DIVIDER
//====================================================

// 100,000,000 clock cycles = 1 second

reg [26:0] counter;

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        counter <= 0;
        slow_clk <= 0;
    end

    else
    begin

        if(counter == 1)
        begin
            slow_clk <= ~slow_clk;
            counter <= 0;
        end

        else
            counter <= counter + 1;

    end

end

endmodule