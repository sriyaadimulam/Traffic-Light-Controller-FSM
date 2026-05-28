module traffic_light_controller(

    input clk,
    input reset,

    output reg A_R,
    output reg A_Y,
    output reg A_G,

    output reg B_R,
    output reg B_Y,
    output reg B_G

);

//====================================================
// INTERNAL SLOW CLOCK
//====================================================

wire slow_clk;


//====================================================
// CLOCK DIVIDER INSTANTIATION
//====================================================

clock_divider clk_div(

    .clk(clk),
    .reset(reset),
    .slow_clk(slow_clk)

);


//====================================================
// STATE DECLARATION
//====================================================

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg [1:0] current_state, next_state;


//====================================================
// COUNTER
//====================================================

reg [3:0] counter;


//====================================================
// STATE REGISTER + COUNTER
//====================================================

always @(posedge slow_clk or posedge reset)
begin

    if(reset)
    begin
        current_state <= S0;
        counter <= 0;
    end

    else
    begin

        current_state <= next_state;

        if(current_state != next_state)
            counter <= 0;

        else
            counter <= counter + 1;

    end

end


//====================================================
// NEXT STATE LOGIC
//====================================================

always @(*)
begin

    case(current_state)

        S0:
        begin
            if(counter >= 10)
                next_state = S1;
            else
                next_state = S0;
        end

        S1:
        begin
            if(counter >= 3)
                next_state = S2;
            else
                next_state = S1;
        end

        S2:
        begin
            if(counter >= 10)
                next_state = S3;
            else
                next_state = S2;
        end

        S3:
        begin
            if(counter >= 3)
                next_state = S0;
            else
                next_state = S3;
        end

        default:
            next_state = S0;

    endcase

end


//====================================================
// OUTPUT LOGIC
//====================================================

always @(*)
begin

    // Default Outputs

    A_R = 0;
    A_Y = 0;
    A_G = 0;

    B_R = 0;
    B_Y = 0;
    B_G = 0;

    case(current_state)

        //--------------------------------------------
        // ROAD A GREEN
        //--------------------------------------------
        S0:
        begin
            A_G = 1;
            B_R = 1;
        end

        //--------------------------------------------
        // ROAD A YELLOW
        //--------------------------------------------
        S1:
        begin
            A_Y = 1;
            B_R = 1;
        end

        //--------------------------------------------
        // ROAD B GREEN
        //--------------------------------------------
        S2:
        begin
            A_R = 1;
            B_G = 1;
        end

        //--------------------------------------------
        // ROAD B YELLOW
        //--------------------------------------------
        S3:
        begin
            A_R = 1;
            B_Y = 1;
        end

    endcase

end

endmodule