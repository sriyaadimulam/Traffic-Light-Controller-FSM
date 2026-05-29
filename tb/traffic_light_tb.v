`timescale 1ns / 1ps

module traffic_light_tb;

//====================================================
// INPUTS
//====================================================

reg clk;
reg reset;


//====================================================
// OUTPUTS
//====================================================

wire A_R;
wire A_Y;
wire A_G;

wire B_R;
wire B_Y;
wire B_G;


//====================================================
// DUT INSTANTIATION
//====================================================

traffic_light_controller DUT(

    .clk(clk),
    .reset(reset),

    .A_R(A_R),
    .A_Y(A_Y),
    .A_G(A_G),

    .B_R(B_R),
    .B_Y(B_Y),
    .B_G(B_G)

);


//====================================================
// CLOCK GENERATION
//====================================================

always #5 clk = ~clk;


//====================================================
// TEST SEQUENCE
//====================================================

initial
begin

    $dumpfile("traffic.vcd");
    $dumpvars(0, traffic_light_tb);
    
    clk = 0;
    reset = 1;

    #20;
    reset = 0;

    #5000;
    
    $finish;
    
    $monitor("TIME=%0t | A_G=%b A_Y=%b A_R=%b | B_G=%b B_Y=%b B_R=%b",
    $time, A_G, A_Y, A_R, B_G, B_Y, B_R);
    
end

endmodule